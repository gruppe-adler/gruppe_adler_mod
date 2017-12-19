/**
 * if player is in cinematicSpec, send them back to the spectator mode they came from.
 * this function is callbacked. example usage:
 * [{
 *     [false] call ace_spectator_fnc_setSpectator;
 * }] call grad_cinematicSpec_fnc_cancelCinematicSpec;
 *
 * returns "sync" on immediate callback execution and "async" if callback execution is delayed
 */

#include "script_component.hpp"

private _callback = param [0, {}];
private _callbackArgs = param [1, []];

if (isNil QUOTE(GRAD_CINEMACAM)) exitWith {
    _callbackArgs call _callback;
    "sync"
};

GRAD_CINEMACAM = objNull;

[
    {
        isNil QUOTE(GRAD_CINEMACAM)
    },
    {
        [
            param [0],
            param [1],
            1 // if we dont wait a bit, there are weird ace spec UI errors -.-
        ] call CBA_fnc_waitAndExecute;
    },
    [_callback, _callbackArgs]
] call CBA_fnc_waitUntilAndExecute;

"async"