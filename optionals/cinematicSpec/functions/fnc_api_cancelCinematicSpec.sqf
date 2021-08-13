#include "script_component.hpp"

/**
 * if player is in cinematicSpec, send them back to the spectator mode they came from.
 * this function is callbacked. example usage:
 * [{
 *     [false] call ace_spectator_fnc_setSpectator;
 * }] call grad_mod_cinematicSpec_fnc_api_cancelCinematicSpec;
 *
 * returns "sync" on immediate callback execution and "async" if callback execution is delayed
 */

params [
    ["_callback", {}],
    ["_callbackArgs", []]
];

if (isNil QGVAR(cam)) exitWith {
    _callbackArgs call _callback;
    "sync"
};

GVAR(cam) = objNull;

[
    {
        isNil QGVAR(cam)
    },
    {
        _this call CBA_fnc_waitAndExecute;
    },
    [_callback, _callbackArgs, 1]
] call CBA_fnc_waitUntilAndExecute;

"async"
