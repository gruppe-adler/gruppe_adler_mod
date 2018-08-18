params ["_origin", "_count", "_distance"];

private _array = [];
private _angle = 360/_count;
private _direction = 0;

for "_i" from 1 to _count do {

	private _position = _origin getPos [_distance, _direction];

	_array pushBack _position;

	_direction = _direction + _angle;
};

_array