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


private _title = "Cinematic Spec";
private _helpText = "Cinematic Spectator mode brings the old school BI spectator cam with inertia enabled back to life. This does not have a default keybind, so if you want to use it, check Controls >> Configure Addons >> Gruppe Adler. Once you are in spectator, use your assigned key to switch between the default spectator mode and Cinematic Spec.";

[_title,_helpText] call EFUNC(ui,addHelpRecord);
