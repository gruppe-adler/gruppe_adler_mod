#include "script_component.hpp"

params ["_unit", "_type"];

private _log = [];
private _items = [];
private _loadout = getUnitLoadout _unit;

{
   if (!((_loadout select _x) isEqualTo []) && {!((_loadout select _x select 1) isEqualTo [])}) then {
      _items append (_loadout select _x select 1);
   };
}forEach [3,4,5];

{
   private _countOfSameItem = 0;
   private _index = _forEachIndex;
   {
      _x params ["_newItem", "_amount"];
      {
         if ((_x select 0) == _newItem) then {
            _countOfSameItem = _countOfSameItem +1;
         };
      }forEach _items;

      private _rest = _amount - _countOfSameItem;
      if (_rest > 0) then {
         for "_i" from 1 to _rest do {
            _fits = _unit canAddItemToBackpack _newItem;
            if (_fits) then {
               _unit addItemToBackpack _newItem;
            }else{
               _log pushBack _newItem;
            };
         };
      };
   }forEach _x;
}forEach ([
   //Combat First Responder
   [
      [
         ["ACE_surgicalKit",1]
      ],
      [],
      [
         ["ACE_elasticBandage",10],
         ["ACE_packingBandage",10],
         ["ACE_quikclot",10],
         ["ACE_tourniquet",8],
         ["ACE_morphine",8],
         ["ACE_epinephrine",8]
      ]
   ],

   //Squad Medic
   [
      [
         ["ACE_surgicalKit",1]
      ],
      [],
      [
          ["ACE_salineIV",2],
          ["ACE_salineIV_500",10],
          ["ACE_elasticBandage",20],
          ["ACE_packingBandage",20],
          ["ACE_quikclot",20],
          ["ACE_tourniquet",15],
          ["ACE_morphine",20],
          ["ACE_epinephrine",20],
      ]
   ],

   //Platoon Medic
   [
      [
         ["ACE_surgicalKit",1],
         ["GRAD_ALK",1]
      ],
      [],
      [
         ["ACE_salineIV",4],
         ["ACE_salineIV_500",8],
         ["ACE_elasticBandage",20],
         ["ACE_packingBandage",20],
         ["ACE_quikclot",20],
         ["ACE_tourniquet",8],
         ["ACE_morphine",25],
         ["ACE_epinephrine",25]
      ]
   ]
] select _type);

if !(_log isEqualTo []) then {
   private _items = [];
   {
      private _index = -1;
      private _item = _x;
      if (_items isEqualTo []) then {
         _items pushBack [_item, 1];
      }else{
         {
            if (_x select 0 == _item) then {
               _x set [1, (_x select 1) +1];
            }else{
               _items pushBack [_item, 1];
            };
         }forEach _items;
      };
   }forEach _log;

   {
      diag_log format ["GRAD_getLoadoutsFromUnits: Could not add Items: %1 of Amount: %2 to Unit: %3", _x select 0, _x select 1, _unit];
   }forEach _items;
};
