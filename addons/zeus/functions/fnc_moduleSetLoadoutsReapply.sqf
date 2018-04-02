#include "script_component.hpp"

params ["_side","_faction","_loadout"];

[_faction,_loadout] call GRAD_Loadout_fnc_FactionSetLoadout;

{
    if (local _x && {side _x == _side} && {faction _x == _faction}) then {
        [_x] call GRAD_Loadout_fnc_doLoadoutForUnit;
    };
    false
} count allUnits;
