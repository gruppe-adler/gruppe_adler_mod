#include "script_component.hpp"

if (GVAR(moduleDiagnosticsRenderRunning)) exitWith {};
GVAR(moduleDiagnosticsRenderRunning) = true;

addMissionEventHandler ["Draw3D", {

    if (isNull (getAssignedCuratorLogic player)) then {
        GVAR(DiagnosticsSettings) = [false,false,false];
    };

    if (({_x} count GVAR(DiagnosticsSettings)) == 0) exitWith {
        removeMissionEventHandler ["Draw3D",_thisEventHandler];
        GVAR(moduleDiagnosticsRenderRunning) = false;
    };


    GVAR(DiagnosticsSettings) params ["_playerFPS","_medicalStatus","_objectLocality","_aiStatus"];
    {
        _unitTextArray = [];

        if (isPlayer _x) then {
            if (_playerFPS) then {
                _unitTextArray append [format ["FPS: %1",_x getVariable [QGVAR(playerFPS),0]]];
            };
            if (_medicalStatus) then {
                _status = [_x] call FUNC(moduleDiagnosticsGetMedicalStatus);
                if (count _status > 0) then {
                    _unitTextArray append _status;
                };
            };
        } else {
            if (_objectLocality) then {
                _unitTextArray append [format ["Owner: %1",(group _x) getVariable [QGVAR(ownerName),"UNKNOWN"]]];
            };
            if (_aiStatus) then {
                _unitTextArray append ([_x] call FUNC(moduleDiagnosticsGetAIStatus));
            };
        };

        _unitText = _unitTextArray joinString " • ";
        drawIcon3D ["",[1,1,1,0.5],getPos _x,1,2,0,_unitText,1,0.03,"RobotoCondensed","center"];

        nil
    } count (allUnits select {_x distance2D curatorCamera < 1000});
}];
