
/*
    get offsets of all attached objects of vehicle in 3den

    for new configs: attach object to vehicle, run this script, put new config in CfgVehicles.hpp
*/

private _vehicle = [];
private _objects = [];
private _objectsAndOffsets = [];
private _collection = [];

{
    if (!(_x isKindOf "LandVehicle")) then {
        _objects pushBack _x;
    } else {
        _vehicle = _x;
    };
} forEach (get3DENSelected "object");



{
    _objectsAndOffsets pushBack [typeOf _x, (_vehicle worldToModelVisual ASLToAGL (getPosWorld _x))];
} forEach _objects;


_collection pushBack [typeOf _vehicle, _objectsAndOffsets];

_collection
