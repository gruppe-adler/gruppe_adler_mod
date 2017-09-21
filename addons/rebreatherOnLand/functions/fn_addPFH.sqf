if (!hasInterface) exitWith {};
if (!isNil "grad_rebreatherOnLand_pfID") exitWith {};

grad_rebreatherOnLand_lastUpdateTime = 0;
grad_rebreatherOnLand_oxygen = 100;
grad_rebreatherOnLand_fogEffect_committed = true;
grad_rebreatherOnLand_fogEffect = false;
grad_rebreatherOnLand_iceEffect_committed = true;
grad_rebreatherOnLand_iceEffect = false;

grad_rebreatherOnLand_pfID = [grad_rebreatherOnLand_fnc_PFH, 0, []] call CBA_fnc_addPerFrameHandler;
