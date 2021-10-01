#include "script_component.hpp"
// assumption: any damage to a light source should be enough to kill it. 
// therefore, I can use a magic damage (< 1) to mark as light as "switched off" as opposed to "destroyed"
#define MAGIC_DAMAGE_LIGHT_OFF 0.9

params [
	["_building", objNull, [objNull]],
	["_newState", false, [false]]
];

assert(isServer); // terrain objects are local *everywhere*. therefore, force server to have a single point of truth.

private _isOn = _building getVariable [QGVAR(mainSwitchState), true];
if (_newState isEqualTo _isOn) exitWith {
	TRACE_2("someone tried to switch lights on building %1 to pre-existing state %2", _building, _newState);
};
_building setVariable [QGVAR(mainSwitchState), _newState, true];

private _existingDmg = getAllHitPointsDamage _building;

{ 	
	if (_x find "#" == 0) then { // assume indices starting with "#" to be lights
		private _prevLightDmg = (_existingDmg#2#_forEachIndex);
		// using setHitIndex over setHitPointDamage as there are buildings - looking at you, Land_House_C_2_EP1 - where hitpointnames are not unique
		_building setHitIndex [
			_forEachIndex, 
			if (_newState) then {
				if (_prevLightDmg isEqualTo MAGIC_DAMAGE_LIGHT_OFF) then {0} else {_prevLightDmg}
			} else {
				_prevLightDmg max MAGIC_DAMAGE_LIGHT_OFF
			}, 
			false
		];	
	};
} forEach _existingDmg select 0;
