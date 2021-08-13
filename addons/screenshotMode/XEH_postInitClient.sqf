#include "script_component.hpp"

GVAR(active) = false;

[
    "Gruppe Adler",
    QGVAR(toggle),
    "Toggle Screenshot Mode",
    {
        GVAR(active) = !GVAR(active);
        [!GVAR(active)] call FUNC(toggleAll);
    },
    ""
] call CBA_fnc_addKeybind;
