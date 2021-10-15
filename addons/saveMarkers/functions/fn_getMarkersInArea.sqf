#include "script_component.hpp"

params ["_area",["_selectEditorMarkers",false]];

private _markersInArea = ([_selectEditorMarkers] call FUNC(allMarkers)) select {
    (getMarkerPos _x) inArea _area
};

_markersInArea
