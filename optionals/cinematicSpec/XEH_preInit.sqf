#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"

SCRIPT(XEH_preInit);

[
    "Gruppe Adler",
    QGVAR(toggle),
    "Enter Cinematic Spectator",
    "",
    ""
] call CBA_fnc_addKeybind;

GVAR(registered) = false;
GVAR(warned) = false;
