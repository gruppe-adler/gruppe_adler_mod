#include "script_component.hpp"

params ["_unit", "_tab"];

private _return = [];
private _loadout = getUnitLoadout _unit;

if (_loadout isEqualTo []) exitWith {_result};
private _tripleTab = _tab + _tab + _tab;

private _split = (typeOf _unit) splitString "_";
_split deleteAt 0;
private _type = _split joinString "_";
_return pushBack (_tab + _tab + format ["class %1 {", _type]);

//Clothing
_return pushBack (_tripleTab + format ["uniform = '%1';", [_loadout select 3] call FUNC(getClothes)]);
_return pushBack (_tripleTab + format ["vest = '%1';", [_loadout select 4] call FUNC(getClothes)]);
_return pushBack (_tripleTab + format ["backpack = '%1';", [_loadout select 5] call FUNC(getClothes)]);
_return pushBack (_tripleTab + format ["headgear = '%1';", _loadout select 6]);

//Primary Weapon
private _weaponArray = [_loadout select 0, "primary", _tripleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Secondary Weapon / Launcher
private _weaponArray = [_loadout select 1, "secondary", _tripleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Pistol
private _weaponArray = [_loadout select 2, "handgun", _tripleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Basic Items (Binocular, NVG, Maps, etc.)
private _binocular = if !(_loadout select 8 isEqualTo []) then {
    format ["binoculars = '%1';", _loadout select 8 select 0]
} else {
    "binoculars = '';"
};
_return pushBack (_tripleTab + _binocular);

_return pushBack (_tripleTab + format ["map = '%1';", _loadout select 9 select 0]);
_return pushBack (_tripleTab + format ["compass = '%1';", _loadout select 9 select 3]);
_return pushBack (_tripleTab + format ["watch = '%1';", _loadout select 9 select 4]);
_return pushBack (_tripleTab + format ["gps = '%1';", _loadout select 9 select 1]);

private _radio =  _loadout select 9 select 2;
if (isText (configFile >> "CfgWeapons" >> _radio >> "tf_parent")) then {
    _radio = getText (configFile >> "CfgWeapons" >> _radio >> "tf_parent");
};

_return pushBack (_tripleTab + format ["radio = '%1';", _radio]);
_return pushBack (_tripleTab + format ["nvgoggles = '%1';", _loadout select 9 select 5]);

private _items = "";
//Items in Uniform
if (!(_loadout select 3 isEqualTo []) && {!(_loadout select 3 select 1 isEqualTo [])}) then {
    _return pushBack _breakline + _tripleTab + "addItemsToUniform[] = {";
    _items = [_loadout select 3 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack _tripleTab + "};";
};

//Items in Vest
if (!(_loadout select 4 isEqualTo []) && {!(_loadout select 4 select 1 isEqualTo [])}) then {
    _return pushBack (_tripleTab + "addItemsToVest[] = {");
    _items = [_loadout select 4 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack (_tripleTab + "};");
};
//Items in Backpack
if (!(_loadout select 5 isEqualTo []) && {!(_loadout select 5 select 1 isEqualTo [])}) then {
    _return pushBack (_tripleTab + "addItemsToBackpack[] = {");
    _items = [_loadout select 5 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack (_tripleTab + "};");
};

_return pushBack (_tab + _tab +"};");

_return
