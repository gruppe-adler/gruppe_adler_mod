#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!isNil QGVAR(pfID)) exitWith {};

GVAR(lastUpdateTime) = 0;
GVAR(oxygen) = 100;
GVAR(fogEffect_committed) = true;
GVAR(fogEffect) = false;
GVAR(iceEffect_committed) = true;
GVAR(iceEffect) = false;

GVAR(pfID) = [FUNC(PFH), 0, []] call CBA_fnc_addPerFrameHandler;
