#include "script_component.hpp"
#include "..\IDCs.hpp"

// called upon display load
// PARAMS:
// 	0: Display <DISPLAY>

params ["_display"];

disableSerialization;

{
    private _listbox = _display displayCtrl _x;
    private _categoryIndex = 0;
    {
        private _config = configFile >> "CfgVehicles" >> (typeOf _x);
        private _configName = configName _config;

        private _displayName = [(_config >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
        if (_displayName == "") then {_displayName = _configName};

        _listbox lbAdd _displayName;

        private _data = str [(typeOf _x), _configName];
        _listbox lbSetData [_categoryIndex, _data];

        _categoryIndex = _categoryIndex + 1;

    } forEach (GVAR(variables) select 0);
    
    lbSort _listbox;
} forEach [IDC_CFR, IDC_SQL, IDC_PTL];
