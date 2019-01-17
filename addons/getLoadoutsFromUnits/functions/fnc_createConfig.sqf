#include "script_component.hpp"

params ["_units"];

private _breakline = toString [13,10];
private _structuredText = "class newFaction {";
private _tab = "    ";
_structuredText = _structuredText + _tab + "class Type {" + _breakline + "";

{
   private _return = [_x, _breakline, _tab] call FUNC(getLoadoutAndFormat);
   _structuredText = _structuredText + _breakline + _return + _breakline + "";
}forEach _units;

_structuredText = _structuredText + _breakline + _tab + "};" + _breakline + "};";

copyToClipboard _structuredText;
