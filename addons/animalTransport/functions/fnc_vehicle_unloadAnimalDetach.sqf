#include "script_component.hpp"

params [
    "_vehicle",
    "_animal"
];

private _unloadPoint = [
    [_vehicle] call FUNC(getCustomConfig),
    "unloadPoint",
    [0, 0, 0]
] call BIS_fnc_returnConfigEntry;

_animal attachTo [_vehicle, _unloadPoint];
detach _animal;
_animal setDir ((getDir _vehicle) - 180);
