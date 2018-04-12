#include "script_component.hpp"

[{
    params [["_tree",objNull]];
    if (isNull _tree) exitWith {};

    if (((vectorUp _tree) select 2) > 0.5) then {
        [_tree] remoteExec ["hideObjectGlobal",2,false];
    };
},_this,2] call CBA_fnc_waitAndExecute;
