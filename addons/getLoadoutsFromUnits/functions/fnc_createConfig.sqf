#include "script_component.hpp"

private _structuredText = ["class newFaction {"];
private _tab = "    ";
private _types = [];
private _units = ((get3DENSelected "object") select {_x isKindOf "CAManBase"}) select {
    private _split = (typeOf _x) splitString "_";
    _split deleteAt 0;
    private _index = _types pushBackUnique (_split joinString "_");
    _index != -1
};

diag_log format ["Units: %1", _units];
diag_log format ["Types: %1", _types];

_structuredText pushBack (_tab + "class Type {");

{
   _structuredText append ([_x, (_types select _forEachIndex), _tab] call FUNC(getLoadoutAndFormat));
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

copyToClipboard (_structuredText joinString (toString [13,10]));
