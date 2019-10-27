params [
    ["_vehicle", objNull],
    ["_animal", objNull]
];
assert(!(isNull _vehicle));
assert(!(isNull _animal));
assert(local _vehicle);

private _space = [_vehicle, typeOf _animal] call GRAD_animalTransport_fnc_findSuitableSpace;
if (_space == configNull) exitWith { /*halp*/ diag_log "loading failed, no open seat" };

private _necessarySeats = [_space, "cargoIndices", []] call BIS_fnc_returnConfigEntry;
{
    [_vehicle, _x, true] call GRAD_animalTransport_fnc_lockCargoIndex;
} forEach _necessarySeats;


private _seatOffset = [_space, "offset", [0, 0, 0]] call BIS_fnc_returnConfigEntry;
_animal attachTo [_vehicle, _seatOffset];

private _dir = [_space, "dir", 0] call BIS_fnc_returnConfigEntry;
_animal setDir _dir;

private _allAnimals = _vehicle getVariable ["GRAD_animalTransport_animals", ([] call cba_fnc_hashCreate)];
[_allAnimals, configName _space, _animal] call cba_fnc_hashSet;

_vehicle setVariable ["GRAD_animalTransport_animals", _allAnimals, true];
