#include "script_component.hpp"

/*
*   Original function from ace_logistics_wirecutter by gpgpgpgp, edited by commy2, PabstMirror
*   Adapted for grad_axe by McDiod
*/

params ["_unit", "_treeObject"];

if (_unit != ACE_player) exitWith {};

private _boundingBoxTree = 0 boundingBox _treeObject;
private _treeSize = (_boundingBoxTree select 0) distance (_boundingBoxTree select 1);
private _specialistFactor = SPECIALIST_FACTOR select ([_unit] call ace_common_fnc_isEngineer);
private _timeToCut = (_treeSize * _specialistFactor * ([QGVAR(setting_timeFactor)] call CBA_settings_fnc_get)) min ([QGVAR(setting_maxTime)] call CBA_settings_fnc_get) max 5;

if !(_unit call ace_common_fnc_isSwimming) then {
    [_unit, "Acts_Executioner_Forehand", 0] call ace_common_fnc_doAnimation;
};

private _helpers = [];
{
    private _obj  = "Sign_Sphere10cm_F" createVehicle [0,0,0];
    _obj setObjectTexture [0, _x];

    _helpers pushBack _obj;
}forEach [
    "#(argb,8,8,3)color(1,1,1,1)", 
    "#(argb,8,8,3)color(1,1,0,1)", 
    "#(argb,8,8,3)color(0,1,1,1)", 
    "#(argb,8,8,3)color(1,0,0,1)", 
    "#(argb,8,8,3)color(1,0,1,1)", 
    "#(argb,8,8,3)color(1,0,0,1)", 
    "#(argb,8,8,3)color(0,0,1,1)", 
    "#(argb,8,8,3)color(0,1,0,1)"
];

private _boundingBox = 0 boundingBoxReal _treeObject;
_boundingBox params ["_lbfc", "_rtbc"];
_lbfc params ["_x1", "_x2", "_x3"];
_rtbc params ["_y1", "_y2", "_y3"];

private _positions = [
    [_x1, _x2, _x3], 
    [_x1, _x2, _y3], 
    [_x1, _y2, _x3], 
    [_y1, _x2, _x3], 
    [_x1, _y2, _y3], 
    [_y1, _y2, _x3], 
    [_y1, _x2, _y3],
    [_y1, _y2, _y3]
];

{
    _x attachTo [_treeObject, (_positions select _forEachIndex)];
}forEach _helpers;


private _onCompletion = {
    (_this select 0) params ["_treeObject", "", "_unit"];
    private _oldPos = getPosWorld _treeObject;
    _treeObject setdamage 1;
    [_treeObject, _oldPos] call FUNC(checkCutDown);

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
        playSound3D [format ["x\grad\addons\axe\sound\chop_%1.ogg", (round(random 25)) +1], objNull, false, (getPosASL _unit), 3, 1, 80];
        _args set [1, _passedTime];
    };

    ((!isNull _treeObject) && {(damage _treeObject) < 1} && {("grad_axe" in (items _unit))})
};

[_timeToCut, [_treeObject,0,_unit], _onCompletion, _onFail, localize "STR_GRAD_AXE_CUTTING_TREE", _progressCheck, ["isNotSwimming"]] call ace_common_fnc_progressBar;

["grad_treeChoppingStarted", [_unit, _treeObject]] call CBA_fnc_globalEvent;
