#include "script_component.hpp"

/**
 * returns array of open Spaces
 */
params [
    ["_vehicle", objNull],
    ["_animalClass", ""]
];

assert(_animalClass != "");
assert(!(isNull _vehicle));

private _customVehicleConfig = [_vehicle] call FUNC(getCustomConfig);
if (isNull _customVehicleConfig) exitWith {
    []
};
private _spaces = "true" configClasses(_customVehicleConfig >> _animalClass >> "Spaces");

/* {unit: object, role: string, cargoIndex: number, ...}[] */
private _seats = fullCrew [_vehicle, "", true];
private _occupiedSeats = _seats select {
    _x params ["_unit"]; !(isNull _unit)
} apply {
    _x params ["", "", "_cargoIndex"];
    _cargoIndex
};

// discard where people already sit
_spaces = _spaces select {
    private _necessarySeats = [_x, "cargoIndices", []] call BIS_fnc_returnConfigEntry;
    count (_necessarySeats arrayIntersect _occupiedSeats) == 0
};

// discard places that animals already occupy
private _occupiedSpaces = _vehicle getVariable [QGVAR(animals), ([]  call cba_fnc_hashCreate)];

_spaces select {
    !([_occupiedSpaces, configName _x] call cba_fnc_hashHasKey);
};
