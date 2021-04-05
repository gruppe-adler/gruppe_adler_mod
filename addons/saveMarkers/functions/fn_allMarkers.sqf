#include "script_component.hpp"

params [["_selectEditorMarkers",false]];

private _allMarkers = allMapMarkers select {
    !(markerType _x == "Empty") &&
    ((markerType _x != "") || (markerShape _x == "POLYLINE")) &&
    {(_x find "ACE_BFT_") != 0}
};

if (!_selectEditorMarkers) then {
    _allMarkers = _allMarkers select {_x find "_USER_DEFINED" == 0};
};

_allMarkers
