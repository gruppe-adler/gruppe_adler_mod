#include "script_component.hpp"

params ["_playerID", "_markerIDIndex", "_markersData"];

[
    {
        params ["_playerID", "_markerIDIndex", "_markersData"];

        private _idx = (count _markersData) - 1;
        private _markerData = _markersData select _idx;

        _markerIDIndex = [_playerID, _markerIDIndex, _markerData] call FUNC(loadMarker);

        _markersData resize _idx;

        if (count _markersData == 0) then {
            INFO_1("finished loading markers for player %1", _playerID);
            (format ["grad-saveMarkers: %1 has finished loading marker set.",profileName]) remoteExec ["systemChat",0,false];
        } else {
            [_playerID, _markerIDIndex + 1, _markersData] call FUNC(loadMarkersLoop);
        };
    },
    [_playerID, _markerIDIndex, _markersData],
    1
] call CBA_fnc_waitAndExecute;
