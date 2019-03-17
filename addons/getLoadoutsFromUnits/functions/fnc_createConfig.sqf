#include "script_component.hpp"

private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _split = (typeOf _x) splitString "_";
    _split deleteAt 0;
    private _index = _types pushBackUnique (_split joinString "_");
    _index != -1
};
<<<<<<< Updated upstream
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

GVAR(variables) = [_units, _types];

//Create Gui to get loadout name and medic equip
[_units, _types] call FUNC(createGUI);
>>>>>>>
