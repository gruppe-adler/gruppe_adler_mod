#include "script_component.hpp"

params ["_unit", "_breakline", "_tab"];

private _return = "";
private _loadout = getUnitLoadout _unit;

if (_loadout isEqualTo []) exitWith {_result};
private _trippleTab = _tab + _tab + _tab;

private _split = (typeOf _unit) splitString "_";
_split deleteAt 0;
private _type = _split joinString "_";
_return = _return = _return + _breakline + _tab + _tab + format ["class %1 {", _type];

//Clothing
_return = _return + _breakline + _trippleTab + format ["uniform = '%1'", [_loadout select 3] call FUNC(getClothes)];
_return = _return + _breakline + _trippleTab + format ["vest = '%1'", [_loadout select 4] call FUNC(getClothes)];
_return = _return + _breakline + _trippleTab + format ["backpack = '%1'", [_loadout select 5] call FUNC(getClothes)];
_return = _return + _breakline + _trippleTab + format ["headgear = '%1'", [_loadout select 6] call FUNC(getClothes)];

private _weaponArray = [];
//Primary Weapon
_weaponArray = [_loadout select 0] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "primaryWeapon = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponMagazine = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponOptics = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponPointer = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponMuzzle = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponUnderbarrel = ''";
   _return = _return + _breakline + _trippleTab + "primaryWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + _trippleTab + format ["primaryWeapon = '%1'",  _weapon];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + _trippleTab + format ["primaryWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
};


//Secondary Weapon / Launcher
_weaponArray = [_loadout select 1] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "secondaryWeapon = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponMagazine = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponOptics = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponPointer = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponMuzzle = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponUnderbarrel = ''";
   _return = _return + _breakline + _trippleTab + "secondaryWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeapon = '%1'",  _weapon];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + _trippleTab + format ["secondaryWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
}

//Pistol
_weaponArray = [_loadout select 2] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "handgunWeapon = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponMagazine = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponOptics = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponPointer = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponMuzzle = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponUnderbarrel = ''";
   _return = _return + _breakline + _trippleTab + "handgunWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + _trippleTab + format ["handgunWeapon = '%1'",  _weapon];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + _trippleTab + format ["handgunWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
}

//Basic Items (Binocular, NVG, Maps, etc.)
_return = _return + _breakline + _trippleTab + if !(_loadout select 7 isEqualTo []) then {
   format ["binoculars = '%1'", _loadout select 7 select 0]
} else {
   "binoculars = ''"
};

_return = _return + _breakline + _trippleTab + format ["map = '%1'", _loadout select 8 select 0];
_return = _return + _breakline + _trippleTab + format ["compass = '%1'", _loadout select 8 select 3];
_return = _return + _breakline + _trippleTab + format ["watch = '%1'", _loadout select 8 select 4];
_return = _return + _breakline + _trippleTab + format ["gps = '%1'", _loadout select 8 select 1];

private _radio =  _loadout select 8 select 2;
if (isNumber (configFile >> "CfgItems" >> typeOf _radio >> "tf_radio")) then {
   _split = _radio splitString "_";
   _radio = (_split deleteAt (_split select (count _split -1))) joinString "_";
};

_return = _return + _breakline + _trippleTab + format ["radio = '%1'", _radio];
_return = _return + _breakline + _trippleTab + format ["nvgoggles = '%1'", _loadout select 8 select 5];
_return = _return + _breakline + "";
//Items in Uniform
if !(_loadout select 3 isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "addItemsToUniform[] = {";
   _return = _return + _breakline + [_loadout select 3 select 1, _breakline, _tab] call FUNC(getItems);
   _return = _return + _breakline + _trippleTab + "};" + _breakline + "";;
};

//Items in Vest
if !(_loadout select 4 isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "addItemsToVest[] = {";
   _return = _return + _breakline + [_loadout select 4 select 1, _breakline, _tab] call FUNC(getItems);
   _return = _return + _breakline + _trippleTab + "};" + _breakline + "";
};
//Items in Backpack
if !(_loadout select 5 isEqualTo []) then {
   _return = _return + _breakline + _trippleTab + "addItemsToBackpack[] = {";
   _return = _return + _breakline + [_loadout select 5 select 1, _breakline, _tab] call FUNC(getItems);
   _return = _return + _breakline + _trippleTab + "};" + _breakline + "";;
};

_return = _return + _breakline + _tab + _tab +"};";

_return
