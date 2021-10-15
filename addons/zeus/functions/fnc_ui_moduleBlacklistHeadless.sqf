#include "script_component.hpp"

/*
*   Credits: PabstMirror, ACE_zeus_fnc_ui_globalSetSkill
*   Adapted for grad_zeus by McDiod
*/


disableSerialization;

params ["_control"];

private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK

_control ctrlRemoveAllEventHandlers "setFocus";

private _combo = _display displayCtrl 84501;
_combo lbAdd localize LSTRING(moduleBlacklistDontMove);
_combo lbAdd localize LSTRING(moduleBlacklistPlayer);
_combo lbAdd localize LSTRING(moduleBlacklistServer);
_combo lbSetCurSel 0;


private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
private _current = (group _unit) getVariable ["acex_headless_blacklist",false];
private _checkBox = _display displayCtrl 84502;
_checkBox cbSetChecked _current;


private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];

    private _display = ctrlParent _ctrlButtonOK;
    private _combo = _display displayCtrl 84501;
    private _checkBox = _display displayCtrl 84502;

    [cbChecked _checkBox,lbCurSel _combo,_unit] call FUNC(moduleBlacklistHeadlessOnConfirm);

    false
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
