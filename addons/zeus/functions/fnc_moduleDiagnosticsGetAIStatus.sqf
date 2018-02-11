#include "script_component.hpp"

params [["_unit",objNull]];

private _aiStatus = [];
private _grp = group _unit;

if (_unit == leader _grp) then {
    _aiStatus append [combatMode _grp,behaviour leader _grp];
    _waypointSpeed = waypointSpeed [_grp,currentWaypoint _grp];
    if (_waypointSpeed != "") then {_aiStatus pushBack _waypointSpeed};

};

if (fleeing _unit) then {
    _aiStatus pushBack localize LSTRING(fleeing);
};

private _suppression = getSuppression _unit;
if (_suppression > 0) then {
    _aiStatus pushBack format ["%1%2 %3",round (_suppression * 100),"%",localize LSTRING(suppressed)];
};

_aiStatus
