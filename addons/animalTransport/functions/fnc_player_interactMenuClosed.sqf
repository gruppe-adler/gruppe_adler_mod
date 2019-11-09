#include "script_component.hpp"

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

{
    [_x, "default"] call FUNC(controlAnimal);
} forEach GVAR(stoppedAnimals);
GVAR(stoppedAnimals) = [];
