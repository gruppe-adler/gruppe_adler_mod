#include "script_component.hpp"

params [
    ["_actual", scriptNull],
    ["_lower", scriptNull],
    ["_upper", scriptNull],
    ["_message", ""]
];

if (_message == "") then {
    _message = format ["%1 < %2 < %3", _lower, _actual, _upper];
};

if (typeName _actual != "SCALAR") exitWith {
    [STATUS_ERROR, "first parameter is not a number"] call FUNC(addAssertionResult);
};
if (typeName _lower != "SCALAR") exitWith {
    [STATUS_ERROR, "second parameter is not a number"] call FUNC(addAssertionResult);
};
if (typeName _upper != "SCALAR") exitWith {
    [STATUS_ERROR, "third parameter is not a number"] call FUNC(addAssertionResult);
};

if (_lower >= _upper) exitWith {
    [STATUS_ERROR, "second parameter must be lower than third parameter"] call FUNC(addAssertionResult);
};

if (_actual > _lower && _actual < _upper) then {
    [STATUS_SUCCESS, _message] call FUNC(addAssertionResult);
} else {
    [STATUS_FAIL, _message] call FUNC(addAssertionResult);
}
