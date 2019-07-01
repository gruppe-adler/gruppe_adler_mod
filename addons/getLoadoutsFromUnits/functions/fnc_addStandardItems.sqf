#include "script_component.hpp"

params ["_unit"];

private _log = [];
private _items = [];
private _loadout = getUnitLoadout _unit;

if (!((_loadout select 3) isEqualTo []) && {!((_loadout select 3 select 1) isEqualTo [])}) then {
    _items = (_loadout select 3 select 1);

    {
        _x params ["_newItem", "_amount"];
        private _rest = _amount - ({(_x select 0) == _newItem} count _items);

        if (_rest > 0) then {
            for "_i" from 1 to _rest do {

                if (_unit canAddItemToUniform _newItem) then {
                    _unit addItemToUniform _newItem;
                }else{
                    _log pushBack _newItem;
                };
            };
        };
    }forEach [

    ];
};
