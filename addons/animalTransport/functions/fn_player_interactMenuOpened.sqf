#define SELF_INTERACT 1
#define INTERACT 0

params [
    ["_menuType", -1]
];

if (_menuType != INTERACT) exitWith {};

private _menuTarget = cursorObject;

if (isNull _menuTarget) exitWith {};
private _className = typeOf _menuTarget;
private _configuredAnimals = ("true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Animals")) apply { configName _x };

if (_className in _configuredAnimals) then {
    GRAD_animalTransport_stoppedAnimals pushBack _menuTarget;
    [_menuTarget, "stop"] call GRAD_animalTransport_fnc_controlAnimal;
};
