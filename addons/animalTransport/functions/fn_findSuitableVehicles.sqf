/**
 * returns CBA hash map of vehicle to array of Space configs
 */
params [
    ["_animal", objNull]
];

assert(!(isNull _animal));

private _vehiclesConfigPath = missionConfigFile >> "GRAD_animalTransport" >> "Vehicles";
private _animalClass = typeOf _animal;

// configured vehicle classes
_possibleVehicleClasses = ("true" configClasses(_vehiclesConfigPath)) select {
    !isNull(_x >> _animalClass)
} apply {
    configName _x
};

private _result = [] call cba_fnc_hashCreate;

private _nearVehicles = nearestObjects [_animal, _possibleVehicleClasses, GRAD_animalTransport_loadingRange, false];

{
    [
        _result,
        _x,
        ([_x, typeOf _animal] call GRAD_animalTransport_fnc_findSuitableSpaces)
    ] call cba_fnc_hashSet;
} forEach _nearVehicles;

_result
