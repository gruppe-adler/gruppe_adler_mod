#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

private _password = profileNamespace getVariable [QGVAR(directConnectPassword),""];
private _lastConnectSuccessful = profileNamespace getVariable [QGVAR(directConnectLastConnectSuccessful),false];

if (_password == "" || !_lastConnectSuccessful) exitWith {
    (findDisplay IDD_MAIN) createDisplay QGVAR(RscDisplayDirectConnectPassword);
};

[_password] call compile preprocessFileLineNumbers '\x\grad\addons\ui\functions\directConnect\fn_connectToServer.sqf';
