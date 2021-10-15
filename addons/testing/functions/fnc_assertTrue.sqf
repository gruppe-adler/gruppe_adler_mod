#include "script_component.hpp"

params [
    ["_x", objNull],
    ["_message", ""]
];

if (_x isEqualTo true) then {
    [STATUS_SUCCESS, _message] call grad_testing_fnc_addAssertionResult;
} else {
    [STATUS_FAIL, _message] call grad_testing_fnc_addAssertionResult;
}
