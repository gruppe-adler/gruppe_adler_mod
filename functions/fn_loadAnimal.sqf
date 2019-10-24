params [
    ["_vehicle", objNull],
    ["_animal", objNull]
];

private _seat = [_vehicle] call GRAD_animalTransport_fnc_findSuitableSeat;
if (_seat == -1) exitWith { /*halp*/ diag_log "loading failed, no open seat" };

_vehicle lockCargo [_seat, true];

private _seatOffset = [_vehicle, _seat] call GRAD_animalTransport_fnc_getCargoPositionOffset;
_animal attachTo [_vehicle, _seatOffset]; // are there _memPoints for vehicles?

// alas, this is not network safe
private _allAnimals = _vehicle getVariable ["GRAD_animalTransport_animals", []];
_allAnimals set [_seat, _animal];

_vehicle setVariable ["GRAD_animalTransport_animals", _allAnimals, true];
