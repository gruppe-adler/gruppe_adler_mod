#include "script_component.hpp"
params ["_items", "_breakline"];

private _return = "";

if (count _items > 0) then {
   {
       if (count _x == 3) then {
          _return = _return + _breakline + format ["LIST_%1('%2')", _x select 2, _x select 0];
       }else{
          _return = _return + _breakline + format ["LIST_%1('%2')", _x select 1, _x select 0];
       };
   } forEach _items;
};

_return
