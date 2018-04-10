#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[
    QGVAR(enableSwitch),
    "CHECKBOX",
    localize LSTRING(settingEnable_displayName),
    localize "STR_grad_settingsCategory",
    false
] call CBA_Settings_fnc_init;
