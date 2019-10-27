params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith { diag_log "arrgh animal to be unloaded is null"; };

_vehicle = attachedTo _animal;

if (isNull _vehicle) exitWith { diag_log "arrgh animal is already unattached"; };


private _emptyHash = ([] call cba_fnc_hashCreate);
private _positionConfigs = missionConfigFile >> "GRAD_animalTransport" >> "Vehicles" >> typeOf _vehicle >> _animalClass >> "Positions";

private _animals = _vehicle getVariable ["GRAD_animalTransport_animals", _emptyHash];

private _seatsOccupiedByOthers = [];
private _seatsOccupiedByMe = [];

[_animals, {
    if (_value != _animal) then {
        _seatsOccupiedByOthers = _seatsOccupiedByOthers + ([_config, _key, []] call BIS_fnc_returnConfigEntry);
        true
    } else {
        [_vehicle, _animal] call GRAD_animalTransport_fnc_unloadSingleAnimalDetach;
        _seatsOccupiedByMe = ([_config, _key, []] call BIS_fnc_returnConfigEntry);
        false
    }
}] call CBA_fnc_hashFilter;

{
        [_vehicle, _x, false] call GRAD_animalTransport_fnc_lockCargoIndex;
} forEach (_seatsOccupiedByMe - _seatsOccupiedByOthers);

_vehicle setVariable ["GRAD_animalTransport_animals", _animals, true];
