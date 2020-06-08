#include "script_component.hpp"

/*
*   Credits: PabstMirror, ACE_zeus_fnc_ui_globalSetSkill
*   Adapted for grad_zeus by McDiod
*/


disableSerialization;

params ["_control"];

private _display = ctrlparent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK

_control ctrlRemoveAllEventHandlers "setFocus";

private _combo = _display displayCtrl 92100;
{
    _combo lbSetValue [_combo lbAdd (_x select 0),_x select 1];
} forEach [
    ["BLUFOR", 0],
    ["OPFOR", 1],
    ["INDEPENDENT", 2],
    ["CIVILIAN", 3]
];
_combo lbSetCurSel 0;

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _combo = _display displayCtrl 92100;
    private _pos = getPosASL _logic;
    _pos resize 2;

    [_pos,_combo lbValue (lbCurSel _combo)] call FUNC(moduleMoveRespawnOnConfirm);

    false
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
