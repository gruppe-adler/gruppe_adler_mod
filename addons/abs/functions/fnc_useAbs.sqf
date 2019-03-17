#include "script_component.hpp"
/*
 * Author: Salbei
 * Applies ABS, reduzing the wound count below set Value.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Caller <OBJECT>
 * 2: Selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TARGET, CALLER] call grad_mod_fnc_useAbs
 *
 * Public: Yes
 */
params ["_target", "_caller", "_selection"];

private _loadout = getUnitLoadout _unit;
private _inUniform = _loadout select 3 select 1;
private _inVest = _loadout select 4 select 1;
private _inBackpack = _loadout select 5 select 1;
private _usedBandages = [];
private _kickOut = false;

for "_i" from 1 to GVAR(amountOfBandagesForABS) do {
   if (count (GVAR(bandagesOnUnit) select 0) > 0) then {
       private _container = GVAR(bandagesOnUnit) select 0;
       _usedBandages pushBack (_container select 0);
      _inUniform deleteAt (_inUniform find (_container select 0));
      _container deleteAt 0;
      GVAR(bandagesOnUnit) set [0, _container];
   }else{
      if (count (GVAR(bandagesOnUnit) select 1) > 0) then {
          private _container = GVAR(bandagesOnUnit) select 1;
          _usedBandages pushBack (_container select 0);
         _inVest deleteAt (_inVest find (_container select 0));
         _container deleteAt 0;
         GVAR(bandagesOnUnit) set [1, _container];
      }else{
         if (count (GVAR(bandagesOnUnit) select 2) > 0) then {
             private _container = GVAR(bandagesOnUnit) select 2;
             _usedBandages pushBack (_container select 0);
            _inBackpack deleteAt (_inBackpack find (_container select 0));
            _container deleteAt 0;
            GVAR(bandagesOnUnit) set [2, _container];

         }else{
            _kickOut = true;
         };
      };
   };

   if (_kickOut) exitWith {diag_log format ["Not enough Bandages: %1 missing.", (GVAR(amountOfBandagesForABS) - _i)]};
};

if (_kickOut) exitWith {};

private _uniform = _loadout select 3;
private _vest = _loadout select 4;
private _backpack = _loadout select 5;

_uniform set [1, _inUniform];
_vest set [1, _inVest];
_backpack set [1, _inBackpack];

_loadout set [3, _uniform];
_loadout set [4, _vest];
_loadout set [5, _backpack];

_unit setUnitLoadout _loadout;

for "_i" from 1 to GVAR(amountOfBandagesForABS) do {
    [_caller, _target, _selection, "bandage", (_usedBandages select _i), -1] call ace_medical_fnc_treatmentAdvanced_bandage;
};
