params [
    ["_vehicle", objNull]
];

if (isNull _vehicle) exitWith { diag_log "arrgh vic is null"; };

_animalSeats = _vehicle getVariable ["GRAD_animalTransport_animals", []];
{
    private _seat = _foreachIndex;
    private _animal = _x;
    if (!(isNull _animal)) then {
        detach _animal;
        _vehicle lockCargo [_seat, false];
    };
} forEach _animalSeats;
_vehicle setVariable ["GRAD_animalTransport_animals", [], true];
