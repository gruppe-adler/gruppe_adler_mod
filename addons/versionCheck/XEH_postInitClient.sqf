#include "script_component.hpp"
SCRIPT(XEH_postInitClient);


private _waitUntil = {!isNil "grad_versionCheck_versions_server" && {!isNil "ace_common_checkPBOsWhitelist"}};
private _onTimeOut = {ERROR_2("Server versions received: %1, Whitelist received: %2",!isNil "grad_versionCheck_versions_server",!isNil "ace_common_checkPBOsWhitelist")};

[_waitUntil,{

    _whitelist = toLower ace_common_checkPBOsWhitelist;
    _whitelist = _whitelist splitString "[,""']";

    _kickOnMismatch = "grad_versionCheck_setting_kickOnVersionMismatch" call CBA_settings_fnc_get;
    _kickOnMissingClient = "grad_versionCheck_setting_kickOnMissingClient" call CBA_settings_fnc_get;
    _kickOnMissingServer = "grad_versionCheck_setting_kickOnMissingServer" call CBA_settings_fnc_get;

    grad_versionCheck_missingAddonsClient = [];
    grad_versionCheck_missingAddonsServer = [];
    grad_versionCheck_versionMismatches = [];

    [grad_versionCheck_versions_server,{
        if ([grad_versionCheck_versions,_key] call CBA_fnc_hashHasKey) then {
            _clientVersion = [grad_versionCheck_versions,_key] call CBA_fnc_hashGet;
            [grad_versionCheck_versions,_key] call CBA_fnc_hashRem;

            if (_clientVersion != _value) then {
                grad_versionCheck_versionMismatches pushBack [_key,_value,_clientVersion];
            };
        } else {
            if !(_key in _whitelist) then {
                grad_versionCheck_missingAddonsClient pushBack _key;
            };
        };
    }] call CBA_fnc_hashEachPair;

    [grad_versionCheck_versions,{
        grad_versionCheck_missingAddonsServer pushBack _key;
    }] call CBA_fnc_hashEachPair;

    _kick = switch (true) do {
        case (_kickOnMismatch && {count grad_versionCheck_versionMismatches > 0}): {true};
        case (_kickOnMissingClient && {count grad_versionCheck_missingAddonsClient > 0}): {true};
        case (_kickOnMissingServer && {count grad_versionCheck_missingAddonsServer > 0}): {true};
        default {false};
    };

    [] call grad_versionCheck_fnc_logResult;

    if (_kick) then {
        [{endMission "END1"},[],3] call CBA_fnc_waitAndExecute;
    };
},[],60,_onTimeOut] call CBA_fnc_waitUntilAndExecute;
