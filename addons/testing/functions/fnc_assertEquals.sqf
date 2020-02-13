#include "script_component.hpp"

params [
    ["_a", scriptNull],
    ["_b", scriptNull],
    ["_message", ""]
];

if (_message == "") then {
    _message = format ["%1 == %2", _a, _b];
};

if (_a isEqualTo _b) then {
    [STATUS_SUCCESS, _message] call grad_testing_fnc_addAssertionResult;
} else {
    [STATUS_FAIL, _message] call grad_testing_fnc_addAssertionResult;
}
