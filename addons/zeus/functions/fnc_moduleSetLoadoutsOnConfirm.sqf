#include "script_component.hpp"

params [["_faction",""],["_loadout",""],["_reapply",false]];

if (_faction == "" ||  _loadout == "") exitWith {
    [objNull,format ["Error: Faction %1, Loadout %2",_faction,_loadout]] call bis_fnc_showCuratorFeedbackMessage;
};

if (isNil "GRAD_Loadout_fnc_FactionSetLoadout") exitWith {
    [objNull,"Error: GRAD-Loadout not installed or wrong version."] call bis_fnc_showCuratorFeedbackMessage;
};

private _confirmMessageArray = [localize LSTRING(moduleSetLoadoutsSet)];

[_faction,_loadout] call GRAD_Loadout_fnc_FactionSetLoadout;

if (_reapply) then {
    _confirmMessageArray pushBack (localize LSTRING(moduleSetLoadoutsReapplied));
};

_confirmMessageArray pushBack ".";
[objNull,_confirmMessageArray joinString " "] call bis_fnc_showCuratorFeedbackMessage;
