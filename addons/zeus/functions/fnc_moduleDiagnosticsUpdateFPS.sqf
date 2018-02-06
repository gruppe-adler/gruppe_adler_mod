#include "script_component.hpp"

if (missionNamespace getVariable [QGVAR(updateFPSRunning),false]) exitWith {};
GVAR(updateFPSRunning) = true;

[{
    params ["_args","_handle"];
    if (count GVAR(usersPlayerFPS) == 0) exitWith {
        GVAR(updateFPSRunning) = false;
        [player,QGVAR(playerFPS),nil] call CBA_fnc_setVarNet;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    [player,QGVAR(playerFPS),round diag_fps] call CBA_fnc_setVarNet;
},2,[]] call CBA_fnc_addPerFrameHandler;
