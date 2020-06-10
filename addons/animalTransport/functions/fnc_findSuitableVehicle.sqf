#include "script_component.hpp"

params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith {
    ERROR("aagh null animal!");
    objNull
};

TRACE_1("findSuitableVehicle: %1", _animal);

private _candidates = [_animal] call FUNC(findTransportsInLoadingRange);

private _foundIdx = _candidates findIf {
    private _space = [_x, typeOf _animal] call FUNC(findSuitableSpace);
    !(isNull _space)
};

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
