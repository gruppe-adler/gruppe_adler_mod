[
	QGVAR(amountRifle), 
	"SLIDER", 
	localize LSTRING(AmountRifle), 
	localize LSTRING(settingCategory), 
	[1, 300, 100, 0], 
	true
] call CBA_fnc_addSetting;

[
	QGVAR(amountRPG), 
	"SLIDER", 
	localize LSTRING(AmountRPG), 
	localize LSTRING(settingCategory), 
	[1, 300, 30, 0], 
	true
] call CBA_fnc_addSetting;

[
	QGVAR(amountHandgranades), 
	"SLIDER", 
	localize LSTRING(AmountHandgranades), 
	localize LSTRING(settingCategory), 
	[1, 300, 60, 0], 
	true
] call CBA_fnc_addSetting;