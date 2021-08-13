#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(setting_canBeOpened),
    "LIST",
    "Enabled",
    "GRAD Save Markers",
    [
        [0,1,2],
        ["never","first 10min of mission","always"],
        1
    ]
] call CBA_settings_fnc_init;

ADDON = true;
