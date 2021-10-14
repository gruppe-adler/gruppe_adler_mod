#include "script_component.hpp"
SCRIPT(XEH_preInit);

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;


[
    QGVAR(setting_timeFactor),
    "SLIDER",
    "Chopping time factor (higher means longer)",
    "GRAD Axe",
    [0.1,10,1,1],
    1
] call CBA_settings_fnc_init;

[
    QGVAR(setting_maxTime),
    "SLIDER",
    "Max. chopping time (no matter how tall the tree)",
    "GRAD Axe",
    [5,600,40,0],
    1
] call CBA_settings_fnc_init;

[
    QGVAR(allow_dragging),
     "CHECKBOX",
    "Allow dragging cut down tree",
    "GRAD Axe",
    true
] call CBA_settings_fnc_init;
