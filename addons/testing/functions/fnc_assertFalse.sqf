#include "script_component.hpp"

params [
    ["_x", objNull],
    ["_message", ""]
];

if (_x isEqualTo false) then {
    [STATUS_SUCCESS, _message] call FUNC(addAssertionResult);
} else {
    [STATUS_FAIL, _message] call FUNC(addAssertionResult);
}
