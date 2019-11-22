#include "script_component.hpp"

params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith {
    ERROR("aagh null animal!");
    objNull
};

TRACE_1("findSuitableVehicle: %1", _animal);

// configured vehicle classes
_possibleVehicleClasses = [] call FUNC(getSupportedCarConfigs);
_possibleVehicleClassNames = _possibleVehicleClasses apply { configName _x};
private _candidates = nearestObjects [_animal, _possibleVehicleClassNames, GVAR(loadingRange), false];

private _foundIdx = _candidates findIf {
    !(isNull ([_x, typeOf _animal] call FUNC(findSuitableSpace)));
};

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
