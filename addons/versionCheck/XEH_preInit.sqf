#include "script_component.hpp"
SCRIPT(XEH_preInit);

call FUNC(determineVersions);

private _settingsGroup = "GRAD Version Check";

[
    QGVAR(setting_kickOnVersionMismatch),
    "CHECKBOX",
    "Kick if client has version mismatch",
    _settingsGroup,
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnMissingClient),
    "CHECKBOX",
    "Kick if client is missing addon",
    _settingsGroup,
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnMissingServer),
    "CHECKBOX",
    "Kick if client loaded additional addon",
    _settingsGroup,
    true,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_kickOnTimeout),
    "CHECKBOX",
    "Kick if client check times out",
    _settingsGroup,
    false,
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_dontKickAdmin),
    "CHECKBOX",
    "Never kick admin",
    _settingsGroup,
    false,
    1
] call CBA_settings_fnc_init;
