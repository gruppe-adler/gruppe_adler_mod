/**
 * returns cargo index where an animal could find a seat
 */
params [
    ["_vehicle", objNull],
    ["_role", "cargo"]
];

private _numEmpty = _vehicle emptyPositions _role;
if (_numEmpty == 0) exitWith { false };

/* {unit: object, role: string, cargoIndex: number, ...}[] */
private _seats = fullCrew [_vehicle, _role];

_seats findIf {
    _x params ["_unit", "_role", "_cargoIndex"];
    isNull _unit &&  (!(_vehicle lockedCargo _cargoIndex))
};
