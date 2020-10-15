#include "script_component.hpp"
SCRIPT(XEH_preInit);

call FUNC(determineVersions);

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
