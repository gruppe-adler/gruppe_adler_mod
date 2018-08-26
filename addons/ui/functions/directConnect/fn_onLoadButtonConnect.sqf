#include "script_component.hpp"

params [["_ctrl",controlNull]];

private _port = [configFile >> QGVARMAIN(CfgConnectButton),"port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry");
_ctrl ctrlSetText format [LLSTRING(DIRECTCONNECTBUTTON),_port];
