#include "script_component.hpp"

params [["_ctrl",controlNull]];

if !([] call FUNC(isAdminOrZeus)) exitWith {_ctrl ctrlShow false};

private _fnc_getHeadlineText = {
    params ["_locStr"];
    private _text = localize _locStr;
    _text = _text + " =======================================================================================";
    _text = [_text,0,30] call BIS_fnc_trimString;
    _text
};

private _fnc_addHeadline = {
    params ["_locStr"];
    private _index = [[_locStr] call _fnc_getHeadlineText,-1] call _fnc_addEntry;
    _ctrl lbSetColor [_index,[0.7,0.7,0.7,1]];
};

private _fnc_addEntry = {
    params ["_text","_data"];
    private _index = _ctrl lbAdd _text;
    _ctrl lbSetData [_index,if !(_data isEqualType "") then {str _data} else {_data}];
    _index
};


//LATEST CONVERSATIONS =========================================================
if (!isNil QGVAR(latestConvos) && {count GVAR(latestConvos) > 0}) then {
    [LSTRING(latestConvos)] call _fnc_addHeadline;
    {
        _x call _fnc_addEntry;
        false
    } count GVAR(latestConvos);
    ["",-1] call _fnc_addEntry;
};


//BY SIDE ======================================================================
[LSTRING(byCategory] call _fnc_addHeadline;
[LLSTRING(everyone),-2] call _fnc_addEntry;
[LLSTRING(otherAdmins),-3] call _fnc_addEntry;
["BLUFOR",-4] call _fnc_addEntry;
["OPFOR",-5] call _fnc_addEntry;
["INDEPENDENT",-6] call _fnc_addEntry;
["CIVILIAN",-7] call _fnc_addEntry;
["",-1] call _fnc_addEntry;


//LIST OF PLAYERS ==============================================================
[LSTRING(byPlayer)] call _fnc_addHeadline;
private _playerData = [];
{
    _playerData pushBack [toUpper ([_x,true] call BIS_fnc_getName),getPlayerUID _x];
    false
} count ([] call CBA_fnc_players);
_playerData sort false;

{
    _x call _fnc_addEntry;
    false
} count _playerData;


//SET CURSEL ===================================================================
if (lbCurSel _ctrl < 0 || lbCurSel _ctrl >= lbSize _ctrl) then {
    _ctrl lbSetCurSel 1;
} else {
    if (call compile (_ctrl lbData (lbCursel _ctrl)) < 0) then {
        _ctrl lbSetCurSel 1;
    };
};
