params [
    ["_vehicle", objNull],
    ["_animal", objNull]
];

private _seat = [_vehicle] call GRAD_animalTransport_fnc_findSuitableSeat;
if (_seat == -1) exitWith { /*halp*/ diag_log "loading failed, no open seat" };

private _seatOffset = [_vehicle, _seat] call GRAD_animalTransport_getCargoPositionOffset;

_vehicle lockCargo [_seat, true];
_animal attachTo [_vehicle, _seatOffset]; // are there _memPoints for vehicles?

// alas, this is not network safe
private _allAnimals = _vehicle getVariable ["GRAD_animalTransport_animals", []];
_allAnimals set [_seatOffset, _animal];

_vehicle setVariable ["GRAD_animalTransport_animals", _allAnimals, true];
