#include "script_component.hpp"

params [
	["_building", objNull, [objNull]]
];
assert(!(isNull _building));
	
private _helper = _building getVariable [QGVAR(fusebox), objNull];
if !(isNull _helper) exitWith {
	TRACE_1("Fuse Box for %1 exists already!", _building);
};

private _allPos = _building buildingPos -1; 
if (_allPos isEqualTo []) exitWith {
	TRACE_1("Building %1 cant place Fuse Box", _building);
};

private _newArray = _allPos apply {[_x select 2, _x]};
_newArray sort true; 
 
private _newPos = (_newArray select 0 select 1) vectorAdd [0,0,1.1];
private _posZ = _newPos select 2;
private _buildingDir = getDir _building;
 
for "_dir" from 0 to 270 step 90 do { 
	private _externalPos = _newPos getPos [15, _buildingDir + _dir];
	_externalPos set [2, _posZ];
	
	private _intersects = lineIntersectsSurfaces [(AGLToASL _newPos), (AGLToASL _externalPos), player, objNull, true, -1, "VIEW", "GEOM", false];

	{
		_x params ["_pos", "", "_obj"];

		if (!(isNull _obj) && {_obj isEqualTo _building}) exitWith {
			_helper = "Grad_Fuse_Box" createVehicle _pos;
			_helper setPosASL _pos;
			_helper setDir ((_buildingDir + _dir) + 180) mod 360;

			[{	
				params ["_args", "_handle"];
				_args params ["_pos", "_time"];

				if ((diag_tickTime - _time) > GVAR(markerShowTime)) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
	
    			drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Actions\ico_cpt_batt_OFF_ca.paa", [1,1,1,1], _pos, 1, 1, 0];
			}, 0, [(_helper modelToWorld (boundingCenter _helper)), diag_tickTime]] call CBA_fnc_addPerFrameHandler;

			_bool = true;
		};
	}forEach _intersects;

	if !(isNull _helper) exitWith {};
};

_building setVariable [QGVAR(fusebox), _helper];
