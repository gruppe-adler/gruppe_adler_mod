#include "script_component.hpp"
#define SELF_INTERACT 1
#define INTERACT 0

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

{
    [QGVAR(animal_released), _x, _x] call CBA_fnc_targetEvent;
} forEach GVAR(stoppedAnimals);
GVAR(stoppedAnimals) = [];
