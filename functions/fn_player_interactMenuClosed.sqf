#define SELF_INTERACT 1
#define INTERACT 0

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

{
    [_x, "default"] call GRAD_animalTransport_fnc_controlAnimal;
} forEach GRAD_animalTransport_stoppedAnimals;
GRAD_animalTransport_stoppedAnimals = [];
