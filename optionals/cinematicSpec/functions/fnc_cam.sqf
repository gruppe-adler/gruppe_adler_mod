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

GVAR(lastPos) = getPos _specCam;
GVAR(vectorDir) = vectorDir _specCam;
GVAR(vectorUp) = vectorUp _specCam;


switch (_spectatorType) do {
    case "ace": {
        [false] call ACE_spectator_fnc_setSpectator;
    };
    case "eg": {
	    ["Terminate"] call BIS_fnc_EGSpectator;
    };
    default {
        throw "invalid parameter";
   };
};

[
    GVAR(lastPos),
    GVAR(vectorDir),
    GVAR(vectorUp)
] call FUNC(cameraOld); // will set CINEMACAM

if (!GVAR(registered) && !GVAR(warned)) then {
    systemChat "WARNING: cinematicSpec enabled in a scenario that has NOT declared compatibility. This scenario may break for you if/when it tries to end your spectator mode while you are still in cinematicSpec! See README for details.";
    GVAR(warned) = true;
};

[
    {
        private _bisCam = missionNamespace getVariable [QGVAR(cam), objNull];
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

        _specCam setPos GVAR(lastPos);
        _specCam setVectorDir GVAR(vectorDir);
        _specCam setVectorUp GVAR(vectorUp);

        // for some reason, I do need to do this for both EG and ACE spec
        [{_this cameraEffect ["INTERNAL", "BACK"]; }, _specCam, 0] call CBA_fnc_waitAndExecute;
    },
    [_spectatorType]
] call CBA_fnc_waitUntilAndExecute;
