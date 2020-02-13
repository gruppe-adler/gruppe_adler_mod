#include "script_component.hpp"

params [
    ["_x", objNull],
    ["_message", ""]
];

if (isNil "_x") exitWith {
    if (_message == "") then {
        _message = "is defined";
    };
    [STATUS_FAIL, _message] call grad_testing_fnc_addAssertionResult;
};
if (isNull _x) exitWith {
    if (_message == "") then {
        _message = "is not null";
    };
    [STATUS_FAIL, _message] call grad_testing_fnc_addAssertionResult;
};

if (_message == "") then {
    _message = "is defined and not null";
};
[STATUS_SUCCESS, _message] call grad_testing_fnc_addAssertionResult;
