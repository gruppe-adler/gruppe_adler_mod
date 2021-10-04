#include "script_component.hpp"

params [
	["_fusebox", objNull, [objNull]]
];

[] call FUNC(condition) && {_fusebox getVariable [QGVAR(mainSwitchState), true] isEqualTo true};
