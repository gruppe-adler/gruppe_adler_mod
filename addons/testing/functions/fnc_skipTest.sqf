#include "script_component.hpp"

params [
    ["_message", ""]
];

[STATUS_SKIPPED, _message] call grad_testing_fnc_addAssertionResult;
