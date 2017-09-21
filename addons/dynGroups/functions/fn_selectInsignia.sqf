#include "\x\grad\addons\dynGroups\DynamicGroupsCommonDefines.inc"

if !(["PlayerIsLeader",[player]] call BIS_fnc_dynamicGroups) exitWith {};

private _display = uiNamespace getVariable [VAR_UI_DISPLAY, displayNull];
if (isNull _display) exitWith {};

private _list = _display ctrlCreate ["RscListBox",65523];

private _listX = 40 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2);
private _listY = 2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2);
private _listW = 10 * (((safezoneW / safezoneH) min 1.2) / 40);
private _listH = 16.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25);

_list ctrlSetPosition [_listX,_listY,_listW,_listH];
_list ctrlSetFontHeight 0.05;
_list ctrlSetBackgroundColor [0,0,0,0.69999999];
_list ctrlCommit 0;

private _insignias = "true" configClasses (configfile >> "CfgUnitInsignia");
{
    _list lbAdd ([_x,"displayName",""] call BIS_fnc_returnConfigEntry);
    _list lbSetPicture [_forEachIndex,[_x,"texture",""] call BIS_fnc_returnConfigEntry];
    _list lbSetData [_forEachIndex,configName _x];
} forEach _insignias;

_list ctrlAddEventHandler ["LBSelChanged",{
    params ["_list","_selIndex"];
    _insignia = _list lbData _selIndex;

    if (["PlayerIsLeader",[player]] call BIS_fnc_dynamicGroups) then {
        _group = group player;
        _group setVariable [VAR_GROUP_INSIGNIA, _insignia, IS_PUBLIC];

        {
            ["OnPlayerGroupChanged", [_x, _group]] call GROUPS;
        } forEach units _group;

        ["Update",[false]] call DISPLAY;
    };

    [{ctrlDelete _this}, _list] call (uiNamespace getVariable "CBA_fnc_execNextFrame");
}];
