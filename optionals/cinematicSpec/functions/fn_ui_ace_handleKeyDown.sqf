#include "script_component.hpp"

private _key = param [1, 0];

private _keybind = ["Gruppe Adler", QGVAR(toggle)] call CBA_fnc_getKeybind;
if (isNil "_keybind") exitWith {};
private _keycode = _keybind select 5 select 0;

// Handle toggling camera
if (_key != _keycode) exitWith {
    false
};

if (!ace_spectator_isSet) exitWith {
        false
};

private _cameraAttributes = [] call ace_spectator_fnc_getCameraAttributes;

private _mode = _cameraAttributes select 0;

if (_mode != 0) exitWith { // #define MODE_FREE   0
    INFO("not allowed to switch to cinematicSpec: I'm not in free camera mode");
    false
};

["ace"] call FUNC(cam);

true
