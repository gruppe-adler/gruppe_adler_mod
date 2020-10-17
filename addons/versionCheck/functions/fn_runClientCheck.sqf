#include "..\script_component.hpp"

private _whitelist = toLower GVAR(setting_whitelist);
_whitelist = parseSimpleArray _whitelist;

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

INFO("version check done.");