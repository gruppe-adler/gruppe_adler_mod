[
	QGVAR(allowMarker3D), 
	"CHECKBOX", 
	[
		localize LSTRING(allowMarker3D_displayName), 
		localize LSTRING(allowMarker3D_tooltip)
	], 
	localize LSTRING(settingCategory), 
	true,
	true
] call CBA_fnc_addSetting;

[
	QGVAR(markerShowTime), 
	"SLIDER", 
	localize LSTRING(markerShowTime), 
	localize LSTRING(settingCategory), 
	[5, 30, 10, 0], 
	true
] call CBA_fnc_addSetting;