#include "script_component.hpp"

params [["_mode","playerMode"]];

if (missionNamespace getVariable [QGVAR(updateFPSRunning),false]) exitWith {};
GVAR(updateFPSRunning) = true;

private _fnc_updateFPSplayer = {
    params ["_args","_handle"];
    if (count GVAR(usersPlayerFPS) == 0) exitWith {
        GVAR(updateFPSRunning) = false;
        [player,QGVAR(playerFPS),nil] call CBA_fnc_setVarNet;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    [player,QGVAR(playerFPS),round diag_fps] call CBA_fnc_setVarNet;
};

private _fnc_updateFPSplayerHost = {
    params ["_args","_handle"];
    if (count GVAR(usersPlayerFPS) == 0) exitWith {
        GVAR(updateFPSRunning) = false;
        [player,QGVAR(playerFPS),nil] call CBA_fnc_setVarNet;
        [QGVAR(serverFPS),nil] call CBA_fnc_publicVariable;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    [player,QGVAR(playerFPS),round diag_fps] call CBA_fnc_setVarNet;
    [QGVAR(serverFPS),round diag_fps] call CBA_fnc_publicVariable;
};

private _fnc_updateFPSserver = {
    params ["_args","_handle"];
    if (count GVAR(usersPlayerFPS) == 0) exitWith {
        GVAR(updateFPSRunning) = false;
        [QGVAR(serverFPS),nil] call CBA_fnc_publicVariable;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    [QGVAR(serverFPS),round diag_fps] call CBA_fnc_publicVariable;
};

private _fnc = switch (true) do {
    case (!isServer): {_fnc_updateFPSplayer};
    case (!hasInterface): {_fnc_updateFPSserver};
    default {_fnc_updateFPSplayerHost};
};

[_fnc,2,[]] call CBA_fnc_addPerFrameHandler;
