#include "script_component.hpp"

private _spectatorType = param [0, ""];
private _specCam = objNull;
switch (_spectatorType) do {
    case "ace": {
        _specCam = ACE_spectator_camera;
    };
    case "eg": {
        _specCam = ["GetCamera"] call BIS_fnc_EGSpectator;
    };
    default {
        throw "invalid parameter";
   };
};

GRAD_CINEMACAM_LASTPOS = getPos _specCam;
GRAD_CINEMACAM_VECTORDIR = vectorDir _specCam;
GRAD_CINEMACAM_VECTORUP = vectorUp _specCam;


switch (_spectatorType) do {
    case "ace": {
        [false] call ACE_spectator_fnc_setSpectator;
        [true] call FUNC(setRadioSpectator);
    };
    case "eg": {
	    ["Terminate"] call BIS_fnc_EGSpectator;
    };
    default {
        throw "invalid parameter";
   };
};

[
    GRAD_CINEMACAM_LASTPOS,
    GRAD_CINEMACAM_VECTORDIR,
    GRAD_CINEMACAM_VECTORUP
] call GRAD_cinematicSpec_fnc_cameraOld; // will set GRAD_CINEMACAM

if (!GVAR(registered) && !GVAR(warned)) then {
    systemChat "WARNING: cinematicSpec enabled in a scenario that has NOT declared compatibility. This scenario may break for you if/when it tries to end your spectator mode while you are still in cinematicSpec! See README for details.";
    GVAR(warned) = true;
};

[
    {
        private _bisCam = missionNamespace getVariable ["GRAD_CINEMACAM", objNull];
        private _end = isNull _bisCam;
        _end
    },
    FUNC(returnToPreviousSpec),
    [_spectatorType]
] call CBA_fnc_waitUntilAndExecute;
