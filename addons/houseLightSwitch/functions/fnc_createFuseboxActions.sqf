#include "script_component.hpp"

params [
	["_building", objNull, [objNull]]
];

assert(!(isNull _building));

if (_building getVariable [QGVAR(hasFuseboxActions), false]) exitWith {
	WARNING_1("fusebox actions already added for %1", _building);
};
_building setVariable [QGVAR(hasFuseboxActions), true];

private _onAction = [
	QGVAR(on),
	"Turn on house lights",
	"x\grad\addons\houseLightSwitch\ui\bulb-on.paa", 
	{
		params ["", "", "_args"];
		_args params [["_building", objNull, [objNull]]];
		[QGVAR(setBuildingMainSwitch), [GVAR(house), true]] call CBA_fnc_serverEvent;
		[_building] call FUNC(fadeFuseboxHelper);
	}, 
	{call FUNC(condition_on)}, 
	{[]}, 
	[_building]
] call ace_interact_menu_fnc_createAction;
[_building, 0, [], _onAction] call ace_interact_menu_fnc_addActionToObject;

private _offAction = [
	QGVAR(off),
	"Turn off house lights",
	"\x\grad\addons\houseLightSwitch\ui\bulb-off.paa", 
	{
		params ["", "", "_args"];
		_args params [["_building", objNull, [objNull]]];
		[QGVAR(setBuildingMainSwitch), [GVAR(house), false]] call CBA_fnc_serverEvent;
		[_building] call FUNC(fadeFuseboxHelper);
	}, 
	{call FUNC(condition_off)}, 
	{[]}, 
	[_building]
] call ace_interact_menu_fnc_createAction;
[_building, 0, [], _offAction] call ace_interact_menu_fnc_addActionToObject;
