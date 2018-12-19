#include "script_component.hpp"

params ["_area"];

private _allUserMarkers = allMapMarkers select {_x find "_USER_DEFINED" == 0 && {getMarkerType _x != ""}};

private _markersInArea = _allUserMarkers select {
    (getMarkerPos _x) inArea _area
};

_markersInArea
