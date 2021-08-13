#include "script_component.hpp"

params [
    ["_a", scriptNull],
    ["_b", scriptNull],
    ["_message", ""]
];

if (_message == "") then {
    _message = format ["%1 > %2", _a, _b];
};

if (typeName _a != "SCALAR") exitWith {
    [STATUS_ERROR, "first parameter is not a number"] call FUNC(addAssertionResult);
};
if (typeName _b != "SCALAR") exitWith {
    [STATUS_ERROR, "second parameter is not a number"] call FUNC(addAssertionResult);
};

if (_a > _b) then {
    [STATUS_SUCCESS, _message] call FUNC(addAssertionResult);
} else {
    [STATUS_FAIL, _message] call FUNC(addAssertionResult);
}
