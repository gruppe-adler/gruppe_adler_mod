#include "script_component.hpp"

params ["_saveName","_mapName",["_markersData",[]]];

{
    _x params [
        "_alpha",
        "_brush",
        "_color",
        "_dir",
        "_pos",
        "_shape",
        "_size",
        "_text",
        "_type",
        "_channel"
    ];

    _markerID = format ["_USER_DEFINED #-1%1%2/%3/%4",_saveName,_mapName,_forEachIndex,_channel];

    _marker = createMarker [_markerID,_pos];
    _marker setMarkerAlpha _alpha;
    _marker setMarkerBrush _brush;
    _marker setMarkerColor _color;
    _marker setMarkerDir _dir;
    _marker setMarkerPos _pos;
    _marker setMarkerShape _shape;
    _marker setMarkerSize _size;
    _marker setMarkerText _text;
    _marker setMarkerType _type;

} forEach _markersData;
