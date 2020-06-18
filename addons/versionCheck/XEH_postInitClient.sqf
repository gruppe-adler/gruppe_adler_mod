#include "script_component.hpp"
SCRIPT(XEH_postInitClient);


private _waitUntil = {!isNil QGVAR(versions_server) && {!isNil "ace_common_checkPBOsWhitelist"}};
private _onTimeOut = {
    _logMessage = format ["Server versions received: %1, Whitelist received: %2",!isNil QGVAR(versions_server),!isNil "ace_common_checkPBOsWhitelist"];
    ERROR(_logMessage);
    [_logMessage] remoteExec [QFUNC(logServer),2,false];

    _message = format ["[GRAD] (versionCheck): %1 versionCheck timed out.",profileName];
    _message remoteExec ["systemChat",0,false];

    if (QGVAR(setting_kickOnTimeout) call CBA_settings_fnc_get) then {
        [{endMission "END1"},[],3] call CBA_fnc_waitAndExecute;
    };
};

[_waitUntil,{

    _whitelist = toLower ace_common_checkPBOsWhitelist;
    _whitelist = _whitelist splitString "[,""']";

    private _serverAddons = [GVAR(versions_server)] call CBA_fnc_hashKeys;
    private _clientAddons = [GVAR(versions)] call CBA_fnc_hashKeys;

    GVAR(missingAddonsServer) = _clientAddons - _serverAddons - _whitelist;
    GVAR(missingAddonsClient) = _serverAddons - _clientAddons - _whitelist;

    GVAR(versionMismatches) = (((_serverAddons arrayIntersect _clientAddons) apply {
            private _clientAddon = [GVAR(versions), _x] call CBA_fnc_hashGet;
            private _serverAddon = [GVAR(versions_server), _x] call CBA_fnc_hashGet;
            [_x, _serverAddon#0, _clientAddon#0];
    }) select {
        (_x select 1) != (_x select 2)
    });

    GVAR(clientUsesPatching) = _clientAddons select {
        private _clientAddon = [GVAR(versions), _x] call CBA_fnc_hashGet;
        (_clientAddon#1)
    };

    if (count GVAR(versionMismatches) > 0 || count GVAR(missingAddonsClient) > 0 || count GVAR(missingAddonsServer) > 0 || count GVAR(clientUsesPatching) > 0) then {
        [] call FUNC(logResult);
        [] call FUNC(openDialog);
    };

},[],60,_onTimeOut] call CBA_fnc_waitUntilAndExecute;
