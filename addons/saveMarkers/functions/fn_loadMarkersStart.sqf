#include "script_component.hpp"

params ["_saveName","_mapName",["_markersData",[]]];

// client who loads markers will be owner
private _playerID = getPlayerID player;
private _markerIDIndex = 0;

INFO_4("starting to load %1 markers from save %2 on terrain %3 for player %4", count _markersData, _saveName, _mapName, _playerID);

[_playerID, _markerIDIndex, _markersData] call FUNC(loadMarkersLoop);
