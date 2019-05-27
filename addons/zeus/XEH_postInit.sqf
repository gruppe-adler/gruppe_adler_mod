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
if (hasInterface) then {
    QGVAR(usersPlayerFPS) addPublicVariableEventhandler FUNC(moduleDiagnosticsUpdateFPS);
    if (count (missionNamespace getVariable [QGVAR(usersPlayerFPS),[]]) > 0) then {[] call FUNC(moduleDiagnosticsUpdateFPS)};
};

if (isServer) then {
    [QGVAR(moduleDiagnosticsServerToggle),FUNC(moduleDiagnosticsServerToggle)] call CBA_fnc_addEventHandler;
    addMissionEventHandler ["HandleDisconnect",FUNC(moduleDiagnosticsHandleDisconnect)];
    ["ace_unconscious",{
        params ["_unit","_unconsc"];
        if (isPlayer _unit ) then {
            (_unit) setVariable [QGVAR(downSince),if (_unconsc) then {CBA_missionTime} else {nil},true];
        };
    }] call CBA_fnc_addEventHandler;
};


if (hasInterface) then {
    [
        {!isNil (player getVariable ["grad_loadout_applicationCount", nil])},
        {
            [] call FUNC(moduleDiagnosticsGetPlayerFreqsAtStart);
        },
        [],
        15,
        {
            [] call FUNC(moduleDiagnosticsGetPlayerFreqsAtStart);
        }
    ] call CBA_fnc_waitUntilAndExecute;
};
