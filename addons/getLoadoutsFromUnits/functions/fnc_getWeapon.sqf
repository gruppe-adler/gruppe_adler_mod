#include "script_component.hpp"

params ["_weaponArray", "_name", "_tripleTab"];

private _return = [];
if !(_weaponArray isEqualTo []) then {
    _weaponArray params ["_weapon", "_muzzle", "_pointer", "_optics", "_magazine", "_underbarrelMagazin", "_underbarrel"];

    if (!isNil "_weapon") then {
        _return pushBack (_tripleTab + format ["%1Weapon = ""%2"";", _name,  _weapon]);
    };
    if ((_magazine isEqualType []) && {_magazine isNotEqualTo []} && {!isNil {_magazine select 0}}) then {
        _return pushBack( _tripleTab + format ["%1WeaponMagazine = ""%2"";", _name,  _magazine select 0]);
    };

    if (!isNil "_optics") then {
        _return pushBack (_tripleTab + format ["%1WeaponOptics = ""%2"";", _name,  _optics]);
    };

    if (!isNil "_pointer") then {
        _return pushBack (_tripleTab + format ["%1WeaponPointer = ""%2"";", _name,  _pointer]);
    };

    if (!isNil "_muzzle") then {
        _return pushBack (_tripleTab + format ["%1WeaponMuzzle = ""%2"";", _name,  _muzzle]);
    };

    if (!isNil "_underbarrel") then {
        _return pushBack (_tripleTab + format ["%1WeaponUnderbarrel = ""%2"";", _name,  _underbarrel]);
    };

    if ((_underbarrelMagazin isEqualType []) && {_underbarrelMagazin isNotEqualTo []} && {!isNil {_underbarrelMagazin select 0}})then {
        _return pushBack (_tripleTab + format ["%1WeaponUnderbarrelMagazine = ""%2"";", _name,  _underbarrelMagazin select 0]);
    };
    /*
} else {
    _return append [
        _tripleTab + format ["%1Weapon = """";", _name],
        _tripleTab + format ["%1WeaponMagazine = """";", _name],
        _tripleTab + format ["%1WeaponOptics = """";", _name],
        _tripleTab + format ["%1WeaponPointer = """";", _name],
        _tripleTab + format ["%1WeaponMuzzle = """";", _name],
        _tripleTab + format ["%1WeaponUnderbarrel = """";", _name],
        _tripleTab + format ["%1WeaponUnderbarrel = """";", _name]
    ];
    */
};

_return
