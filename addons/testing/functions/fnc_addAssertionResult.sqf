#include "script_component.hpp"

params [
    ["_status", STATUS_FAIL],
    ["_message", ""]
];

if (count grad_testing_results == 0) then {
    throw "cannot run test assertions, we are not in a test context!";
};

private _leaf = grad_testing_results select (count grad_testing_results - 1);
private _descriptions = _leaf#0;
private _results = _leaf#1;
_results pushBack [_status, _message];

private _line = format ["%1  %2",
    _status,
    (_descriptions joinString " ")
];

INFO(_line);
