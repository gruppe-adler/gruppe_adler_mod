#include "script_component.hpp"

params ["_target"];

TRACE("interact_loadCondition");

(isNull (attachedTo _target)) &&
!(isNull ([_target] call FUNC(findSuitableVehicle)))
