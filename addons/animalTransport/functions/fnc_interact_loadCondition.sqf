#include "script_component.hpp"

params ["_target"];

TRACE_1("interact_loadCondition with %1", _target);

(isNull (attachedTo _target)) &&
!(isNull ([_target] call FUNC(findSuitableVehicle)))
