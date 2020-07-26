#include "script_component.hpp"

// save direct play IDs in namespace for marker ownership
GVAR(idNamespace) = [true] call CBA_fnc_createNamespace;
publicVariable QGVAR(idNamespace);
addMissionEventHandler ["PlayerConnected",{
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    GVAR(idNamespace) setVariable [_uid,_idstr,true];
}];
