#include "script_component.hpp"

params ["_on"];

if (!GVAR(iceEffect_committed)) exitWith {};

if (_on) then {
    if (!GVAR(iceEffect)) then {
        GVAR(iceEffect_committed) = false;
        [{GVAR(iceEffect) = true; GVAR(iceEffect_committed) = true}, [], ICEFADE] call CBA_fnc_waitAndExecute;
        ICELAYER cutRsc [QGVAR(IceIn),"PLAIN"];
    };
} else {
    if (GVAR(iceEffect)) then {
        GVAR(iceEffect_committed) = false;
        [{GVAR(iceEffect) = false; GVAR(iceEffect_committed) = true}, [], ICEFADE] call CBA_fnc_waitAndExecute;
        ICELAYER cutRsc [QGVAR(IceOut),"PLAIN"];
    };
};
