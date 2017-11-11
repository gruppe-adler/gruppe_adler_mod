#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"

SCRIPT(XEH_preInit);

["Gruppe Adler",QGVAR(toggle),"Enter Cinematic Spectator",{true},""] call CBA_fnc_addKeybind;

GVAR(ace_setSpectator) = ace_spectator_fnc_setSpectator;

[
    "ace_spectatorSet",
    {
        INFO_1("caught ace_spectatorSet, setting BIS cam %1 to null", BIS_DEBUG_CAM);
        BIS_DEBUG_CAM = objNull;
    }
] call CBA_fnc_addEventHandler;
