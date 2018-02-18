/*  Returns actual position of trunk 1.2m above ground in format PosASL
*
*/

#include "script_component.hpp"

params [["_tree",objNull]];


private _searchPos = getPos _tree;
_searchPos set [2,(_searchPos select 2) min 1.2];
_searchPos = AGLtoASL _searchPos;


// look for cached offset
if (isNil QGVAR(trunkOffsetsCache)) then {GVAR(trunkOffsetsCache) = call CBA_fnc_createNamespace};
private _modelName = ((str _tree) splitString " .") select 1;
private _offset = GVAR(trunkOffsetsCache) getVariable [_modelName,[]];
if (count _offset > 0) exitWith {
    _dirCCW = -(getDir _tree);
    _offset params ["_x","_y"];
    _trunkPos = (getPosASL _tree) vectorAdd [_x * cos _dirCCW - _y * sin _dirCCW, _x * sin _dirCCW + _y * cos _dirCCW, 0];
    _trunkPos set [2,_searchPos select 2];
    _trunkPos
};


// manually find trunk positionASL
private _trunkPos = _searchPos;
private _intersections = [];
for [{_i=0},{_i<=360},{_i=_i+5}] do {
    _endPos = _searchPos getPos [3,_i];
    _endPos set [2,_searchPos select 2];
    _lineIntersections = lineIntersectsSurfaces [_searchPos,_endPos];
    _intersections append (_lineIntersections select {_x select 3 == _tree});
};
if (count _intersections == 0) exitWith {_trunkPos};
_trunkPos = (_intersections select (floor ((count _intersections)/2))) select 0;


// normalize and cache offset
(_trunkPos vectorDiff _searchPos) params ["_x","_y"];
_dir = getDir _tree;
_offset = [_x * cos _dir - _y * sin _dir, _x * sin _dir + _y * cos _dir];
GVAR(trunkOffsetsCache) setVariable [_modelName,_offset];


//return
_trunkPos
