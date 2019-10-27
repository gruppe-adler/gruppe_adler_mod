params [
    ["_vehicle", objNull]
];

if (isNull _vehicle) exitWith { diag_log "arrgh vic is null"; };

private _emptyHash = ([] call cba_fnc_hashCreate);
private _animals = _vehicle getVariable ["GRAD_animalTransport_animals", _emptyHash];
[_animals, {
    [_vehicle, _value] call GRAD_animalTransport_fnc_unloadSingleAnimalDetach;
}] call CBA_fnc_hashEachPair;

// unlock ALL the seats (DANGER side effect of this module - no check if seat was locked before animals came on board)
private _seats = fullCrew [_vehicle, "", true];
{
    _x params ["_unit", "_type", "_cargoIndex"];
    [_vehicle, _cargoIndex, false] call GRAD_animalTransport_fnc_lockCargoIndex;
} forEach _seats;

_vehicle setVariable ["GRAD_animalTransport_animals", _emptyHash, true];
