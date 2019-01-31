#include "script_component.hpp"
params ["_unit", "_helper"];

if (_unit != ACE_player) exitWith {};

private _treeObject = (attachedObjects _helper) select 0;
private _boundingBoxTree = boundingBox _treeObject;
private _treeSize = (_boundingBoxTree select 0) distance (_boundingBoxTree select 1);
private _specialistFactor = SPECIALIST_FACTOR select ([_unit] call ace_common_fnc_isEngineer);
private _timeToCut = (_treeSize * _specialistFactor * GVAR(setting_timeFactor)) min GVAR(setting_maxTime) max 5;

if !(_unit call ace_common_fnc_isSwimming) then {
    [_unit, "Acts_Executioner_Forehand", 0] call ace_common_fnc_doAnimation;
};

private _onCompletion = {
    (_this select 0) params ["_treeObject", "", "_unit", "_helper"];
    deleteVehicle _treeObject;
    deleteVehicle _helper;
    if !(_unit call ace_common_fnc_isSwimming) then {
        [_unit, "AmovPknlMstpSrasWrflDnon", 1] call ace_common_fnc_doAnimation;
    };
};

private _onFail = {
    (_this select 0) params ["", "", "_unit"];
    if !(_unit call ace_common_fnc_isSwimming) then {
        [_unit, "AmovPknlMstpSrasWrflDnon", 1] call ace_common_fnc_doAnimation;
    };
};

private _progressCheck = {
    params ["_args", "_passedTime"];
    _args params ["_treeObject", "_lastSoundEffectTime", "_unit"];

    if (_passedTime > (_lastSoundEffectTime + SOUND_CLIP_TIME_SPACEING)) then {
        playSound3D [QPATHTOF(sound\chop.ogg), objNull, false, (getPosASL _unit), 1, 1, 80];
        _args set [1, _passedTime];
    };

    ((!isNull _treeObject) && {("grad_axe" in (items _unit))})
};

[_timeToCut, [_treeObject,0,_unit,_helper], _onCompletion, _onFail, localize "STR_GRAD_AXE_CUTTING_TREE", _progressCheck, ["isNotSwimming"]] call ace_common_fnc_progressBar;
