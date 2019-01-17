#include "script_component.hpp"

params ["_units"];

private _breakline = toString [13,10];
private _structuredText = "class newFaction {" + _breakline + "";

{
   private _return = [_x, _breakline] call FUNC(getLoadoutAndFormat);
   _structuredText = _structuredText + _breakline + _return + _breakline + "";
}forEach _units;

_structuredText = _structuredText + _breakline + "};";

copyToClipboard _structuredText;
