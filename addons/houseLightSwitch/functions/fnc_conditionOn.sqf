#include "script_component.hpp"

params [
	["_fusebox", objNull, [objNull]]
];

[] call FUNC(condition) && {[_fusebox] call FUNC(isOpen)} && {_fusebox getVariable [QGVAR(mainSwitchState), true] isEqualTo false};
