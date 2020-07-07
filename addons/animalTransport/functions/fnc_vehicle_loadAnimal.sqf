#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_animal", objNull, [objNull]],
    ["_spaceName", "", [""]]
];
assert(!(isNull _vehicle));
assert(!(isNull _animal));
assert(local _vehicle);

private _space = [_vehicle, typeOf _animal, _spaceName] call FUNC(findSuitableSpace);
if (_space == configNull) exitWith { WARNING("loading failed, no open seat %1", _spaceName); };

private _necessarySeats = [_space, "cargoIndices", []] call BIS_fnc_returnConfigEntry;
{
    [_vehicle, _x, true] call FUNC(vehicle_lockCargoIndex);
} forEach _necessarySeats;


private _seatOffset = [_space, "offset", [0, 0, 0]] call BIS_fnc_returnConfigEntry;
_animal setVariable ["ace_dragging_canCarry", false, true];
_animal attachTo [_vehicle, _seatOffset];

private _dir = [_space, "dir", 0] call BIS_fnc_returnConfigEntry;
if (_dir isEqualType 0) then {
    ["ace_common_setDir", [_animal, _dir], _animal] call CBA_fnc_targetEvent;
} else {
    ["ace_common_setVectorDirAndUp", [_animal, _dir], _animal] call CBA_fnc_targetEvent;
};


private _allAnimals = _vehicle getVariable [QGVAR(animals), ([] call cba_fnc_hashCreate)];
[_allAnimals, configName _space, _animal] call cba_fnc_hashSet;

_vehicle setVariable [QGVAR(animals), _allAnimals, true];
