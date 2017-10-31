#include "script_component.hpp"

private _aceCam = [] call FUNC(getACESpectatorCam);
BIS_DEBUG_CAM_LASTPOS = getPos _aceCam;
BIS_DEBUG_CAM_VECTORDIR = vectorDir _aceCam;
BIS_DEBUG_CAM_VECTORUP = vectorUp _aceCam;
[false] call ACE_spectator_fnc_setSpectator;

[
BIS_DEBUG_CAM_LASTPOS,
BIS_DEBUG_CAM_VECTORDIR,
BIS_DEBUG_CAM_VECTORUP
] call GRAD_cinematicSpec_fnc_cameraOld; // will set BIS_DEBUG_CAM

[
    {
        private _bisCam = missionNamespace getVariable ["BIS_DEBUG_CAM", objNull];
        private _end = isNull _bisCam;
        _end
    },
    {
        INFO("returning to ACE cam...");
        [true] call ACE_spectator_fnc_setSpectator;
        private _aceCam = [] call FUNC(getACESpectatorCam);
        _aceCam setPos BIS_DEBUG_CAM_LASTPOS;
        _aceCam setVectorDir BIS_DEBUG_CAM_VECTORDIR;
        _aceCam setVectorUp BIS_DEBUG_CAM_VECTORUP;

        // this should not be necessary actually. someone else mustve gone wrong before.
        [{_this cameraEffect ["INTERNAL", "BACK"]; }, _aceCam, 0] call CBA_fnc_waitAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;