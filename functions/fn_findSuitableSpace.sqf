/**
 * returns configNull or suitable position
 */
params [
    ["_vehicle", objNull],
    ["_animalClass", ""]
];

assert(_animalClass != "");
assert(!(isNull _vehicle));

private _positionConfigs = "true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Vehicles" >> (typeOf _vehicle) >> _animalClass >> "Positions");

/* {unit: object, role: string, cargoIndex: number, ...}[] */
private _seats = fullCrew [_vehicle, "", true];
private _occupiedSeats = _seats select {
    _x params ["_unit"]; !(isNull _unit)
} apply {
    _x params ["", "", "_cargoIndex"];
    _cargoIndex
};

// discard where people already sit
// TODO does "select {}" work with a config, or do I need to map the _positionConfigs to an array of configs first?
_positionConfigs = _positionConfigs select {
    private _necessarySeats = [_x, "cargoIndices", []] call BIS_fnc_returnConfigEntry;
    count (_necessarySeats arrayIntersect _occupiedSeats) == 0
};

// discard places that animals already occupy
private _occupiedSpaces = _vehicle getVariable ["GRAD_animalTransport_animals", ([]  call cba_fnc_hashCreate)];
_positionConfigs = _positionConfigs select {
    !([_occupiedSpaces, configName _x] call cba_fnc_hashHasKey);
};

// return first or null
if (count _positionConfigs > 0) then {
    _positionConfigs#0
} else {
    configNull
};
