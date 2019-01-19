#include "script_component.hpp"
params ["_items", "_tab"];

private _return = [];
private _count = count _items;

if (_count > 0) then {
    private _quadrupleTab = _tab + _tab + _tab + _tab;
    {
        if (count _x == 3) then {
          _return pushBack (_quadrupleTab + format ["LIST_%1('%2')", _x select 2, _x select 0]);
        }else{
          _return pushBack (_quadrupleTab + format ["LIST_%1('%2')", _x select 1, _x select 0]);
        };
    } forEach _items;
    _return = _return joinString ("," + toString[13,10]);
};

_return
