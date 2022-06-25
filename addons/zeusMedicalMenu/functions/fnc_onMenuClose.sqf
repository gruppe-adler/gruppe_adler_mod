#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Handles closing the Medical Menu. Called from onUnload event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_onMenuClose
 *
 * Public: No
 */

if (ace_interact_menu_menuBackground == 1) then {["ace_medical_gui_id", false] call ace_common_fnc_blurScreen};
if (ace_interact_menu_menuBackground == 2) then {(uiNamespace getVariable ["ace_interact_menu_menuBackground", displayNull]) closeDisplay 0};

GVAR(pendingReopen) = false;
GVAR(menuPFH) call CBA_fnc_removePerFrameHandler;
GVAR(menuPFH) = -1;