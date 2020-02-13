#include "script_component.hpp"

{
    _x params ["_path", "_results"];

    private _overallResultOkay = {
        _assertionResult = _x select 0;
        if (!(_assertionResult isEqualTo STATUS_SUCCESS)) exitWith {
            false
        };
        true
    } forEach _results;
    if (isNil "_overallResultOkay") then {
        _overallResultOkay = false;
    };

    if (_overallResultOkay) then {
        private _text = format["OK       %1", (_path joinString " ")];
        systemChat _text;
        diag_log _text;
    } else {
        private _text = format["!!       %1", (_path joinString " ")];
        systemChat _text;
        diag_log _text;
        {
            private _textStatus = switch (_x select 0) do {
                case STATUS_FAIL:    {"FAIL   "};
                case STATUS_ERROR:   {"ERROR  "};
                case STATUS_SUCCESS: {"OK     "};
                case STATUS_PENDING: {"PENDING"};
                default              {"???    "};
            };
            private _message = _x select 1;
            _text = format ["    %1  %2", _textStatus, _message];
            systemChat _text;
            diag_log _text;
        } forEach _results;
    };
} forEach grad_testing_results;
