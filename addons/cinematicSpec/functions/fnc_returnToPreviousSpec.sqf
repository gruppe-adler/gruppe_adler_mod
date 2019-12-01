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
