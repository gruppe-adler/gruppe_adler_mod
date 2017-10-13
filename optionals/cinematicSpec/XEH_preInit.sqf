#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "script_component.hpp"
SCRIPT(XEH_preInit);

["Gruppe Adler","grad_cinematicSpec_toggle","Enter Cinematic Spectator",{true},"",[DIK_F2,[false,false,false]]] call CBA_fnc_addKeybind;
