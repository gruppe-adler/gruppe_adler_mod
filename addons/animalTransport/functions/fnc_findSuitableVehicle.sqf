#include "script_component.hpp"

params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith {
    ERROR("aagh null animal!");
    objNull
};

// configured vehicle classes
_possibleVehicleClasses = [] call FUNC(getSupportedCarConfigs);
_possibleVehicleClassNames = _possibleVehicleClasses apply { configName _x};
private _candidates = nearestObjects [_animal, _possibleVehicleClassNames, GRAD_animalTransport_loadingRange, false];

private _foundIdx = _candidates findIf {
    !(isNull ([_x, typeOf _animal] call FUNC(findSuitableSpace)));
};

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
