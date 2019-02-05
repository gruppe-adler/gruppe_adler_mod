#include "script_component.hpp"

private _structuredText = [];
private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _split = (typeOf _x) splitString "_";
    _split deleteAt 0;
    private _index = _types pushBackUnique (_split joinString "_");
    _index != -1
};

//Create Gui to get loadout name and medic equip
[_units, _types] call FUNC(createGUI);

[{
    //Wait until GUI is done
    diag_log str(GVAR(loadoutInfo));
    !(isNil GVAR(loadoutInfo))
},{
    //if GUI is canceled, stop
    if (GVAR(loadoutInfo) isEqualType false) exitWith {};

    params ["_structuredText", "_units", "_types"];

    private _tab = "    ";
    private _doubleTab = _tab + _tab;

    {
        [_x select 0, _x select 1] call FUNC(addMedicItems);
    }forEach (GVAR(loadoutInfo) select 1);

    diag_log format ["%1", GVAR(loadoutInfo)];

    _structuredText pushBack format ["class %1 {", (GVAR(loadoutInfo) select 0)];
    _structuredText pushBack (_tab + "class AllUnits {");
    _structuredText append ([
        "uniform",
        "backpack",
        "vest",
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
        "headgear",
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

    copyToClipboard (_structuredText joinString (toString [13,10]));
},[_structuredText, _units, _types]] call CBA_fnc_waitUntilAndExecute;
