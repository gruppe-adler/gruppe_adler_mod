#include "script_component.hpp"

if ((CBA_missionTime - GVAR(lastUpdateTime)) < INTERVAL) exitWith {};
GVAR(lastUpdateTime) = CBA_missionTime;

private _falling = (typeOf vehicle ACE_player in PARACHUTES) || ((animationState player) in ["halofreefall_non","halofreefall_f","halofreefall_b"]);
private _height = ((getPosASL ACE_player) select 2);


//mask off if dead
if (!alive ACE_player) exitWith {
    [false] call FUNC(maskEffect);

    GVAR(fogEffect) = false;
    GVAR(iceEffect) = false;
    GVAR(fogEffect_committed) = true;
    GVAR(iceEffect_committed) = true;
    FOGLAYER cutRsc [QGVAR(Default),"PLAIN"];
    ICELAYER cutRsc [QGVAR(Default),"PLAIN"];
};


//handle oxygen
if (_falling && {!(vest ACE_player in MASKVESTS)}) then {
    GVAR(oxygen) = ((GVAR(oxygen) - (_height - 3500)*0.00009) min 100) max 40;
} else {
    GVAR(oxygen) = (GVAR(oxygen) + 0.2) min 100;
};


//oxygen deprivation effect
private _oxygenDep = (10 - (DEPRIVATIONTHRESHOLD - GVAR(oxygen))*0.42) max 0.4;
GVAR(oxygenDep_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[_oxygenDep,_oxygenDep,0,0,0,0.1,0.5]];
GVAR(oxygenDep_CC) ppEffectCommit INTERVAL;


//no goggles effect
if (_falling && {!((goggles ACE_player in CLOSEDGOGGLES) || (headgear ACE_player in GOGGLEHELMETS))}) then {
    private _speed = abs (vectorMagnitude (velocity ACE_player));
    private _value = 0.15 * _speed;
    if (_speed < 10) then {_value = 0};
    GVAR(noGoggles_CC) ppEffectAdjust [_value];

    [false] call FUNC(iceEffect);
    [false] call FUNC(fogEffect);

//ice and fog effects
} else {
    GVAR(noGoggles_CC) ppEffectAdjust [0];
    if (_falling && _height > 7000) then {
        [true] call FUNC(iceEffect);
    } else {
        [false] call FUNC(iceEffect);
        if (_falling && {_height < 7000} && {_height > 4000}) then {
            [true] call FUNC(fogEffect);
        } else {
            [false] call FUNC(fogEffect);
        };
    };
};
GVAR(noGoggles_CC) ppEffectCommit INTERVAL;

if (goggles ACE_player == "" && {!(headgear ACE_player in GOGGLEHELMETS)}) then {
    GVAR(fogEffect) = false;
    GVAR(iceEffect) = false;
    GVAR(fogEffect_committed) = true;
    GVAR(iceEffect_committed) = true;

    FOGLAYER cutRsc [QGVAR(Default),"PLAIN"];
    ICELAYER cutRsc [QGVAR(Default),"PLAIN"];
};


//unconsciousness
if (GVAR(oxygen) < LOCTHRESHOLD) then {
    if !(ACE_player getVariable ["ACE_isUnconscious", false]) then {
        ACE_player setVariable [QGVAR(isOxygenDep),true];
        [ACE_player, true, 99999] call ace_medical_fnc_setUnconscious;
    };
} else {
    if (ACE_player getVariable ["ACE_isUnconscious", false] && {ACE_player getVariable [QGVAR(isOxygenDep),false]}) then {
        ACE_player setVariable [QGVAR(isOxygenDep),false];
        [ACE_player, false, 10] call ace_medical_fnc_setUnconscious;
    };
};
