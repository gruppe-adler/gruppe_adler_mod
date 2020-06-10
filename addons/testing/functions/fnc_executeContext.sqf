#include "script_component.hpp";

params [
    ["_context", []],
    ["_my", []]
];

_context params [
    ["_descriptions", []],
    ["_setups", []],
    ["_cleanups", []]
];

_my params [
    ["_description", ""],
    ["_setup", {[]}], /* can also be an array of setup routines */
    ["_subroutines", []],
    ["_cleanup", {[]}]
];

_cleanups = _cleanups + [_cleanup];
_descriptions = _descriptions + [_description];
if (_setup isEqualType {}) then {
    _setup = [_setup];
};
{
    private _setupsBranch = _setups + [_x];

    if (count _subroutines > 0) then {
        {
            [
                [
                    _descriptions,
                    _setupsBranch,
                    _cleanups
                ],
               _x
            ] call grad_testing_fnc_executeContext;
        } forEach _subroutines;
    } else {
        grad_testing_results pushBack [_descriptions, [/*assertion results will go here*/]];

        private _setupParameter = [];
        private _cleanupParameters = [];
        {
            _setupParameter = _setupParameter call _x;
            ISNILS(_setupParameter, []);
            LOG(str _x);
            _cleanupParameters pushBack _setupParameter;
        } forEach _setupsBranch;
        {
            // call cleanups with the respective setup's return value.
            private _cleanupParameter = _cleanupParameters#_forEachIndex;
            ISNILS(_cleanupParameter, []);
            LOG(str _x);
            _cleanupParameter call _x;
        } forEach _cleanups;
    };


} forEach _setup;

