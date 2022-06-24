#include "..\script_component.hpp"

if (count grad_versionCheck_versionMismatches > 0) then {
    {
        _x params ["_addon","_serverVersion","_clientVersion"];
        _logMessage = format ["Client %1 version mismatch: addon %2, server version %3, client version %4",profileName,_addon,_serverVersion,_clientVersion];
        INFO(_logMessage);
        [_logMessage] remoteExec ["grad_versionCheck_fnc_logServer",2,false];


        if (_forEachIndex < 3) then {
            _message = format ["[GRAD] (versionCheck): %1 version mismatch in addon %2, server version %3, client version %4)",profileName,_addon,_serverVersion,_clientVersion];
            _message remoteExec ["systemChat",0,false];
        };
        if (_forEachIndex == 3) then {
            _message = format ["[GRAD] (versionCheck): ...and %1 other addons.",(count grad_versionCheck_versionMismatches)-3];
            _message remoteExec ["systemChat",0,false];
        };

    } forEach grad_versionCheck_versionMismatches;
};

if (count grad_versionCheck_missingAddonsClient > 0) then {

    _logMessage = format ["Client %1 is missing addons: %2",profileName,grad_versionCheck_missingAddonsClient];
    INFO(_logMessage);
    [_logMessage] remoteExec ["grad_versionCheck_fnc_logServer",2,false];

    _displayList = +grad_versionCheck_missingAddonsClient;
    if (count _displayList > 3) then {
        _displayList resize 3;
        _displayList pushBack (format ["...and %1 other addons.",(count grad_versionCheck_missingAddonsClient)-3]);
    };

    _message = format ["[GRAD] (versionCheck): %1 missing: %2",profileName,_displayList];
    _message remoteExec ["systemChat",0,false];
};

if (count grad_versionCheck_missingAddonsServer > 0) then {

    _logMessage = format ["Client %1 has additional addons: %2",profileName,grad_versionCheck_missingAddonsServer];
    INFO(_logMessage);
    [_logMessage] remoteExec ["grad_versionCheck_fnc_logServer",2,false];

    _displayList = +grad_versionCheck_missingAddonsServer;
    if (count _displayList > 3) then {
        _displayList resize 3;
        _displayList pushBack (format ["...and %1 other addons.",(count grad_versionCheck_missingAddonsServer)-3]);
    };

    _message = format ["[GRAD] (versionCheck): %1 additional addons: %2",profileName,_displayList];
    _message remoteExec ["systemChat",0,false];
};
