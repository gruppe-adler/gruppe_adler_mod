#include "script_component.hpp"

params ["_weaponArray", "_name", "_tab"];

private _return = [];
if !(_weaponArray isEqualTo []) then {
    _weaponArray params [["_weapon", ""], ["_muzzle", ""], ["_pointer", ""], ["_optics", ""], ["_magazine", []], ["_underbarrelMagazin", []],  ["_underbarrel", ""]];

	_return pushBack (_tab + format ["%1Weapon = ""%2"";", _name,  _weapon]);

	if (!(_magazine isEqualTo []) && {(_magazine select 0) != ""}) then {
		_return pushBack( _tab + format ["%1WeaponMagazine = ""%2"";", _name,  _magazine select 0]);
	} else {
		_return pushBack(_tab + format ["%1WeaponMagazine = """";", _name]);
	};

	_return pushBack (_tab + format ["%1WeaponOptics = ""%2"";", _name,  _optics]);
	_return pushBack (_tab + format ["%1WeaponPointer = ""%2"";", _name,  _pointer]);
	_return pushBack (_tab + format ["%1WeaponMuzzle = ""%2"";", _name,  _muzzle]);
	_return pushBack (_tab + format ["%1WeaponUnderbarrel = ""%2"";", _name,  _underbarrel]);

	if (!(_underbarrelMagazin isEqualTo []) && {(_underbarrelMagazin select 0) != ""})then {
		_return pushBack (_tab + format ["%1WeaponUnderbarrelMagazine = ""%2"";", _name,  _underbarrelMagazin select 0]);
	} else {
		_return pushBack(_tab + format ["%1WeaponUnderbarrelMagazine = """";", _name]);
	};
};

_return