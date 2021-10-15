#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _pos = getPos _logic;
private _fire = _logic getvariable ["bis_fnc_curatorAttachObject_object", objnull];
deleteVehicle _logic;

private _count = count (playableUnits + switchableUnits);
private _positions = [_pos, _count, _count/5] call FUNC(moduleChairCircleGetPoint);
private _chairs = [];

{
  	private _chair = createVehicle ["Land_CampingChair_V2_F", _x, [], 0, "CAN_COLLIDE"];
	_chair setPos _x;
  	_chair setDir ((_chair getRelDir _pos) - 180);
  	_chairs pushBack _chair;
} forEach _positions;

if (isNull _fire ) then {
	createVehicle ["Campfire_burning_F", _pos, [], 0, "CAN_COLLIDE"];
};

_chairs