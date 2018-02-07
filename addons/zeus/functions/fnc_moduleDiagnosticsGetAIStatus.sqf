#include "script_component.hpp"

params [["_unit",objNull]];

private _aiStatus = [];
private _grp = group _unit;

if (_unit == leader _grp) then {
    _aiStatus append [combatMode _grp,behaviour leader _grp];
    if !(currentWaypoint _grp > count (waypoints _grp)) then {
        _aiStatus pushBack (waypointSpeed [_grp,currentWaypoint _grp]);
    };
};

if (fleeing _unit) then {
    _aiStatus pushBack "fleeing";
};

private _suppression = getSuppression _unit;
if (_suppression > 0) then {
    _aiStatus pushBack format ["%1%2 suppressed",round (_suppression * 100),"%"];
};

_aiStatus
