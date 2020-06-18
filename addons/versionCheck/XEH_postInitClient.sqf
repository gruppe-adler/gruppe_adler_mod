#include "script_component.hpp"
SCRIPT(XEH_postInitClient);


private _waitUntil = {!isNil QGVAR(versions_server) && {!isNil "ace_common_checkPBOsWhitelist"}};

[
    _waitUntil,
    FUNC(runClientCheck),
    [],
    60,
    FUNC(timeoutClientCheck),
] call CBA_fnc_waitUntilAndExecute;
