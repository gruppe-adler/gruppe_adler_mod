#include "..\defines.hpp"

params ["_on"];

if (!grad_rebreatherOnLand_fogEffect_committed) exitWith {};

if (_on) then {
    if (!grad_rebreatherOnLand_fogEffect) then {
        grad_rebreatherOnLand_fogEffect_committed = false;
        [{grad_rebreatherOnLand_fogEffect = true; grad_rebreatherOnLand_fogEffect_committed = true}, [], FOGFADE] call CBA_fnc_waitAndExecute;
        FOGLAYER cutRsc ["ga_rebreatherOnLand_RscFogIn","PLAIN"];
    };
} else {
    if (grad_rebreatherOnLand_fogEffect) then {
        grad_rebreatherOnLand_fogEffect_committed = false;
        [{grad_rebreatherOnLand_fogEffect = false; grad_rebreatherOnLand_fogEffect_committed = true}, [], FOGFADE] call CBA_fnc_waitAndExecute;
        FOGLAYER cutRsc ["ga_rebreatherOnLand_RscFogOut","PLAIN"];
    };
};
