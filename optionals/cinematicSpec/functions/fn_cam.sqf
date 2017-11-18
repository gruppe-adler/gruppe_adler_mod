#include "script_component.hpp"

private _aceCam = [] call FUNC(getACESpectatorCam);
GRAD_CINEMACAM_LASTPOS = getPos _aceCam;
GRAD_CINEMACAM_VECTORDIR = vectorDir _aceCam;
GRAD_CINEMACAM_VECTORUP = vectorUp _aceCam;
[false] call ACE_spectator_fnc_setSpectator;

[
    GRAD_CINEMACAM_LASTPOS,
    GRAD_CINEMACAM_VECTORDIR,
    GRAD_CINEMACAM_VECTORUP
] call GRAD_cinematicSpec_fnc_cameraOld; // will set GRAD_CINEMACAM

[
    {
        private _bisCam = missionNamespace getVariable ["GRAD_CINEMACAM", objNull];
        private _end = isNull _bisCam;
        _end
    },
    {
        INFO("returning to ACE cam...");
        [true] call ACE_spectator_fnc_setSpectator;
        private _aceCam = [] call FUNC(getACESpectatorCam);
        _aceCam setPos GRAD_CINEMACAM_LASTPOS;
        _aceCam setVectorDir GRAD_CINEMACAM_VECTORDIR;
        _aceCam setVectorUp GRAD_CINEMACAM_VECTORUP;

        // this should not be necessary actually. someone else mustve gone wrong before.
        [{_this cameraEffect ["INTERNAL", "BACK"]; }, _aceCam, 0] call CBA_fnc_waitAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;
