#include "script_component.hpp"

params ["_saveName","_mapName",["_markersData",[]]];

// client who loads markers will be owner
private _playerID = getPlayerID player;
private _markerIDIndex = 0;

[_playerID, _markerIDIndex] spawn {
    params ["_playerID", "_markerIDIndex"];
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
        private _markerID = format ["_USER_DEFINED #%1/%2/%3",
        ,_markerIDIndex,_channel];
        while {markerShape _markerID != ""} do {
            _markerIDIndex = _markerIDIndex + 1;
            _markerID = format ["_USER_DEFINED #%1/%2/%3",_playerID,_markerIDIndex,_channel];
        };

        private _marker = createMarkerLocal [_markerID,_pos,_channel,player]; // create locally and broadcast with last command
        _marker setMarkerAlphaLocal _alpha;
        _marker setMarkerBrushLocal _brush;
        _marker setMarkerColorLocal _color;
        _marker setMarkerDirLocal _dir;
        _marker setMarkerPosLocal _pos;
        _marker setMarkerShapeLocal _shape;
        _marker setMarkerSizeLocal _size;
        _marker setMarkerTextLocal _text;
        _marker setMarkerType _type;
        if (count _polyline > 0) then {
            _marker setMarkerPolyline _polyline;
        };
        sleep 1; // delay placement

    } forEach _markersData;
};
