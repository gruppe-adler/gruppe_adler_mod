/*
    @Authors
        Christian 'chris5790' Klemm
    @Project
        Gruppe Adler Mod
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/
#include "script_component.hpp"


//curator points fix
if (isServer) then {
    {
        _x addCuratorPoints 1;
    } forEach allCurators;
};


//moduleDiagnostics
QGVAR(usersPlayerFPS) addPublicVariableEventhandler FUNC(moduleDiagnosticsUpdateFPS);
[QGVAR(moduleDiagnosticsServerToggle),FUNC(moduleDiagnosticsServerToggle)] call CBA_fnc_addEventHandler;
if (count (missionNamespace getVariable [QGVAR(usersPlayerFPS),[]]) > 0) then {[] call FUNC(moduleDiagnosticsUpdateFPS)};
if (isServer) then {addMissionEventHandler ["HandleDisconnect",FUNC(moduleDiagnosticsHandleDisconnect)]};
