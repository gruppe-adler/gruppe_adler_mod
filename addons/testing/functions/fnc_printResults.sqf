#include "script_component.hpp"

{
    _x params ["_path", "_results"];
    private _lastResult = _results select ((count _results) - 1);

    private _status = switch (_lastResult select 0) do {
        case STATUS_FAIL:    {"FAIL   "};
        case STATUS_ERROR:   {"ERROR  "};
        case STATUS_SUCCESS: {"OK     "};
        case STATUS_PENDING: {"PENDING"};
        default              {"???    "};
    };
    private _text = format["%1  %2", _status, (_path joinString " ")];
    private _message = _lastResult select 1;
    if (_message != "") then {
        _text = format ["%1: %2", _text, _message];
    };
    systemChat _text;
} forEach grad_testing_results;
