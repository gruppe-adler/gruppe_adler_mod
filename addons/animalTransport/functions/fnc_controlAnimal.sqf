#include "script_component.hpp"

params [
    ["_animal", objNull],
    ["_action", "default"]
];

TRACE_2("fnc_controlAnimal: %1 => %2", _animal, _action);

assert(!isNull _animal);
assert(_action in ["stop", "default"]);

private _animalConfig = [_animal] call FUNC(getCustomConfig);
if (isNull _animalConfig) exitWith { ERROR_1("cannot handle animal %1", _animal); };

private _move = [_animalConfig, _action, ""] call BIS_fnc_returnConfigEntry;

 [_animal, _move] call ace_common_fnc_doAnimation;
