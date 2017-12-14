#include "script_component.hpp"
SCRIPT(XEH_postInitClient);


private _waitUntil = {!isNil "grad_versionCheck_versions_server" && {!isNil "ace_common_checkPBOsWhitelist"}};
private _onTimeOut = {
    _logMessage = format ["Server versions received: %1, Whitelist received: %2",!isNil "grad_versionCheck_versions_server",!isNil "ace_common_checkPBOsWhitelist"];
    ERROR(_logMessage);
    [_logMessage] remoteExec ["grad_versionCheck_fnc_logServer",2,false];

    _message = format ["[GRAD] (versionCheck): %1 versionCheck timed out.",profileName];
    _message remoteExec ["systemChat",0,false];

    if ("grad_versionCheck_setting_kickOnTimeout" call CBA_settings_fnc_get) then {
        [{endMission "END1"},[],3] call CBA_fnc_waitAndExecute;
    };
};

[_waitUntil,{

    _whitelist = toLower ace_common_checkPBOsWhitelist;
    _whitelist = _whitelist splitString "[,""']";

    private _serverAddons = [grad_versionCheck_versions_server] call CBA_fnc_hashKeys;
    private _clientAddons = [grad_versionCheck_versions] call CBA_fnc_hashKeys;

    grad_versionCheck_missingAddonsServer = _clientAddons - _serverAddons - _whitelist;
    grad_versionCheck_missingAddonsClient = _serverAddons - _clientAddons - _whitelist;

    grad_versionCheck_versionMismatches = (((_serverAddons arrayIntersect _clientAddons) apply {
            private _clientVersion = [grad_versionCheck_versions, _x] call CBA_fnc_hashGet;
            private _serverVersion = [grad_versionCheck_versions_server, _x] call CBA_fnc_hashGet;
            [_x, _serverVersion, _clientVersion];
    }) select {
        (_x select 1) != (_x select 2)
    });

    [] call grad_versionCheck_fnc_logResult;

    [] call grad_versionCheck_fnc_openDialog;    
},[],60,_onTimeOut] call CBA_fnc_waitUntilAndExecute;
