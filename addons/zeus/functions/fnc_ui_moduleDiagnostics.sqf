/*
*   Credits: PabstMirror, ACE_zeus_fnc_ui_globalSetSkill
*   Adapted for grad_zeus by McDiod
*/

#include "script_component.hpp"

disableSerialization;

params ["_control"];

private _display = ctrlparent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK

_control ctrlRemoveAllEventHandlers "setFocus";

(_display displayCtrl 27001) cbSetChecked (GVAR(DiagnosticsSettings) select 0);
(_display displayCtrl 27002) cbSetChecked (GVAR(DiagnosticsSettings) select 1);
(_display displayCtrl 27003) cbSetChecked (GVAR(DiagnosticsSettings) select 2);
(_display displayCtrl 27004) cbSetChecked (GVAR(DiagnosticsSettings) select 3);
(_display displayCtrl 27005) cbSetChecked (GVAR(DiagnosticsSettings) select 4);

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    _settings = [
        cbChecked (_display displayCtrl 27001),
        cbChecked (_display displayCtrl 27002),
        cbChecked (_display displayCtrl 27003),
        cbChecked (_display displayCtrl 27004),
        cbChecked (_display displayCtrl 27005)
    ];

    _settings call FUNC(moduleDiagnosticsOnConfirm);
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
