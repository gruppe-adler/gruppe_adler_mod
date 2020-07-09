#include "script_component.hpp"

if (isNil "CBA_fnc_hashValues") then { // https://github.com/CBATeam/CBA_A3/pull/1350
    CBA_fnc_hashValues = {+((_this#0) select 2)};
};

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
