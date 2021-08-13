#include "script_component.hpp"

[{
    params [["_tree",objNull]];
    if (isNull _tree) exitWith {};

    if (((vectorUp _tree) select 2) > 0.5) then {
        ["ace_common_hideObjectGlobal", [_tree, true]] call CBA_fnc_serverEvent;
    };
},_this,2] call CBA_fnc_waitAndExecute;
