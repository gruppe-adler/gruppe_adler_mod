#include "script_component.hpp"

params ["_target"];

private _vehicle = [_target] call FUNC(findSuitableVehicle);
[QGVAR(vehicle_loadAnimal), [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
