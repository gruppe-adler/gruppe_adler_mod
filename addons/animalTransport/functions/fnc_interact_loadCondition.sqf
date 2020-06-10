#include "script_component.hpp"

params ["_target"];

TRACE_1("interact_loadCondition with %1", _target);

if (isNull (attachedTo _target)) then {
    !(isNull ([_target] call FUNC(findSuitableVehicle)))
} else {
    false
};
