#include "script_component.hpp"

params ["_tabs", "_item", "_type"];

private _return = objNull;
if (_item isEqualType "") then {
	_return = _tabs + format ["%1 = ""%2"";", _type, _item];
};

_return
