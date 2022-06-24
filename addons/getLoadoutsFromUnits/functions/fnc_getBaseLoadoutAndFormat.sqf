#include "script_component.hpp"

params ["_loadout", "_tab"];

private _return = [];

if (_loadout isEqualTo []) exitWith {_return};
private _doubleTab = _tab + _tab;

//Clothing
_return pushBack (_doubleTab + format ["uniform = ""%1"";", [_loadout select 3] call FUNC(getClothes)]);
_return pushBack (_doubleTab + format ["vest = ""%1"";", [_loadout select 4] call FUNC(getClothes)]);
_return pushBack (_doubleTab + format ["backpack = ""%1"";", [_loadout select 5] call FUNC(getClothes)]);
_return pushBack (_doubleTab + format ["headgear = ""%1"";", _loadout select 6]);

//Primary Weapon
private _weaponArray = [_loadout select 0, "primary", _doubleTab] call FUNC(getBaseWeapon);
_return = _return + _weaponArray;

//Secondary Weapon / Launcher
private _weaponArray = [_loadout select 1, "secondary", _doubleTab] call FUNC(getBaseWeapon);
_return = _return + _weaponArray;

//Pistol
private _weaponArray = [_loadout select 2, "handgun", _doubleTab] call FUNC(getBaseWeapon);
_return = _return + _weaponArray;

//Basic Items (Binocular, NVG, Maps, etc.)
private _binocular = if !(_loadout select 8 isEqualTo []) then {
    format ["binoculars = ""%1"";", _loadout select 8 select 0]
} else {
    "binoculars = """";"
};
_return pushBack (_doubleTab + _binocular);

_return pushBack (_doubleTab + format ["map = ""%1"";", _loadout select 9 select 0]);
_return pushBack (_doubleTab + format ["compass = ""%1"";", _loadout select 9 select 3]);
_return pushBack (_doubleTab + format ["watch = ""%1"";", _loadout select 9 select 4]);
_return pushBack (_doubleTab + format ["gps = ""%1"";", _loadout select 9 select 1]);

private _radio =  _loadout select 9 select 2;
if (isText (configFile >> "CfgWeapons" >> _radio >> "tf_parent")) then {
    _radio = getText (configFile >> "CfgWeapons" >> _radio >> "tf_parent");
};

_return pushBack (_doubleTab + format ["radio = ""%1"";", _radio]);
_return pushBack (_doubleTab + format ["nvgoggles = ""%1"";", _loadout select 9 select 5]);

_return pushBack (_tab + _tab +"};");

_return
