#include "script_component.hpp"
#include "..\IDCs.hpp"

// called upon display load
// PARAMS:
// 	0: Display <DISPLAY>

params ["_control"];

disableSerialization;

private _display = ctrlParent _control;
private _structuredText = [];

private _tab = "    ";
private _doubleTab = _tab + _tab;

GVAR(variables) params ["_units", "_types"];

private _itemsChecked = cbChecked (_display displayCtrl IDC_ITEMS);
private _loadouts = [];

{
    _loadouts pushBack [_types select _forEachIndex, getUnitLoadout _x];
}forEach _units;

private _loadoutHash = [_loadouts, 0] call CBA_fnc_hashCreate;
private _typesMedical = [];
{
    private _listbox = _display displayCtrl _x;

    private _selectedUnit = (_listbox lbData (lbCurSel _listbox));
    if !(_selectedUnit isEqualTo "") then {
        private _splitt = ((parseSimpleArray _selectedUnit) select 0) splitString "_";
        _splitt deleteAt 0;
        private _joinedString = _splitt joinString "_";
        private _find = _types find _joinedString;

        if (_find > -1) then {
            _typesMedical pushBack [_joinedString, _forEachIndex];
        };
    };  
}forEach [IDC_CFR, IDC_SQL, IDC_PTL];

private _name = ctrlText (_display displayCtrl IDC_NAME);

if (_name isEqualTo "") then {_name = "FactionName";};
_name = [_name] call BIS_fnc_filterString; 

_structuredText pushBack format ["class %1 {", _name];
_structuredText pushBack (_tab + "class AllUnits {");

if (count _types > 2) then {
    private _baseLoadout = [_loadoutHash, _types] call FUNC(createBaseClass);
    
    _structuredText append ([_baseLoadout, _tab] call FUNC(getBaseLoadoutAndFormat));
} else {
    _structuredText append ([
        "uniform",
        "vest",
        "backpack",
        "headgear",
        "primaryWeapon",
        "primaryWeaponMagazine",
        "primaryWeaponMuzzle",
        "primaryWeaponOptics",
        "primaryWeaponPointer",
        "primaryWeaponUnderbarrel",
        "primaryWeaponUnderbarrelMagazine",
        "secondaryWeapon",
        "secondaryWeaponMagazine",
        "secondaryWeaponMuzzle",
        "secondaryWeaponOptics",
        "secondaryWeaponPointer",
        "secondaryWeaponUnderbarrel",
        "secondaryWeaponUnderbarrelMagazine",
        "handgunWeapon",
        "handgunWeaponMagazine",
        "handgunWeaponMuzzle",
        "handgunWeaponOptics",
        "handgunWeaponPointer",
        "handgunWeaponUnderbarrel",
        "handgunWeaponUnderbarrelMagazine",
        "goggles",
        "nvgoggles",
        "binoculars",
        "map",
        "gps",
        "compass",
        "watch",
        "radio"
    ] apply {_doubleTab + _x + " = """";"});
    _structuredText pushBack "};";
};

_structuredText pushBack (_tab + "class Type {");

{
    _structuredText append ([_loadoutHash, (_types select _forEachIndex), _tab, _typesMedical, _itemsChecked] call FUNC(getLoadoutAndFormat));
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

GVAR(variables) = nil;

copyToClipboard (_structuredText joinString (toString [13,10]));
