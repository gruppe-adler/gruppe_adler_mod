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

[{
    params ["","_handle"];
    if (isNil "GRAD_CINEMACAM") exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    player setVectorDirAndUp [vectorDir GRAD_CINEMACAM,vectorUp GRAD_CINEMACAM];
    player setPosASL (getPosASL GRAD_CINEMACAM);
},0.1,[]] call CBA_fnc_addPerFrameHandler;

[
    {
        private _bisCam = missionNamespace getVariable ["GRAD_CINEMACAM", objNull];
        private _end = isNull _bisCam;
        _end
    },
    {
        private _spectatorType = param [0, ""];
        private _specCam = objNull;
        INFO_1("returning to %1 spectator...", _spectatorType);
        switch (_spectatorType) do {
            case "ace": {
                [true] call ACE_spectator_fnc_setSpectator;
                _specCam = ACE_spectator_camera;
            };
            case "eg": {
                ["Initialize", [player]] call BIS_fnc_EGSpectator;
                _specCam = ["GetCamera"] call BIS_fnc_EGSpectator;
            };
            default {
                throw "invalid parameter";
           };
        };

        _specCam setPos GRAD_CINEMACAM_LASTPOS;
        _specCam setVectorDir GRAD_CINEMACAM_VECTORDIR;
        _specCam setVectorUp GRAD_CINEMACAM_VECTORUP;

        // for some reason, I do need to do this for both EG and ACE spec
        [{_this cameraEffect ["INTERNAL", "BACK"]; }, _specCam, 0] call CBA_fnc_waitAndExecute;
    },
    [_spectatorType]
] call CBA_fnc_waitUntilAndExecute;
