#include "script_component.hpp"

params [["_ctrl",controlNull]];

private _port = [configFile >> "GRAD_CfgConnectButton","port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry");
_ctrl ctrlSetText format [localize LSTRING(DIRECTCONNECTBUTTON),_port];
