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
