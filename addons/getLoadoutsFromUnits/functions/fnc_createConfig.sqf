#include "script_component.hpp"

private _structuredText = ["class newFaction {"];
private _tab = "    ";
private _units = (get3DENSelected "object") select {_x isKindOf "CAManBase"};

_structuredText pushBack (_tab + "class Type {");

{
   private _return = [_x, _tab] call FUNC(getLoadoutAndFormat);
   _structuredText = _structuredText + _return;
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

copyToClipboard _structuredText joinString (toString [13,10]);
