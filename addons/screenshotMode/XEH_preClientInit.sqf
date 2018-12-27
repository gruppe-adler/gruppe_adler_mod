#include "script_component.hpp"

private _title = "Screenshot Mode";
private _helpText = "Adds a keybind to hide all UI elements for prettier screenshots. This does not have a default keybind, so if you want to use it, check Controls >> Configure Addons >> Gruppe Adler.";

[_title,_helpText] call EFUNC(ui,addHelpRecord);
