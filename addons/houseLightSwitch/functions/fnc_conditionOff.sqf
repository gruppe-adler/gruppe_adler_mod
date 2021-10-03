#include "script_component.hpp"

[] call FUNC(condition) && {GVAR(house) getVariable [QGVAR(mainSwitchState), true] isEqualTo true};
