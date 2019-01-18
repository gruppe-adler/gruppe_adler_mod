#include "script_component.hpp"
params ["_items", "_breakline" , "_tab"];

private _return = "";
private _count = count _items;
if (_count > 0) then {
   private _quadrupleTab = _tab + _tab + _tab + _tab;
   {
       if (count _x == 3) then {
          _return = _return + _breakline + _quadrupleTab + format ["LIST_%1('%2'),", _x select 2, _x select 0];
       }else{
          _return = _return + _breakline + _quadrupleTab + format ["LIST_%1('%2'),", _x select 1, _x select 0];
       };
   } forEach _items;
   _split = _return splitString "";
  _split deleteAT (count _split -1);
  _return = _split joinString "";
};

_return
