#include "script_component.hpp"

private _building = GVAR(house);
private _hasFuseboxActions = _building getVariable [QGVAR(hasFuseboxActions), false];

if (_hasFuseboxActions) exitWith {
	[_building] call FUNC(ensureFuseboxHelper);
};

[
	ACE_player distance _building, 
	[_building],
	{
		params ["_args"];
		_args params ["_building"];
		assert(!isNull(_building));
		hint "Found the fuse box. Look for a bright helper object!";
		[_building] call FUNC(ensureFuseboxHelper);
		[_building] call FUNC(createFuseboxActions);
	}, 
	{hint "Failure"}, 
	"Searching fuse box..."
] call ace_common_fnc_progressBar;
