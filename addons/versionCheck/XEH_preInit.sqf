#include "script_component.hpp"
SCRIPT(XEH_preInit);

GVAR(versions) = [[],nil] call CBA_fnc_hashCreate;

{
    _x params ["_name", "_version", "_isPatched"];
    _name = toLower _name;
    if (_name find "a3" != 0) then {
        [GVAR(versions), _name, [_version, _isPatched]] call CBA_fnc_hashSet;
    };
} forEach allAddonsInfo;

[
    QGVAR(setting_kickOnVersionMismatch),
    "CHECKBOX",
    "Kick if client has version mismatch",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnMissingClient),
    "CHECKBOX",
    "Kick if client is missing addon",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnMissingServer),
    "CHECKBOX",
    "Kick if client loaded additional addon",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnTimeout),
    "CHECKBOX",
    "Kick if client check times out",
    "GRAD Version Check",
    false,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_dontKickAdmin),
    "CHECKBOX",
    "Never kick admin",
    "GRAD Version Check",
    false,
    1
] call CBA_settings_fnc_init;
