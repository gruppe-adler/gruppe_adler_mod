#include "..\defines.hpp"

if ((CBA_missionTime - grad_rebreatherOnLand_lastUpdateTime) < INTERVAL) exitWith {};
grad_rebreatherOnLand_lastUpdateTime = CBA_missionTime;

private _falling = (typeOf vehicle ACE_player in PARACHUTES) || ((animationState player) in ["halofreefall_non","halofreefall_f","halofreefall_b"]);
private _height = ((getPosASL ACE_player) select 2);


//mask off if dead
if (!alive ACE_player) exitWith {
    [false] call grad_rebreatherOnLand_fnc_maskEffect;

    grad_rebreatherOnLand_fogEffect = false;
    grad_rebreatherOnLand_iceEffect = false;
    grad_rebreatherOnLand_fogEffect_committed = true;
    grad_rebreatherOnLand_iceEffect_committed = true;
    FOGLAYER cutRsc ["ga_rebreatherOnLand_RscDefault","PLAIN"];
    ICELAYER cutRsc ["ga_rebreatherOnLand_RscDefault","PLAIN"];
};


//handle oxygen
if (_falling && {!(vest ACE_player in MASKVESTS)}) then {
    grad_rebreatherOnLand_oxygen = ((grad_rebreatherOnLand_oxygen - (_height - 3500)*0.00009) min 100) max 40;
} else {
    grad_rebreatherOnLand_oxygen = (grad_rebreatherOnLand_oxygen + 0.2) min 100;
};


//oxygen deprivation effect
private _oxygenDep = (10 - (DEPRIVATIONTHRESHOLD - grad_rebreatherOnLand_oxygen)*0.42) max 0.4;
grad_rebreatherOnLand_oxygenDep_CC ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[_oxygenDep,_oxygenDep,0,0,0,0.1,0.5]];
grad_rebreatherOnLand_oxygenDep_CC ppEffectCommit INTERVAL;


//no goggles effect
if (_falling && {!((goggles ACE_player in CLOSEDGOGGLES) || (headgear ACE_player in GOGGLEHELMETS))}) then {
    private _speed = abs (vectorMagnitude (velocity ACE_player));
    private _value = 0.15 * _speed;
    if (_speed < 10) then {_value = 0};
    grad_rebreatherOnLand_noGoggles_CC ppEffectAdjust [_value];

    [false] call grad_rebreatherOnLand_fnc_iceEffect;
    [false] call grad_rebreatherOnLand_fnc_fogEffect;

//ice and fog effects
} else {
    grad_rebreatherOnLand_noGoggles_CC ppEffectAdjust [0];
    if (_falling && _height > 7000) then {
        [true] call grad_rebreatherOnLand_fnc_iceEffect;
    } else {
        [false] call grad_rebreatherOnLand_fnc_iceEffect;
        if (_falling && {_height < 7000} && {_height > 4000}) then {
            [true] call grad_rebreatherOnLand_fnc_fogEffect;
        } else {
            [false] call grad_rebreatherOnLand_fnc_fogEffect;
        };
    };
};
grad_rebreatherOnLand_noGoggles_CC ppEffectCommit INTERVAL;

if (goggles ACE_player == "" && {!(headgear ACE_player in GOGGLEHELMETS)}) then {
    grad_rebreatherOnLand_fogEffect = false;
    grad_rebreatherOnLand_iceEffect = false;
    grad_rebreatherOnLand_fogEffect_committed = true;
    grad_rebreatherOnLand_iceEffect_committed = true;

    FOGLAYER cutRsc ["ga_rebreatherOnLand_RscDefault","PLAIN"];
    ICELAYER cutRsc ["ga_rebreatherOnLand_RscDefault","PLAIN"];
};


//unconsciousness
if (grad_rebreatherOnLand_oxygen < LOCTHRESHOLD) then {
    if !(ACE_player getVariable ["ACE_isUnconscious", false]) then {
        ACE_player setVariable ["grad_rebreatherOnLand_isOxygenDep",true];
        [ACE_player, true, 99999] call ace_medical_fnc_setUnconscious;
    };
} else {
    if (ACE_player getVariable ["ACE_isUnconscious", false] && {ACE_player getVariable ["grad_rebreatherOnLand_isOxygenDep",false]}) then {
        ACE_player setVariable ["grad_rebreatherOnLand_isOxygenDep",false];
        [ACE_player, false, 10] call ace_medical_fnc_setUnconscious;
    };
};
