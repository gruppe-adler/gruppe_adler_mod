#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

private _key = param [1, 0];
INFO_1("KeyDown, key %1", _key);

private _keybind = ["Gruppe Adler","grad_cinematicSpec_toggle"] call CBA_fnc_getKeybind;
if (isNil "_keybind") exitWith {};
private _keycode = _keybind select 5 select 0;

// Handle toggling camera
if ([] call FUNC(isAceSpectator)) then {
    if (_key == _keycode) exitWith {
        [] call FUNC(cam);
        true
    };
};

false
