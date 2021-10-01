#include "script_component.hpp"
/*
 * Author: Salbei
 * Close Fuse Box.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_mod_houseLightSwitch_fnc_close
 *
 * Public: No
 */

params ["_target"];

//Animate the closing of the box
_target animate ["fuseBox_open", 0];
[
    {
        _this animationPhase "fuseBox_open" == 0
    }, {
        _this setVariable [QGVAR(isClosed), true, true];
    },
    _target
] call CBA_fnc_waitUntilAndExecute;
