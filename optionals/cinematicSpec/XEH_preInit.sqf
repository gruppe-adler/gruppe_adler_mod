#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"

SCRIPT(XEH_preInit);

["Gruppe Adler",QGVAR(toggle),"Enter Cinematic Spectator",{true},""] call CBA_fnc_addKeybind;

GVAR(ace_setSpectator) = ace_spectator_fnc_setSpectator;

ace_spectator_fnc_setSpectator = {
    BIS_DEBUG_CAM = objNull; //whatever happens, if someone sets or unset ace spec let's be safe and go there (or leave our cam)
    _this call GVAR(ace_setSpectator);
}
