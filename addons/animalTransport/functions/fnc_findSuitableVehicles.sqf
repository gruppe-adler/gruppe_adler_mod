#include "script_component.hpp"

/**
 * returns CBA hash map of vehicle to array of Space configs
 */
params [
    ["_animal", objNull]
];

assert(!(isNull _animal));

private _animalClass = typeOf _animal;

// configured vehicle classes
private _possibleVehicleClasses = [] call FUNC(getSupportedCarConfigs);
_possibleVehicleClasses = _possibleVehicleClasses apply { configName _x };

private _result = [] call cba_fnc_hashCreate;

private _nearVehicles = nearestObjects [_animal, _possibleVehicleClasses, GVAR(loadingRange), false];

{
    [
        _result,
        _x,
        ([_x, typeOf _animal] call FUNC(findSuitableSpaces))
    ] call cba_fnc_hashSet;
} forEach _nearVehicles;

_result
