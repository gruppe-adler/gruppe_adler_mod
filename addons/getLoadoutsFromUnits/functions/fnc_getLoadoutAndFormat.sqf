#include "script_component.hpp"

params ["_unit", "_tab"];

private _return = [];
private _loadout = getUnitLoadout _unit;

if (_loadout isEqualTo []) exitWith {_result};
private _trippleTab = _tab + _tab + _tab;

private _split = (typeOf _unit) splitString "_";
_split deleteAt 0;
private _type = _split joinString "_";
_return pushBack (_tab + _tab + format ["class %1 {", _type]);

//Clothing
_return pushBack (_trippleTab + format ["uniform = '%1';", [_loadout select 3] call FUNC(getClothes)]);
_return pushBack (_trippleTab + format ["vest = '%1';", [_loadout select 4] call FUNC(getClothes)]);
_return pushBack (_trippleTab + format ["backpack = '%1';", [_loadout select 5] call FUNC(getClothes)]);
_return pushBack (_trippleTab + format ["headgear = '%1';", _loadout select 6]);

//Primary Weapon
private _weaponArray = [_loadout select 0, "primary", _trippleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Secondary Weapon / Launcher
private _weaponArray = [_loadout select 1, "secondary", _trippleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Pistol
private _weaponArray = [_loadout select 2, "handgun", _trippleTab] call FUNC(getWeapon);
_return = _return + _weaponArray;

//Basic Items (Binocular, NVG, Maps, etc.)
private _binocular = if !(_loadout select 8 isEqualTo []) then {
    format ["binoculars = '%1';", _loadout select 8 select 0]
} else {
    "binoculars = '';"
};
_return pushBack (_trippleTab + _binocular);

_return pushBack (_trippleTab + format ["map = '%1';", _loadout select 9 select 0]);
_return pushBack (_trippleTab + format ["compass = '%1';", _loadout select 9 select 3]);
_return pushBack (_trippleTab + format ["watch = '%1';", _loadout select 9 select 4]);
_return pushBack (_trippleTab + format ["gps = '%1';", _loadout select 9 select 1]);

private _radio =  _loadout select 9 select 2;
if (isNumber (configFile >> "CfgWeapons" >> _radio >> "tf_radio")) then {
    _split = _radio splitString "_";
    _radio = (_split deleteAt (_split select (count _split -1))) joinString "_";
};

_return pushBack (_trippleTab + format ["radio = '%1';", _radio]);
_return pushBack (_trippleTab + format ["nvgoggles = '%1';", _loadout select 9 select 5]);

private _items = "";
//Items in Uniform
if (!(_loadout select 3 isEqualTo []) && {!(_loadout select 3 select 1 isEqualTo [])}) then {
    _return pushBack _breakline + _trippleTab + "addItemsToUniform[] = {";
    _items = [_loadout select 3 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack _trippleTab + "};";
};

//Items in Vest
if (!(_loadout select 4 isEqualTo []) && {!(_loadout select 4 select 1 isEqualTo [])}) then {
    _return pushBack (_trippleTab + "addItemsToVest[] = {");
    _items = [_loadout select 4 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack (_trippleTab + "};");
};
//Items in Backpack
if (!(_loadout select 5 isEqualTo []) && {!(_loadout select 5 select 1 isEqualTo [])}) then {
    _return pushBack (_trippleTab + "addItemsToBackpack[] = {");
    _items = [_loadout select 5 select 1, _tab] call FUNC(getItems);
    _return = _return + _items;
    _return pushBack (_trippleTab + "};");
};

_return pushBack (_tab + _tab +"};");

_return
