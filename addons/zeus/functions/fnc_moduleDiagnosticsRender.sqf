#include "script_component.hpp"

if (GVAR(moduleDiagnosticsRenderRunning)) exitWith {};
GVAR(moduleDiagnosticsRenderRunning) = true;

addMissionEventHandler ["Draw3D", {

    if (isNull (getAssignedCuratorLogic player)) then {
        GVAR(DiagnosticsSettings) = [false,false,false,false,false];
    };

    if (({_x} count GVAR(DiagnosticsSettings)) == 0) exitWith {
        removeMissionEventHandler ["Draw3D",_thisEventHandler];
        GVAR(moduleDiagnosticsRenderRunning) = false;
    };


    GVAR(DiagnosticsSettings) params ["_playerFPS","_medicalStatus","_objectLocality","_aiStatus","_summaryWindow"];
    {
        _unitTextArray = [];

        if (isPlayer _x) then {
            if (_playerFPS) then {
                _unitTextArray append [format ["%1 FPS",_x getVariable [QGVAR(playerFPS),0]]];
            };
            if (_medicalStatus) then {
                _status = [_x] call FUNC(moduleDiagnosticsGetMedicalStatus);
                if (count _status > 0) then {
                    _unitTextArray append _status;
                };
            };
        } else {
            if (_objectLocality && {_x == leader group _x}) then {
                _unitTextArray append [format ["%1 %2",localize LSTRING(onOwner),(group _x) getVariable [QGVAR(ownerName),"UNKNOWN"]]];
            };
            if (_aiStatus) then {
                _unitTextArray append ([_x] call FUNC(moduleDiagnosticsGetAIStatus));
            };
        };

        _unitText = _unitTextArray joinString " • ";

        // get ASL pos and convert to AGL here so text follows unit up stairs and such
        drawIcon3D ["",[1,1,1,0.5],ASLtoAGL getPosASL _x,1,2,0,_unitText,2,0.03,"RobotoCondensed","center"];

    } forEach (allUnits select {_x distance2D curatorCamera < 1000});
}];
