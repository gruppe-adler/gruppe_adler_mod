#include "script_component.hpp"

params ["_items", "_tab"];

private _return = [];
private _count = count _items;

if (_count > 0) then {
    private _quadrupleTab = _tab + _tab + _tab + _tab;
    {
        private _amount = _x select 1;
        while {_amount > 0} do {
            private _added = _amount min 30;
            _amount = _amount - _added;
            _return pushBack (_quadrupleTab + format ["LIST_%1(""%2"")", _added, _x select 0]);
        };
    } forEach _items;
    _return = _return joinString ("," + toString[13,10]);
};

_return
