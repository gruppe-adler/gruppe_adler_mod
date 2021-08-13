#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;


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

GVAR(addonVersionsTitle) = "Addon Versions";
[GVAR(addonVersionsTitle), QUOTE(<execute expression=""call FUNC(createDiaryEntry)"">Show</execute>)] call EFUNC(ui,addHelpRecord);

ADDON = true;
