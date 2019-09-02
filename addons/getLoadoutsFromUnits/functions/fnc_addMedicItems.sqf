#include "script_component.hpp"

params ["_unit", "_type"];

private _log = [];
private _items = [];
private _loadout = getUnitLoadout _unit;

if (isNil "_loadout" || {_loadout isEqualTo []}) exitWith {diag_log "GRAD_Mod getLoadouts from Unit: Loadout is Nil!"};

{
   if (!((_loadout select _x) isEqualTo []) && {!((_loadout select _x select 1) isEqualTo [])}) then {
      _items append (_loadout select _x select 1);
   };
}forEach [3,4,5];

{
    private _index = _forEachIndex;
    {
        _x params ["_newItem", "_amount"];
        private _countOfSameItem = {(_x select 0) == _newItem} count _items;

        private _rest = _amount - _countOfSameItem;

        if (_rest > 0 && {!((_loadout select _index) isEqualTo [])} && {!((_loadout select _index select 1) isEqualTo [])}) then {
            for "_i" from 1 to _rest do {
                switch (_index) do {
                    case 0 : {
                        if (_unit canAddItemToUniform _newItem) then {
                            _unit addItemToUniform _newItem;
                        }else{
                            _log pushBack _newItem;
                        };
                    };
                    case 1 : {
                        if (_unit canAddItemToVest _newItem) then {
                            _unit addItemToVest _newItem;
                        }else{
                           _log pushBack _newItem;
                        };
                    };
                    case 2 : {
                        if (_unit canAddItemToBackpack _newItem) then {
                            _unit addItemToBackpack _newItem;
                        }else{
                            _log pushBack _newItem;
                        };
                    };
                };
            };
        }else{
            for "_i" from 1 to _rest do {
                _log pushBack _newItem;
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
            ["ACE_epinephrine",20]
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
    private _logIitems = [];
    {
        private _item = _x;
        if (_logIitems isEqualTo []) then {
            _logIitems pushBack [_item, 1];
        }else{
            {
                if (_x select 0 == _item) exitWith {
                    _logIitems set [_forEachIndex, [_x select 0, (_x select 1) +1]];
                };
            }forEach _logIitems;
        };
    }forEach _log;

    {
        systemChat "GRAD_getLoadoutsFromUnits: Items could not be added to the Loadout. See RPT";
        diag_log format ["GRAD_getLoadoutsFromUnits: Could not add Items: %1 of Amount: %2 to Unit: %3", _x select 0, _x select 1, _unit];
    }forEach _logIitems;
};
