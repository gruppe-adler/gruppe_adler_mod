#include "script_component.hpp"

params ["_target"];

(isNull (attachedTo _target)) &&
!(isNull ([_target] call FUNC(findSuitableVehicle)))
