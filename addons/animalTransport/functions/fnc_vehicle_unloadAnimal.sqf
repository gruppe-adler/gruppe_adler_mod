#include "script_component.hpp"

params [
    ["_animal", objNull, [objNull]],
    ["_instigator", objNull, [objNull]]
];

if (isNull _animal) exitWith { ERROR("arrgh animal to be unloaded is null"); };

_vehicle = attachedTo _animal;

if (isNull _vehicle) exitWith { ERROR("arrgh animal is already unattached"); };


private _emptyHash = ([] call cba_fnc_hashCreate);
private _spaces = ([_vehicle] call FUNC(getCustomConfig)) >> typeOf _animal >> "Spaces";

private _animals = _vehicle getVariable [QGVAR(animals), _emptyHash];

private _seatsOccupiedByOthers = [];
private _seatsOccupiedByMe = [];

[_animals, {
    private _cargoIndices = ([_spaces >> _key, "cargoIndices", []] call BIS_fnc_returnConfigEntry);
    if (_value != _animal) then {
        _seatsOccupiedByOthers = _seatsOccupiedByOthers + _cargoIndices;
        true
    } else {
        [_vehicle, _animal] call FUNC(vehicle_unloadAnimalDetach);
        [QGVAR(animal_unloaded), [_vehicle, _animal, _instigator]] call CBA_fnc_localEvent;
        _seatsOccupiedByMe = _cargoIndices;
        false
    }
}] call CBA_fnc_hashFilter; /*remove the animal in question*/

{
    [_vehicle, _x, false] call FUNC(vehicle_lockCargoIndex);
} forEach (_seatsOccupiedByMe - _seatsOccupiedByOthers);

_vehicle setVariable [QGVAR(animals), _animals, true];
