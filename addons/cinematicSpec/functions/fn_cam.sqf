#include "script_component.hpp"

private _aceCam = [] call FUNC(getACESpectatorCam);
BIS_DEBUG_CAM_LASTPOS = getPos _aceCam;
BIS_DEBUG_CAM_LASTDIR = getDir _aceCam;
[false] call ACE_spectator_fnc_setSpectator;

[] call BIS_fnc_cameraOld; // will set BIS_DEBUG_CAM

private _bisCam = missionNamespace getVariable ["BIS_DEBUG_CAM", objNull];
_bisCam camCommand "INERTIA ON";
_bisCam setPos BIS_DEBUG_CAM_LASTPOS;
_bisCam setDir BIS_DEBUG_CAM_LASTDIR;

[
    {
        private _bisCam = missionNamespace getVariable ["BIS_DEBUG_CAM", objNull];
        private _end = isNull _bisCam;
        if (!_end) then {
            BIS_DEBUG_CAM_LASTDIR = getDir _bisCam;
        };
        _end
    },
    {
        INFO("returning to ACE cam...");
        [true] call ACE_spectator_fnc_setSpectator;
        private _aceCam = [] call FUNC(getACESpectatorCam);
        _aceCam setPos BIS_DEBUG_CAM_LASTPOS;
        _aceCam setDir BIS_DEBUG_CAM_LASTDIR;

        // this should not be necessary actually. someone else mustve gone wrong before.
        [{_this cameraEffect ["INTERNAL", "BACK"]; }, _aceCam, 0] call CBA_fnc_waitAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;
