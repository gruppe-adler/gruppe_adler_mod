/**
 * Wheeled vehicles go over rough ground as if it were concrete.
 * No more!
 * Run this function ONCE to periodically reduce speed according to surface.
 */

_interval = 0.5; // how many seconds should speed be checked
_minSpeed = 5; // dont check below this speed in km/h

_vehicleNerfLoop = {
	_minSpeed = (param [0] select 0);

	_frictionMap = [
		[
			["#GdtStratisConcrete", 1],
			["#GdtStratisDryGrass", 0.8],
			["#GdtStratisGreenGrass", 0.8],
			["#GdtStratisRocky", 0.7],
			["#GdtStratisForestPine", 0.6],
			["#GdtStratisBeach", 0.8],
			["#GdtStratisDirt", 0.8],
			["#GdtStratisThistles", 0.7],
			["#GdtVRsurface01", 1],
			["#GdtDirt", 0.8],
			["#GdtGrassGreen", 0.8],
			["#GdtGrassDry", 0.8],
			["#GdtSoil", 0.8],
			["#GdtThorn", 0.7],
			["#GdtStony", 0.6],
			["#GdtConcrete", 1],
			["#GdtMarsh", 0.5],
			["#GdtBeach", 0.7],
			["#GdtSeabed", 0.9],
			["#GdtDead", 1]
		],
		1
	] call CBA_fnc_hashCreate;

	_isEligibleVehicle = {
		(local _this) && (_this isKindOf "Car") && !(_this isKindOf "Wheeled_APC_F");
	};

	_isOffRoad = {
		! (isOnRoad (position _this));
	};

	_isFastEnough = {
		(speed _this) > _minSpeed;
	};

	_setSpeedNerf = {
		_velocity = velocity _this;
		_pos = position _this;

		_frictionSpeedFactor = [_frictionMap, surfaceType _pos, 1] call CBA_fnc_hashGet;
		if (_frictionSpeedFactor != 1) then {
			_reducedVelocity = [_velocity, _frictionSpeedFactor] call CBA_fnc_scaleVect;
			_this setVelocity _reducedVelocity;
		};
	};

	_vehicles = vehicles;
	{
		_vehicles = [_vehicles, _x] call CBA_fnc_select;
	} forEach [_isEligibleVehicle, _isFastEnough, _isOffRoad];

	{_x call _setSpeedNerf}  forEach _vehicles;
};


[_vehicleNerfLoop, _interval, [_minSpeed]] call CBA_fnc_addPerFrameHandler;
