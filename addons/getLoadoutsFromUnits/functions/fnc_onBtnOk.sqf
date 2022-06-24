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

if (cbChecked (_display displayCtrl IDC_ITEMS)) then {
    {
        [_x] call FUNC(addStandardItems);
    }forEach _units;
};

{
    private _listbox = _display displayCtrl _x;

    private _selectedUnit = (_listbox lbData (lbCurSel _listbox));
    if !(_selectedUnit isEqualTo "") then {
        private _splitt = ((parseSimpleArray _selectedUnit) select 0) splitString "_";
        _splitt deleteAt 0;
        private _joinedString = _splitt joinString "_";
        private _find = _types find _joinedString;

        if (_find > -1) then {
            [_units select _find, _forEachIndex] call FUNC(addMedicItems);
        };
    };  
}forEach [IDC_CFR, IDC_SQL, IDC_PTL];

private _name = ctrlText (_display displayCtrl IDC_NAME);

if (_name isEqualTo "") then {_name = "FactionName";};
_name = [_name] call BIS_fnc_filterString; 

_structuredText pushBack format ["class %1 {", _name];
_structuredText pushBack (_tab + "class AllUnits {");
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
_structuredText pushBack (_tab + "};");
_structuredText pushBack (_tab + "class Type {");

{
    _structuredText append ([_x, (_types select _forEachIndex), _tab] call FUNC(getLoadoutAndFormat));
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

GVAR(variables) = nil;

copyToClipboard (_structuredText joinString (toString [13,10]));
