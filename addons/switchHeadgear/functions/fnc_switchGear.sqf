#include "script_component.hpp"
params ["",["_unit",objNull]];

private _currentHeadgear = headgear _unit;
private _newHeadgear = _unit getVariable [QGVAR(switchHeadgear), ""];

_unit setVariable [QGVAR(switchHeadgear), _currentHeadgear, true];
removeHeadgear _unit;
_unit addHeadgear _newHeadgear;

private _msg = "";
if (_currentHeadgear != "") then {
    _msg = _msg + " " + format[localize LSTRING(helmetStored), getText (configfile >> "CfgWeapons" >> _currentHeadgear >> "displayName")];
};
if (_newHeadgear != "") then {
    _msg = _msg + " " + format[localize LSTRING(helmetRestored), getText (configfile >> "CfgWeapons" >> _newHeadgear >> "displayName")];
};
hint _msg;
