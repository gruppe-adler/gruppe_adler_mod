/*

	["Land_CampingChair_V1_F", cursorTarget, 10] call GRAD_zeusHelpers_fnc_createChairCircle;

*/
params ["_type", "_pos", "_count"];

// params ["_origin", "_count", "_distance"];
private _positions = [_pos, _count, _count/5] call FUNC(moduleChairCircleGetPoint);
private _chairs = [];

{
  	private _chair = createVehicle [_type, _x, [], 0, "CAN_COLLIDE"];
  	_chair setDir ((_chair getRelDir _pos) - 180);
  	_chairs pushBack _chair;
} forEach _positions;

createVehicle ["Land_Campfire_burning", _pos, [], 0, "CAN_COLLIDE"];

_chairs