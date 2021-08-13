#include "script_component.hpp"

private _newState = param [0, true];

if (_newState) then {
     showHUD GVAR(vanillaHUD);
} else {
     GVAR(vanillaHUD) = shownHUD;
     showHUD [false,false,false,false,false,false,false,false];
};
