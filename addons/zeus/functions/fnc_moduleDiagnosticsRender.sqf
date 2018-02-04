#include "script_component.hpp"

if (GVAR(moduleDiagnosticsRenderRunning)) exitWith {};
GVAR(moduleDiagnosticsRenderRunning) = true;

addMissionEventHandler ["Draw3D", {

    if (isNull (getAssignedCuratorLogic player)) then {
        GVAR(DiagnosticsSettings) = [false,false];
    };

    if (({_x} count GVAR(DiagnosticsSettings)) == 0) exitWith {
        removeMissionEventHandler ["Draw3D",_thisEventHandler];
        GVAR(moduleDiagnosticsRenderRunning) = false;
    };


    GVAR(DiagnosticsSettings) params ["_playerFPS","_objectLocality"];
    {
        _unitTextArray = [];

        if (_playerFPS && isPlayer _x) then {
            _unitTextArray append [format ["FPS: %1",_x getVariable [QGVAR(playerFPS),0]]];
        };

        if (_objectLocality && !isPlayer _x) then {
            _unitTextArray append [format ["Owner: %1",(group _x) getVariable [QGVAR(ownerName),"UNKNOWN"]]];
        };

        _unitText = _unitTextArray joinString " • ";
        drawIcon3D ["",[1,1,1,0.5],getPos _x,1,2,0,_unitText,0,0.03,"RobotoCondensed","center"];

        nil
    } count (allUnits select {_x distance2D curatorCamera < 1000});
}];
