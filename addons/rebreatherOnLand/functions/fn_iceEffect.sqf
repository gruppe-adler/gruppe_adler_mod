#include "..\defines.hpp"

params ["_on"];

if (!grad_rebreatherOnLand_iceEffect_committed) exitWith {};

if (_on) then {
    if (!grad_rebreatherOnLand_iceEffect) then {
        grad_rebreatherOnLand_iceEffect_committed = false;
        [{grad_rebreatherOnLand_iceEffect = true; grad_rebreatherOnLand_iceEffect_committed = true}, [], ICEFADE] call CBA_fnc_waitAndExecute;
        ICELAYER cutRsc ["ga_rebreatherOnLand_RscIceIn","PLAIN"];
    };
} else {
    if (grad_rebreatherOnLand_iceEffect) then {
        grad_rebreatherOnLand_iceEffect_committed = false;
        [{grad_rebreatherOnLand_iceEffect = false; grad_rebreatherOnLand_iceEffect_committed = true}, [], ICEFADE] call CBA_fnc_waitAndExecute;
        ICELAYER cutRsc ["ga_rebreatherOnLand_RscIceOut","PLAIN"];
    };
};
