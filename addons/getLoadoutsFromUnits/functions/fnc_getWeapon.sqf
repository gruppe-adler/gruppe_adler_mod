#include "script_component.hpp"
params ["_weaponArray"];

private _result = [];
if !(_weaponArray isEqualTo []) then {
   //["_weapon", "_magazine", "_optic", "_pointer", "_muzzle", "_underbarrel", "_underBarrelAmmo"];
   _result = [
      (_weaponArray select 0),
      (_weaponArray select 4),
      (_weaponArray select 3),
      (_weaponArray select 2),
      (_weaponArray select 1),
      (_weaponArray select 6),
      (_weaponArray select 5)
   ];
};
_result
