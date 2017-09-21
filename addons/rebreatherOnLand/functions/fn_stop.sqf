#include "..\defines.hpp"

if (isNil "grad_rebreatherOnLand_pfID") exitWith {};

[grad_rebreatherOnLand_pfID] call CBA_fnc_removePerFrameHandler;

[false] call grad_rebreatherOnLand_fnc_iceEffect;
[false] call grad_rebreatherOnLand_fnc_fogEffect;

ppEffectDestroy grad_rebreatherOnLand_oxygenDep_CC;
ppEffectDestroy grad_rebreatherOnLand_noGoggles_CC;

if (!hasInterface) exitWith {};
if (ACE_player getVariable ["ACE_isUnconscious", false] && {ACE_player getVariable ["grad_rebreatherOnLand_isOxygenDep",false]}) then {
    ACE_player setVariable ["grad_rebreatherOnLand_isOxygenDep",false];
    [ACE_player, false, 10] call ace_medical_fnc_setUnconscious;
};
