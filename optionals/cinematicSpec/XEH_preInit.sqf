#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"

SCRIPT(XEH_preInit);

["Gruppe Adler", QGVAR(toggle), "Enter Cinematic Spectator", {true}, ""] call CBA_fnc_addKeybind;

[
    "ace_spectatorSet",
    {
        if (isNil QUOTE(BIS_DEBUG_CAM)) then {
            INFO("caught ace_spectatorSet, BIS cam is already nil");
        } else {
            private _bisCamPrintable = (missionNamespace getVariable ["BIS_DEBUG_CAM", objNull]);
            if (isNull BIS_DEBUG_CAM) then {
                INFO("caught ace_spectatorSet, BIS cam should be in the process of being unset by fn_cameraOld");
            } else {
                INFO_1("caught ace_spectatorSet, SETTING BIS CAM %1 TO NULL!", _bisCamPrintable);
                BIS_DEBUG_CAM = objNull;
            };
        };
    }
] call CBA_fnc_addEventHandler;
