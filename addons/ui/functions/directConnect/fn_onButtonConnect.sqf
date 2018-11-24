#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

params [["_port", [configFile >> QGVARMAIN(CfgConnectButton),"port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry")]];

uiNamespace setVariable [QGVAR(selectedPort),_port];
[_port] call (uiNamespace getVariable QFUNC(connectToServer));
