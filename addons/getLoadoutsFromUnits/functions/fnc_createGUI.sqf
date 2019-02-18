#include "script_component.hpp"
params ["_units"];

if(!createDialog QGVAR(getUnitsLoadoutsGui)) exitWith {};

_units spawn {
    disableSerialization;

    //Setting up the dialog
    private _dialog = findDisplay 57834212;
    private _listbox1 = _dialog displayCtrl 1500;
    private _listbox2 = _dialog displayCtrl 1501;
    private _listbox3 = _dialog displayCtrl 1502;
    private _confirmButton = _dialog displayCtrl 2400;
    private _abortButton = _dialog displayCtrl 2401;

    {
        private _listbox = _x;
        diag_log format ["Listbox: %1", _listbox];
        private _categoryIndex = 0;
        {
            private _config = configFile >> "CfgVehicles" >> (typeOf _x)
            private _configName = configName _config;

            private _displayName = [(_config >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
            if (_displayName == "") then {_displayName = _configName};

            _listbox lbAdd _displayName;

            private _data = str [_baseConfigName, _configName];
            _listbox lbSetData [_categoryIndex, _data];

            _categoryIndex = _categoryIndex + 1;

        } forEach _this;


        lbSort _listbox;
        diag_log format ["Listbox1: %1", _listbox];
    } forEach [_listbox1, _listbox2, _listbox3];

    //EH for pressing the OK Button
    _confirmButton ctrlAddEventHandler ["MouseButtonClick", {
        private _dialog = findDisplay 57834212;

        private _name = ctrlText (_dialog displayCtrl 3456);
        private _selection = ["", "", ""];
        {
            if((lbCurSel  _x) != -1) then {
                diag_log format ["Index: %1, Control: %2, Selection: %3, Data: %4", _forEachIndex, _x, (lbCurSel _x), (_x lbData (lbCurSel _x))];
                _selection set [_forEachIndex, (_x lbData (lbCurSel _x))];
            };
        }forEach [
            (_dialog displayCtrl 1500),
            (_dialog displayCtrl 1501),
            (_dialog displayCtrl 1502)
        ];

        diag_log format ["Name: %2, Selection: %1", _name, _selection];


        GVAR(loadoutInfo) = [_name, _selection];
        closeDialog 0;
    }];

    //EH for pressing th Cancel button
    _abortButton ctrlAddEventHandler ["MouseButtonClick", {
        GVAR(loadoutInfo) = false;
        closeDialog 0;
        [{GVAR(loadoutInfo) = nil;},[],5] call CBA_fnc_waitAndExecute;
    }];
};
