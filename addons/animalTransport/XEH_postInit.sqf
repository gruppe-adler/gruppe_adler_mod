#include "script_component.hpp"

[QGVAR(vehicle_loadAnimal), {
    scriptName QGVAR(vehicle_loadAnimal);
    _this call FUNC(vehicle_loadAnimal);
}] call CBA_fnc_addEventHandler;

[QGVAR(vehicle_unloadAnimal), {
    scriptName QGVAR(vehicle_unloadAnimal);
    _this call FUNC(vehicle_unloadAnimal);
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
    scriptName QGVAR(ace_interactMenuOpened);
    _this call FUNC(player_interactMenuOpened)
}] call CBA_fnc_addEventHandler;

["ace_interactMenuClosed", {
    scriptName QGVAR(ace_interactMenuClosed);
    _this call FUNC(player_interactMenuClosed)
}] call CBA_fnc_addEventHandler;

[QGVAR(animal_stopped), {
    scriptName QGVAR(animal_stopped);
    [_this, "stop"] call FUNC(controlAnimal)
}] call CBA_fnc_addEventHandler;

[QGVAR(animal_released), {
    scriptName QGVAR(animal_released);
    [_this, "default"] call FUNC(controlAnimal)
}] call CBA_fnc_addEventHandler;

[QGVAR(animal_unloadAnimalDetach), {
    scriptName QGVAR(animal_unload);
    _this call FUNC(animal_unloadAnimalDetach);
}] call CBA_fnc_addEventHandler;
