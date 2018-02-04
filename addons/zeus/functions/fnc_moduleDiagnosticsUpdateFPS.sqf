#include "script_component.hpp"

if (missionNamespace getVariable [QGVAR(updateFPSRunning),false]) exitWith {};
GVAR(updateFPSRunning) = true;

[{
    params ["_args","_handle"];
    if (count GVAR(usersPlayerFPS) == 0) exitWith {
        GVAR(updateFPSRunning) = false;
        player setVariable [QGVAR(playerFPS),nil,true];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    player setVariable [QGVAR(playerFPS),round diag_fps,true];
},2,[]] call CBA_fnc_addPerFrameHandler;
