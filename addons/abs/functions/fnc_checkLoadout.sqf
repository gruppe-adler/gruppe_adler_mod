#include "script_component.hpp"
params ["_unit", "_level"];

private _loadout = getUnitLoadout _unit;
private _bandages = [[],[],[]];
private _bandagesCount = 0;
{
   private _itemsInLoadout = _loadout select _x;
   private _index = _forEachIndex;
   if !(_itemsInLoadout isEqualTo [] && {!((_itemsInLoadout select 1) isEqualTo [])}) then {
      {
         private _item = _x;
         {
            if (_item in _x) then {
               _bandages set [_index, ((_bandages select _index) pushback _x)];
               _bandagesCount = _bandagesCount +1;
            };
         }forEach ["ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot"];
      } forEach (_itemsInLoadout select 1);
   };
}forEach [3,4,5];

if (_bandagesCount <= GVAR(amountOfBandagesForABS)) exitWith { false };

GVAR(bandagesOnUnit) = _bandages;

true;
