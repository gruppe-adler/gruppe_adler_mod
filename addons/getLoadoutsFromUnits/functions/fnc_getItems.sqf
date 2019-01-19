#include "script_component.hpp"
params ["_items", "_tab"];
diag_log format ["Items: %1", _items];
private _return = [];
private _count = count _items;

diag_log format ["Items count: %1", _count];

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

diag_log format ["Items return: %1", _return];

_return
