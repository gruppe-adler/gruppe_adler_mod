/*  Returns actual position of trunk 1.2m above ground in format PosASL
*
*/

#include "script_component.hpp"

params [["_tree",objNull]];

private _searchPos = getPos _tree;
_searchPos set [2,(_searchPos select 2) min 1.2];
_searchPos = AGLtoASL _searchPos;
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
_trunkPos
