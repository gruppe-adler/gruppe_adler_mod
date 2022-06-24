[
	QGVAR(numberRifle), 
	"SLIDER", 
	localize LSTRING(NumberRifle), 
	localize LSTRING(settingCategory), 
	[1, 300, 100, 0], 
	true
] call CBA_fnc_addSetting;

[
	QGVAR(numberRPG), 
	"SLIDER", 
	localize LSTRING(NumberRPG), 
	localize LSTRING(settingCategory), 
	[1, 300, 30, 0], 
	true
] call CBA_fnc_addSetting;

[
	QGVAR(numberHandgrenades), 
	"SLIDER", 
	localize LSTRING(NumberHandgranades), 
	localize LSTRING(settingCategory), 
	[1, 300, 60, 0], 
	true
] call CBA_fnc_addSetting;