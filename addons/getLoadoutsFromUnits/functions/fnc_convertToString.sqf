params ["_tabs", "_item", "_type"];

private _return = nil;
if (_item isEqualTo "") then {
	_return = format ["%1 = ""%2"";", _type, _item];
}