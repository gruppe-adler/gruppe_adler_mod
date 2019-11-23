#include "script_component.hpp"
#define SELF_INTERACT 1
#define INTERACT 0

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

{
    [_x, "default"] call FUNC(controlAnimal);
} forEach GVAR(stoppedAnimals);
GVAR(stoppedAnimals) = [];
