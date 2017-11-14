#include "script_component.hpp"

private _aceCam = ACE_spectator_camera;
BIS_DEBUG_CAM_LASTPOS = getPos _aceCam;
BIS_DEBUG_CAM_VECTORDIR = vectorDir _aceCam;
BIS_DEBUG_CAM_VECTORUP = vectorUp _aceCam;

// We cannot use ACE_spectator_fnc_setSpectator here, because if we do, the scenario creator (who has no idea about
// our neat little tricks here)) must be able to rely on ACE_spectator_fnc_setSpectator to *disable* spectator mode.
// And that wont work if ACE spectator already is disabled. People would be stuck in our camera forever.
// so: do the disabling manual-ish, and also attach a handler to "spectator set" event
//
// [false] call ACE_spectator_fnc_setSpectator;

//private _disableACESpectator = {
//    [false] call ace_spectator_fnc_ui;
//    [false] call ace_spectator_fnc_cam;
//};
//
//INFO("hack to get ACE spectator out of the way");
// call _disableACESpectator;

// ^ but this is wrong alöso, because it leaves ace spec in an inconsistent state, which WILL lead to errors
[false] call ACE_spectator_fnc_setSpectator;

[
    BIS_DEBUG_CAM_LASTPOS,
    BIS_DEBUG_CAM_VECTORDIR,
    BIS_DEBUG_CAM_VECTORUP
] call GRAD_cinematicSpec_fnc_cameraOld; // will set BIS_DEBUG_CAM

[
    {
       isNil QUOTE(BIS_DEBUG_CAM);
    },
    {
        INFO("BIS_DEBUG_CAM is nil, returning to ACE cam...");
        [true] call ACE_spectator_fnc_setSpectator;
        private _aceCam = ACE_spectator_camera;
        _aceCam setPos BIS_DEBUG_CAM_LASTPOS;
        _aceCam setVectorDir BIS_DEBUG_CAM_VECTORDIR;
        _aceCam setVectorUp BIS_DEBUG_CAM_VECTORUP;

        // this should not be necessary actually. something else mustve gone wrong before. :/
        [
            {
                _this cameraEffect ["INTERNAL", "BACK"];
            },
            _aceCam
        ] call CBA_fnc_waitAndExecute;
    }
] call CBA_fnc_waitUntilAndExecute;
