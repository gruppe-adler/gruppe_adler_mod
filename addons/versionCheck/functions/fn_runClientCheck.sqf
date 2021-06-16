#include "..\script_component.hpp"

private _whitelist = (toLower ace_common_checkPBOsWhitelist) splitString "[,""']";

private _serverAddons = keys GVAR(versions_server);
private _clientAddons = keys GVAR(versions);

GVAR(missingAddonsServer) = _clientAddons - _serverAddons - _whitelist;
GVAR(missingAddonsClient) = _serverAddons - _clientAddons - _whitelist;

GVAR(versionMismatches) = (((_serverAddons arrayIntersect _clientAddons) apply {
		private _clientAddon = GVAR(versions) get _x;
		private _serverAddon = GVAR(versions_server) get _x;
		[_x, _serverAddon#0, _clientAddon#0];
}) select {
	(_x select 1) != (_x select 2)
});

GVAR(clientUsesPatching) = _clientAddons select {
	private _clientAddon = GVAR(versions) get _x;
	(_clientAddon#1)
};

if (count GVAR(versionMismatches) > 0 || count GVAR(missingAddonsClient) > 0 || count GVAR(missingAddonsServer) > 0 || count GVAR(clientUsesPatching) > 0) then {
	[] call FUNC(logResult);
	[] call FUNC(openDialog);
};

INFO("version check done.");
