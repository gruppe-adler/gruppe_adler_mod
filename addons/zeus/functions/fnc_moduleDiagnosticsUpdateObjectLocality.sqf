#include "script_component.hpp"

if (missionNamespace getVariable [QGVAR(updateObjectLocalityRunning),false]) exitWith {};
GVAR(updateObjectLocalityRunning) = true;

[{
    params ["_args","_handle"];

    _nonPlayerGroups = allGroups select {{isPlayer _x} count (units _x) == 0};

    if (count GVAR(usersObjectLocality) == 0) exitWith {
        GVAR(updateObjectLocalityRunning) = false;
        {_x setVariable [QGVAR(ownerName),nil,true]; nil} count _nonPlayerGroups;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    {
        [_x,QGVAR(ownerName),[groupOwner _x] call FUNC(moduleDiagnosticsGetOwnerName)] call CBA_fnc_setVarNet;
        nil
    } count _nonPlayerGroups;

},10,[]] call CBA_fnc_addPerFrameHandler;
