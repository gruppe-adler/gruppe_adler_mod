#include "script_component.hpp"

params ["_on"];

if (!GVAR(fogEffect_committed)) exitWith {};

if (_on) then {
    if (!GVAR(fogEffect)) then {
        GVAR(fogEffect_committed) = false;
        [{GVAR(fogEffect) = true; GVAR(fogEffect_committed) = true}, [], FOGFADE] call CBA_fnc_waitAndExecute;
        FOGLAYER cutRsc [QGVAR(FogIn),"PLAIN"];
    };
} else {
    if (GVAR(fogEffect)) then {
        GVAR(fogEffect_committed) = false;
        [{GVAR(fogEffect) = false; GVAR(fogEffect_committed) = true}, [], FOGFADE] call CBA_fnc_waitAndExecute;
        FOGLAYER cutRsc [QGVAR(FogOut),"PLAIN"];
    };
};
