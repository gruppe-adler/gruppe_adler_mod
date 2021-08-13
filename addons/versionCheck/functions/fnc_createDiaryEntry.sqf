#include "..\script_component.hpp"

private _pad = {
	params ["_str", "_targetLen"];
	private _strLen = count _str;
	if (_strLen >= _targetLen) exitWith {_str};

	private  _a = [];
	_a resize (_targetLen - _strLen);
	(_str + ((_a apply {" "}) joinString ""));
};

private _description = [
		"   LOCAL    |   SERVER   |   ADDON    <br/>", 
		"------------|------------|---------- <br/>"
];

private _addonNames = keys GVAR(versions);
_addonNames sort true;
{
	private _name = _x;

	private _myVersion = (GVAR(versions) getOrDefault [_name, ["-", false]])#0;
	if (_myVersion isEqualTo "") then {
		_myVersion = "-";
	};
	_myVersion = [_myVersion, 10] call _pad;
	private _serverVersion = (GVAR(versions_server) getOrDefault [_name, ["-", false]])#0;
	if (_serverVersion isEqualTo "") then {
		_serverVersion = "-";
	};	
	_serverVersion = [_serverVersion, 10] call _pad;

	_description pushBack (format [" %1 | %2 | %3 <br/>", _myVersion, _serverVersion, _name]);

} forEach _addonNames;

player setDiaryRecordText [[QEGVAR(ui,helpSubject), [GVAR(addonVersionsTitle)] call EFUNC(ui,getHelpRecord)], [GVAR(addonVersionsTitle), "<font face=""EtelkaMonospacePro"" size=""8"">" + (_description joinString "") + "</font>"]]