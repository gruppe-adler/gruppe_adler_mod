#include "script_component.hpp"

params [["_blacklist",false],["_transferID",-1],["_unit",objNull]];

private _grp = group _unit;

private _error = switch (true) do {
    case (isNull _unit): {localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_506"};
    case (isNull _grp || !(side _grp in [east,west,resistance,civilian])): {localize LSTRING(moduleToggleBFTError1)};
    case ({isPlayer _x} count (units _grp) > 0): {localize LSTRING(moduleBlacklistHeadlessError1)};
    default {""};
};
if (_error != "") exitWith {[objNull,_error] call bis_fnc_showCuratorFeedbackMessage};

private _confirmMessageArray = [str _grp];
_grp setVariable ["acex_headless_blacklist",[nil,true] select _blacklist,true];
_confirmMessageArray pushBack ([localize LSTRING(moduleBlacklistUnblacklisted),localize LSTRING(moduleBlacklistBlacklisted)] select _blacklist);


if (_transferID > 0) then {
    [_grp,[-1,owner player,2] select _transferID] remoteExecCall ["setGroupOwner",2,false];
    _confirmMessageArray pushBack (format [localize LSTRING(moduleBlacklistTransferred),toLower ([localize LSTRING(moduleBlacklistPlayer), localize LSTRING(moduleBlacklistServer)] select (_transferID-1))]);
};

[objNull,_confirmMessageArray joinString " "] call bis_fnc_showCuratorFeedbackMessage;
