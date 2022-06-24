#include "script_component.hpp"

params ["_saveName","_mapName",["_markersData",[]]];

// client who loads markers will be owner
private _playerID = getPlayerID player;
private _markerIDIndex = 0;

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
        "_channel",
        ["_polyline",[]]
    ];

    // _channel is type string in legacy saves
    if (_channel isEqualType "") then {
        _channel = call compile _channel;
    };

    // increment marker index until unused _markerID is found
    private _markerID = format ["_USER_DEFINED #%1/%2/%3",_playerID,_markerIDIndex,_channel];
    while {markerShape _markerID != ""} do {
        _markerIDIndex = _markerIDIndex + 1;
        _markerID = format ["_USER_DEFINED #%1/%2/%3",_playerID,_markerIDIndex,_channel];
    };

    private _marker = createMarker [_markerID,_pos,_channel,player];
    _marker setMarkerAlpha _alpha;
    _marker setMarkerBrush _brush;
    _marker setMarkerColor _color;
    _marker setMarkerDir _dir;
    _marker setMarkerPos _pos;
    _marker setMarkerShape _shape;
    _marker setMarkerSize _size;
    _marker setMarkerText _text;
    _marker setMarkerType _type;
    if (count _polyline > 0) then {
        _marker setMarkerPolyline _polyline;
    };

} forEach _markersData;
