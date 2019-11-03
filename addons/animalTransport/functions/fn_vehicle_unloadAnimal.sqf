params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith { diag_log "arrgh animal to be unloaded is null"; };

_vehicle = attachedTo _animal;

if (isNull _vehicle) exitWith { diag_log "arrgh animal is already unattached"; };


private _emptyHash = ([] call cba_fnc_hashCreate);
private _spaces = missionConfigFile >> "GRAD_animalTransport" >> "Vehicles" >> typeOf _vehicle >> typeOf _animal >> "Spaces";

private _animals = _vehicle getVariable ["GRAD_animalTransport_animals", _emptyHash];

private _seatsOccupiedByOthers = [];
private _seatsOccupiedByMe = [];

[_animals, {
    private _cargoIndices = ([_spaces >> _key, "cargoIndices", []] call BIS_fnc_returnConfigEntry);
    if (_value != _animal) then {
        _seatsOccupiedByOthers = _seatsOccupiedByOthers + _cargoIndices;
        true
    } else {
        [_vehicle, _animal] call GRAD_animalTransport_fnc_vehicle_unloadAnimalDetach;
        _seatsOccupiedByMe = _cargoIndices;
        false
    }
}] call CBA_fnc_hashFilter; /*remove the animal in question*/

{
        [_vehicle, _x, false] call GRAD_animalTransport_fnc_vehicle_lockCargoIndex;
} forEach (_seatsOccupiedByMe - _seatsOccupiedByOthers);

_vehicle setVariable ["GRAD_animalTransport_animals", _animals, true];
