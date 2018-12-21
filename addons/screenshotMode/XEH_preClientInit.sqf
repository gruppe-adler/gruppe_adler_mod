#include "script_component.hpp"

private _title = "Screenshot Mode";
private _helpText = "Adds a keybind to hide all UI elements for prettier screenshots. Has no default keybind. Check Controls >> Configure Addons >> Gruppe Adler.";

[_title,_helpText] call EFUNC(ui,addHelpRecord);
