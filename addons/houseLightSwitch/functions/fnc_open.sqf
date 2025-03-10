#include "script_component.hpp"
/*
 * Author: Salbei
 * Open Fuse Box.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [obj] call grad_mod_houseLightSwitch_fnc_open
 *
 * Public: No
 */

params ["_target"];

//Animate the opening of the box
_target animate ["fuseBox_open", 1];
[
    {
        _this animationPhase "fuseBox_open" == 1
    }, {
        _this setVariable [QGVAR(isOpen), true, true];
    },
    _target,
    5,
    {WARNING("fusebox animation timed out");}
] call CBA_fnc_waitUntilAndExecute;
