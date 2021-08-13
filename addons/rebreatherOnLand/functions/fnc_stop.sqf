#include "script_component.hpp"

if (isNil QGVAR(pfID)) exitWith {};

[GVAR(pfID)] call CBA_fnc_removePerFrameHandler;

[false] call FUNC(iceEffect);
[false] call FUNC(fogEffect);

ppEffectDestroy GVAR(oxygenDep_CC);
ppEffectDestroy GVAR(noGoggles_CC);

if (!hasInterface) exitWith {};
if (ACE_player getVariable ["ACE_isUnconscious", false] && {ACE_player getVariable [QGVAR(isOxygenDep),false]}) then {
    ACE_player setVariable [QGVAR(isOxygenDep),false];
    [ACE_player, false, 10] call ace_medical_fnc_setUnconscious;
};
