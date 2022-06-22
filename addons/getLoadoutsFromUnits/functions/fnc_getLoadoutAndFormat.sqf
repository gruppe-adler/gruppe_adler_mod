#include "script_component.hpp"

params ["_loadoutHash", "_type", "_tab", "_typesMedical", "_itemsChecked"];

private _return = [];
private _loadout = [_loadoutHash, _type] call CBA_fnc_hashGet;

if (_loadout isEqualTo []) exitWith {_return};
private _tripleTab = _tab + _tab + _tab;

_return pushBack (_tab + _tab + format ["class %1 {", _type]);

//Clothing
_return append [
    [_tripleTab, [_loadout select 3] call FUNC(getClothes), "uniform"] call FUNC(convertToString),
    [_tripleTab, [_loadout select 4] call FUNC(getClothes), "vest"] call FUNC(convertToString),
    [_tripleTab, [_loadout select 5] call FUNC(getClothes), "backpack"] call FUNC(convertToString),
    [_tripleTab, _loadout select 6, "headgear"] call FUNC(convertToString)
];

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
private _binoLoadout = _loadout select 8;
private _binocular = if (_binoLoadout isEqualType [] && {_binoLoadout isNotEqualTo []} && {!isNil {_binoLoadout select 0}}) then {
    _return pushBack (_tripleTab + format ["binoculars = ""%1"";", _binoLoadout select 0])
};

private _radio =  _loadout select 9 select 2;
if (!isNil _radio && {isText (configFile >> "CfgWeapons" >> _radio >> "tf_parent")}) then {
    _radio = getText (configFile >> "CfgWeapons" >> _radio >> "tf_parent");
};

_return append [
    [_tripleTab, _loadout select 9 select 0, "map"] call FUNC(convertToString),
    [_tripleTab, _loadout select 9 select 3, "compass"] call FUNC(convertToString),
    [_tripleTab, _loadout select 9 select 4, "watch"] call FUNC(convertToString),
    [_tripleTab, _loadout select 9 select 1, "gps"] call FUNC(convertToString),
    [_tripleTab, _radio, "radio"] call FUNC(convertToString),
    [_tripleTab, _loadout select 9 select 5, "nvgoggles"] call FUNC(convertToString)
];

//Items in Uniform
if (!(_loadout select 3 isEqualTo []) && {!(_loadout select 3 select 1 isEqualTo [])}) then {
    _return pushBack  (_tripleTab + "addItemsToUniform[] = {");
    _return pushBack ([_loadout select 3 select 1, _tab] call FUNC(getItems));

    if (_itemsChecked) then {
        _return pushBack "";
        _return pushBack (_tab + _tab + _tab + _tab + "GRAD_FACTIONS_MEDICITEMS_INF_LIST");
    };
    _return pushBack _tripleTab + "};";
};

//Items in Vest
if (!(_loadout select 4 isEqualTo []) && {!(_loadout select 4 select 1 isEqualTo [])}) then {
    _return pushBack (_tripleTab + "addItemsToVest[] = {");
    _return pushBack  ([_loadout select 4 select 1, _tab] call FUNC(getItems));
    _return pushBack (_tripleTab + "};");
};
//Items in Backpack
if (!(_loadout select 5 isEqualTo []) && {!(_loadout select 5 select 1 isEqualTo [])}) then {
    _return pushBack (_tripleTab + "addItemsToBackpack[] = {");
    _return pushBack  ([_loadout select 5 select 1, _tab] call FUNC(getItems));
    _return pushBack (_tripleTab + "};");
};

{
    _x params ["_medicalTyp", "_index"];

    if (_medicalTyp isEqualTo _type) exitWith {
        _return pushBack "";
        _return pushBack (_tripleTab + (["GRAD_FACTIONS_MEDICITEMS_CFR", "GRAD_FACTIONS_MEDICITEMS_SQ", "GRAD_FACTIONS_MEDICITEMS_PT"] select _index));
    };
}forEach _typesMedical;

_return pushBack (_tab + _tab + "};");


//_return = _return - [nil]; - This sadly does not work :(
//So I have to do it the hard way
_return = [_return] call FUNC(removeNilFromArray);

_return
