#include "..\script_component.hpp"

assert(!isServer);

private _logMessage = format [
	"Server versions received: %1, Whitelist received: %2",
	!isNil QGVAR(versions_server),
	!isNil "ace_common_checkPBOsWhitelist"
];
ERROR(_logMessage);

[_logMessage] remoteExec [QFUNC(logServer),2,false];

_message = format ["[GRAD] (versionCheck): %1 versionCheck timed out.",profileName];
_message remoteExec ["systemChat",0,false];

if (QGVAR(setting_kickOnTimeout) call CBA_settings_fnc_get) then {
	[{endMission "END1"},[],3] call CBA_fnc_waitAndExecute;
};