#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

params [["_port", [configFile >> QGVARMAIN(CfgConnectButton),"port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry")]];

private _password = profileNamespace getVariable [QGVAR(directConnectPassword),""];
private _lastConnectSuccessful = profileNamespace getVariable [QGVAR(directConnectLastConnectSuccessful),false];

if (_password == "" || !_lastConnectSuccessful) exitWith {
    (findDisplay IDD_MAIN) createDisplay QGVAR(RscDisplayDirectConnectPassword);
    uiNamespace setVariable [QGVAR(selectedPort),_port];
};

[_password,_port] call (uiNamespace getVariable QFUNC(connectToServer));
