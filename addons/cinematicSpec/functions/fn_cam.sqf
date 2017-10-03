#include "script_component.hpp"

BIS_DEBUG_CAM_LASTPOS = getPos ACE_spectator_camera;
BIS_DEBUG_CAM_LASTDIR = getDir ACE_spectator_camera;
[false] call ace_spectator_fnc_setSpectator;

[] call BIS_fnc_cameraOld; // will set BIS_DEBUG_CAM
BIS_DEBUG_CAM camCommand "INERTIA ON";
BIS_DEBUG_CAM setPos BIS_DEBUG_CAM_LASTPOS;
BIS_DEBUG_CAM setDir BIS_DEBUG_CAM_LASTDIR;
[
    {
        private _end = isNil "BIS_DEBUG_CAM";
        if (!_end) then {
            BIS_DEBUG_CAM_LASTDIR = getDir BIS_DEBUG_CAM;
        };
        _end
    },
    {
        ACE_spectator_camPos = BIS_DEBUG_CAM_LASTPOS;
        [true] call ace_spectator_fnc_setSpectator;
        ACE_spectator_camera setPos BIS_DEBUG_CAM_LASTPOS;
        ACE_spectator_camera setDir BIS_DEBUG_CAM_LASTDIR;
    }
] call CBA_fnc_waitUntilAndExecute;
