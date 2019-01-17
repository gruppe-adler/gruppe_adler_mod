#include "script_component.hpp"

params ["_unit", "_breakline"];

private _return = "";
private _loadout = getUnitLoadout _unit;

if (_loadout isEqualTo []) exitWith {_result};

private _split = (typeOf _unit) splitString "_";
_split deleteAt 0;
private _type = _split joinString "_";
_return = _return = _return + _breakline + format ["class %1 {", _type];

//Clothing
_return = _return + _breakline + format ["uniform = '%1'", [_loadout select 3] call FUNC(getClothes)];
_return = _return + _breakline + format ["vest = '%1'", [_loadout select 4] call FUNC(getClothes)];
_return = _return + _breakline + format ["backpack = '%1'", [_loadout select 5] call FUNC(getClothes)];
_return = _return + _breakline + format ["headgear = '%1'", [_loadout select 6] call FUNC(getClothes)];

private _weaponArray = [];
//Primary Weapon
_weaponArray = [_loadout select 0] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + "primaryWeapon = ''";
   _return = _return + _breakline + "primaryWeaponMagazine = ''";
   _return = _return + _breakline + "primaryWeaponOptics = ''";
   _return = _return + _breakline + "primaryWeaponPointer = ''";
   _return = _return + _breakline + "primaryWeaponMuzzle = ''";
   _return = _return + _breakline + "primaryWeaponUnderbarrel = ''";
   _return = _return + _breakline + "primaryWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + format ["primaryWeapon = '%1'",  _weapon];
   _return = _return + _breakline + format ["primaryWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + format ["primaryWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + format ["primaryWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + format ["primaryWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + format ["primaryWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + format ["primaryWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
};


//Secondary Weapon / Launcher
_weaponArray = [_loadout select 1] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + "secondaryWeapon = ''";
   _return = _return + _breakline + "secondaryWeaponMagazine = ''";
   _return = _return + _breakline + "secondaryWeaponOptics = ''";
   _return = _return + _breakline + "secondaryWeaponPointer = ''";
   _return = _return + _breakline + "secondaryWeaponMuzzle = ''";
   _return = _return + _breakline + "secondaryWeaponUnderbarrel = ''";
   _return = _return + _breakline + "secondaryWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + format ["secondaryWeapon = '%1'",  _weapon];
   _return = _return + _breakline + format ["secondaryWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + format ["secondaryWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + format ["secondaryWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + format ["secondaryWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + format ["secondaryWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + format ["secondaryWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
}

//Pistol
_weaponArray = [_loadout select 2] call FUNC(getWeapon);
if (_weaponArray isEqualTo []) then {
   _return = _return + _breakline + "handgunWeapon = ''";
   _return = _return + _breakline + "handgunWeaponMagazine = ''";
   _return = _return + _breakline + "handgunWeaponOptics = ''";
   _return = _return + _breakline + "handgunWeaponPointer = ''";
   _return = _return + _breakline + "handgunWeaponMuzzle = ''";
   _return = _return + _breakline + "handgunWeaponUnderbarrel = ''";
   _return = _return + _breakline + "handgunWeaponUnderbarrelMagazine = ''";
} else {
   _weaponArray params ["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _return = _return + _breakline + format ["handgunWeapon = '%1'",  _weapon];
   _return = _return + _breakline + format ["handgunWeaponMagazine = '%1'", _magazine];
   _return = _return + _breakline + format ["handgunWeaponOptics = '%1'", _optic];
   _return = _return + _breakline + format ["handgunWeaponPointer = '%1'", _pointer];
   _return = _return + _breakline + format ["handgunWeaponMuzzle = '%1'", _muzzle];
   _return = _return + _breakline + format ["handgunWeaponUnderbarrel = '%1'", _underbarrel];
   _return = _return + _breakline + format ["handgunWeaponUnderbarrelMagazine = '%1'", _underBarrelAmmo];
}

//Basic Items (Binocular, NVG, Maps, etc.)
_return = _return + _breakline + if !(_loadout select 7 isEqualTo []) then {
   format ["binoculars = '%1'", _loadout select 7 select 0]
} else {
   "binoculars = ''"
};

_return = _return + _breakline + format ["map = '%1'", _loadout select 8 select 0];
_return = _return + _breakline + format ["compass = '%1'", _loadout select 8 select 3];
_return = _return + _breakline + format ["watch = '%1'", _loadout select 8 select 4];
_return = _return + _breakline + format ["gps = '%1'", _loadout select 8 select 1];

private _radio =  _loadout select 8 select 2;
if (isNumber (configFile >> "CfgItems" >> typeOf _radio >> "tf_radio")) then {
   _split = _radio splitString "_";
   _radio = (_split deleteAt (_split select (count _split -1))) joinString "_";
};

_return = _return + _breakline + format ["radio = '%1'", _radio];
_return = _return + _breakline + format ["nvgoggles = '%1'", _loadout select 8 select 5];
_return = _return + _breakline + "";
//Items in Uniform
if !(_loadout select 3 isEqualTo []) then {
   _return = _return + _breakline + "addItemsToUniform[] = {";
   _return = _return + _breakline + [_loadout select 3 select 1] call FUNC(getItems);
   _return = _return + _breakline + "};" + _breakline + "";;
};

//Items in Vest
if !(_loadout select 4 isEqualTo []) then {
   _return = _return + _breakline + "addItemsToVest[] = {";
   _return = _return + _breakline + [_loadout select 4 select 1] call FUNC(getItems);
   _return = _return + _breakline + "};" + _breakline + "";
};
//Items in Backpack
if !(_loadout select 5 isEqualTo []) then {
   _return = _return + _breakline + "addItemsToBackpack[] = {";
   _return = _return + _breakline + [_loadout select 5 select 1] call FUNC(getItems);
   _return = _return + _breakline + "};" + _breakline + "";;
};

_return = _return + _breakline + "};";

_return
