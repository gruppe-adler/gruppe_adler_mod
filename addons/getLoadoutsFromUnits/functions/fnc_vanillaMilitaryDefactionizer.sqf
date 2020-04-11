#include "script_component.hpp"

params ["_unit"];

private _faction = faction _unit;
private _type = typeOf _unit;
private _result = "";

if (side _unit == civilian) exitWith {""};

private _getTypePrefix = {
     params ["_faction"];

    private _prefix =  _faction select [0, (count _faction) - 1]; // cut suffix F
    private _initial = _prefix select [0, 1];

    (_initial + (_prefix select [3])); // cut middle part & return
};

private _typePrefix = [_faction] call _getTypePrefix;

private _idx = _type find _typePrefix;
if (_idx == 0) then {
    _result = _type select [count _typePrefix];
} else {
    _result = "";
};

_result