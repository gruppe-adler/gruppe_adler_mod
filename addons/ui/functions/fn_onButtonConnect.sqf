#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

private _password = profileNamespace getVariable ["grad_ui_directConnectPassword",""];
private _lastConnectSuccessful = profileNamespace getVariable ["grad_ui_directConnectLastConnectSuccessful",false];

if (_password == "" || !_lastConnectSuccessful) exitWith {
    (findDisplay IDD_MAIN) createDisplay "grad_RscDisplayDirectConnectPassword";
};

[_password] call compile preprocessFileLineNumbers '\x\grad\addons\ui\functions\fn_connectToServer.sqf';
