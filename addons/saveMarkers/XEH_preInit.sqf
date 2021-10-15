#include "script_component.hpp"

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
