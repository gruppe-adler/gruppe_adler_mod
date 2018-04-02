#include "script_component.hpp"

params [["_side",sideUnknown],["_faction",""],["_loadout",""],["_reapply",false]];

if (_faction == "" ||  _loadout == "" || _side == sideUnknown) exitWith {
    [objNull,format ["Error: Side %1, Loadout %2, Faction %3",_side,_loadout,_faction]] call bis_fnc_showCuratorFeedbackMessage;
};

if (isNil "GRAD_Loadout_fnc_FactionSetLoadout") exitWith {
    [objNull,"Error: GRAD-Loadout not installed or wrong version."] call bis_fnc_showCuratorFeedbackMessage;
};

private _confirmMessageArray = [localize LSTRING(moduleSetLoadoutsSet)];

[_faction,_loadout,true] call GRAD_Loadout_fnc_FactionSetLoadout;

if (_reapply) then {
    _confirmMessageArray pushBack (localize LSTRING(moduleSetLoadoutsReapplied));
    [_side,_faction,_loadout] remoteExec [QFUNC(moduleSetLoadoutsReapply),0,false];
};

_confirmMessageArray pushBack ".";
[objNull,_confirmMessageArray joinString " "] call bis_fnc_showCuratorFeedbackMessage;
