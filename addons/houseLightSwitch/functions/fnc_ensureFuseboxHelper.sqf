#include "script_component.hpp"

params [
	["_building", objNull, [objNull]]
];
assert(!(isNull _building));
	
private _helper = _building getVariable [QGVAR(fuseboxHelper), objNull];
if (_helper isNotEqualTo objNull) exitWith {
	TRACE_1("helper for %1 exists already!", _building);
};

private _helperPos = _building modelToWorld [0, 0, 0];
TRACE_2("creating helper for building %1 at %2", _building, _helperPos);

// NOTE: cannot use createSimpleObject, as these cannot hold ACE actions
// NOTE: createVehicleLocal will avoid collisions! hence setpos later
_helper = "Sign_Sphere25cm_F" createVehicleLocal [0, 0, 0];  
_helper setPos _helperPos; 

_building setVariable [QGVAR(fuseboxHelper), _helper];
