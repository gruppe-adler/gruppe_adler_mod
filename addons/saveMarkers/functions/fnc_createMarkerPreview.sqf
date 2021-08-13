#include "script_component.hpp"

params [["_markersData",[]]];

private _previewMarkers = missionNamespace getVariable [QGVAR(previewMarkers),[]];
{deleteMarker _x} forEach _previewMarkers;

GVAR(previewMarkers) = [];
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

    private _markerID = format ["_USER_DEFINED #-1/%1/%2",_forEachIndex,_channel];

    private _marker = createMarkerLocal [_markerID,_pos];
    _marker setMarkerAlphaLocal _alpha;
    _marker setMarkerBrushLocal _brush;
    _marker setMarkerColorLocal _color;
    _marker setMarkerDirLocal _dir;
    _marker setMarkerPosLocal _pos;
    _marker setMarkerShapeLocal _shape;
    _marker setMarkerSizeLocal _size;
    _marker setMarkerTextLocal _text;
    _marker setMarkerTypeLocal _type;
    if (count _polyline > 0) then {
        _marker setMarkerPolylineLocal _polyline;
    };

    GVAR(previewMarkers) pushBack _marker;

} forEach _markersData;
