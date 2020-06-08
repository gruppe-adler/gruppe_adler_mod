#include "script_component.hpp"

/*  Returns actual position of trunk 1.2m above ground in format PosASL
*
*/

scopeName "main";

params [["_tree",objNull]];


private _searchPos = getPos _tree;
_searchPos set [2,(_searchPos select 2) min 0.8];
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
// next search directions are based on current directions +- searchInterval
// searchInterval is halved each iteration
private _searchDirections = [[0,90,180,270],[45,135,225,315]];
private _searchInterval = 45;
private _trunkFound = false;
private _trunkPos = _searchPos;
{
    _iteration = _forEachIndex;
    {
        _endPos = _searchPos getPos [3,_x];
        _endPos set [2,_searchPos select 2];

        _lineIntersections = (lineIntersectsSurfaces [_searchPos,_endPos]) select {_x select 3 == _tree};
        if (count _lineIntersections > 0) then {
            _trunkPos = _lineIntersections select 0 select 0;
            _trunkFound = true;
            breakTo "main";
        };
    } forEach _x;

    if (_iteration > 3) exitWith {};

    _searchInterval = _searchInterval / 2;
    _nextDirections = _searchDirections select (_searchDirections pushBack []);
    {
        _nextDirections pushBack (_x + _searchInterval);
        _nextDirections pushBack (_x - _searchInterval);
        nil
    } count (_searchDirections select (_iteration + 1));
} forEach _searchDirections;

if (!_trunkFound) exitWith {_trunkPos};



// normalize and cache offset
(_trunkPos vectorDiff _searchPos) params ["_x","_y"];
_dir = getDir _tree;
_offset = [_x * cos _dir - _y * sin _dir, _x * sin _dir + _y * cos _dir];
GVAR(trunkOffsetsCache) setVariable [_modelName,_offset];


//return
_trunkPos
