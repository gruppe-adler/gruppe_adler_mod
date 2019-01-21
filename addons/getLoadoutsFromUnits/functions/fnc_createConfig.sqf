#include "script_component.hpp"

private _structuredText = ["class newFaction {"];
private _tab = "    ";
private _doubleTab = _tab + _tab;
private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _split = (typeOf _x) splitString "_";
    _split deleteAt 0;
    private _index = _types pushBackUnique (_split joinString "_");
    _index != -1
};

_structuredText append [
   (_tab + "class AllUnits {"),
   (_doubleTab + "uniform = '';"),
   (_doubleTab + "backpack = '';"),
   (_doubleTab + "vest = '';"),
   (_doubleTab + "primaryWeapon = '';"),
   (_doubleTab + "primaryWeaponMagazine = '';"),
   (_doubleTab + "primaryWeaponMuzzle = '';"),
   (_doubleTab + "primaryWeaponOptics = '';"),
   (_doubleTab + "primaryWeaponPointer = '';"),
   (_doubleTab + "primaryWeaponUnderbarrel = '';"),
   (_doubleTab + "primaryWeaponUnderbarrelMagazine = '';"),
   (_doubleTab + "secondaryWeapon = '';"),
   (_doubleTab + "secondaryWeaponMagazine = '';"),
   (_doubleTab + "secondaryWeaponMuzzle = '';"),
   (_doubleTab + "secondaryWeaponOptics = '';"),
   (_doubleTab + "secondaryWeaponPointer = '';"),
   (_doubleTab + "secondaryWeaponUnderbarrel = '';"),
   (_doubleTab + "secondaryWeaponUnderbarrelMagazine = '';"),
   (_doubleTab + "handgunWeapon = '';"),
   (_doubleTab + "handgunWeaponMagazine = '';"),
   (_doubleTab + "handgunWeaponMuzzle = '';"),
   (_doubleTab + "handgunWeaponOptics = '';"),
   (_doubleTab + "handgunWeaponPointer = '';"),
   (_doubleTab + "handgunWeaponUnderbarrel = '';"),
   (_doubleTab + "handgunWeaponUnderbarrelMagazine = '';"),
   (_doubleTab + "headgear = '';"),
   (_doubleTab + "goggles = '';"),
   (_doubleTab + "nvgoggles = '';"),
   (_doubleTab + "binoculars = '';"),
   (_doubleTab + "map = '';"),
   (_doubleTab + "gps = '';"),
   (_doubleTab + "compass = '';"),
   (_doubleTab + "watch = '';"),
   (_doubleTab + "radio = '';"),
   (_tab + "};")
];

_structuredText pushBack (_tab + "class Type {");

{
    _structuredText append ([_x, (_types select _forEachIndex), _tab] call FUNC(getLoadoutAndFormat));
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

copyToClipboard (_structuredText joinString (toString [13,10]));
