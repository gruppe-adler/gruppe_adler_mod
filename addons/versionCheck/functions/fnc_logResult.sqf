#include "..\script_component.hpp"

if (count GVAR(versionMismatches) > 0) then {
    {
        _x params ["_addon","_serverVersion","_clientVersion"];
        _logMessage = format ["Client %1 version mismatch: addon %2, server version %3, client version %4",profileName,_addon,_serverVersion,_clientVersion];
        INFO(_logMessage);
        [_logMessage] remoteExec [QFUNC(logServer),2,false];


        if (_forEachIndex < 3) then {
            _message = format ["[GRAD] (versionCheck): %1 version mismatch in addon %2, server version %3, client version %4)",profileName,_addon,_serverVersion,_clientVersion];
            _message remoteExec ["systemChat",0,false];
        };
        if (_forEachIndex == 3) then {
            _message = format ["[GRAD] (versionCheck): ...and %1 other addons.",(count GVAR(versionMismatches))-3];
            _message remoteExec ["systemChat",0,false];
        };

    } forEach GVAR(versionMismatches);
};

if (count GVAR(missingAddonsClient) > 0) then {

    _logMessage = format ["Client %1 is missing addons: %2",profileName,GVAR(missingAddonsClient)];
    INFO(_logMessage);
    [_logMessage] remoteExec [QFUNC(logServer),2,false];

    _displayList = +GVAR(missingAddonsClient);
    if (count _displayList > 3) then {
        _displayList resize 3;
        _displayList pushBack (format ["...and %1 other addons.",(count GVAR(missingAddonsClient))-3]);
    };

    _message = format ["[GRAD] (versionCheck): %1 missing: %2",profileName,_displayList];
    _message remoteExec ["systemChat",0,false];
};

if (count GVAR(missingAddonsServer) > 0) then {

    _logMessage = format ["Client %1 has additional addons: %2",profileName,GVAR(missingAddonsServer)];
    INFO(_logMessage);
    [_logMessage] remoteExec [QFUNC(logServer),2,false];

    _displayList = +GVAR(missingAddonsServer);
    if (count _displayList > 3) then {
        _displayList resize 3;
        _displayList pushBack (format ["...and %1 other addons.",(count GVAR(missingAddonsServer))-3]);
    };

    _message = format ["[GRAD] (versionCheck): %1 additional addons: %2",profileName,_displayList];
    _message remoteExec ["systemChat",0,false];
};

if (count GVAR(clientUsesPatching) > 0) then {

    _logMessage = format ["Client %1 uses filePatching for %2",profileName,GVAR(clientUsesPatching)];
    INFO(_logMessage);
    [_logMessage] remoteExec [QFUNC(logServer),2,false];

    _displayList = +GVAR(clientUsesPatching);
    if (count _displayList > 3) then {
        _displayList resize 3;
        _displayList pushBack (format ["...and %1 other addons.",(count GVAR(clientUsesPatching))-3]);
    };

    _message = format ["[GRAD] (versionCheck): %1 filePatching for addons: %2",profileName,_displayList];
    _message remoteExec ["systemChat",0,false];
};
