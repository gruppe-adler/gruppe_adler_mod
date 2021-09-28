#include "script_component.hpp"

params [
	["_building", objNull, [objNull]]
];
assert(!(isNull _building));

private _helper = _building getVariable [QGVAR(fuseboxHelper), objNull];
private _existingOpacity = _helper getVariable [QGVAR(opaqueness), -1];
if (_existingOpacity != -1) exitWith {
	WARNING_1("helper already has non-default opacity %1 , will not add another handler", _existingOpacity);
};
_helper setVariable [QGVAR(opaqueness), 1];

[
	{
		params [
			["_args", [], [[]]],
			["_handle", 0, [0]]
		];
		_args params [
			["_building", objNull, [objNull]]
		];
		assert(!(isNull _building));
		private _helper = _building getVariable [QGVAR(fuseboxHelper), objNull];
		private _opaqueness = _helper getVariable [QGVAR(opaqueness), 0];
		_helper setVariable [QGVAR(opaqueness), _opaqueness - 0.05];
		if (isNull _helper) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_building setVariable [QGVAR(fuseboxHelper), nil];
			WARNING_1("null helper in loop for building %1!", _building);
		};
		if (_opaqueness <= 0) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			_building setVariable [QGVAR(fuseboxHelper), nil];
			deleteVehicle _helper;
		};
		_helper setObjectTexture [0, format ["#(argb,8,8,3)color(1,0.6,0.1,%1,ca)", _opaqueness]];
	}, 
	0.1, 
	[_building]
] call CBA_fnc_addPerFrameHandler;
