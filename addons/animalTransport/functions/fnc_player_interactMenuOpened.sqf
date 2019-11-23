#include "script_component.hpp"
#define SELF_INTERACT 1
#define INTERACT 0

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

private _menuTarget = cursorObject;

if (isNull _menuTarget) exitWith {};
if !(_menuTarget isKindOf "Animal_Base_F") exitWith {};

private _className = typeOf _menuTarget;
private _customConfig = [_menuTarget] call FUNC(getCustomConfig);
if (isNull _customConfig) exitWith {};

GVAR(stoppedAnimals) pushBack _menuTarget;

[_menuTarget, "stop"] call FUNC(controlAnimal);
