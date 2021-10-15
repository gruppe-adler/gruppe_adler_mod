#include "script_component.hpp"

private _key = param [1, 0];

private _keybind = ["Gruppe Adler", QGVAR(toggle)] call CBA_fnc_getKeybind;
if (isNil "_keybind") exitWith {};
private _keycode = _keybind select 5 select 0;

// Handle toggling camera
if (_key != _keycode) exitWith {
    false
};

if (!(["IsInitialized"] call BIS_fnc_EGSpectator)) exitWith {
        false
};

private _mode = ["GetCameraMode"] call BIS_fnc_EGSpectatorCamera;

if (_mode != EG_MODE_FREE) exitWith { // #define MODE_FREE   "free"
    INFO("not allowed to switch to cinematicSpec: I'm not in free camera mode");
    false
};

["eg"] call FUNC(cam);

true
