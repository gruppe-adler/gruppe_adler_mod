#include "..\script_component.hpp"

ISNILS(GVAR(namelen), 44);
ISNILS(GVAR(versionlen), 10);

ISNILS(GVAR(maxLines), 2000); // max lines would be 3121 total minus 2 for header

private _pad = {
	params [["_str", "wrong_type", ["string"]], "_targetLen", "_overflowChar"];
	private _strLen = count _str;

	if (_strLen > _targetLen) exitWith {
		[_str select [0, _targetLen - 1], _overflowChar] joinString ""
	};

	if (_strLen == _targetLen) exitWith {_str};

	private  _a = [];
	_a resize (_targetLen - _strLen);
	(_str + ((_a apply {" "}) joinString ""));
};

private _descriptionHeader = [
	"   LOCAL    |   SERVER   |   ADDON  ",
	"------------|------------|---------- "
];

private _descriptionLines = createHashMap;

private _addonNames = keys GVAR(versions);
{
	private _name = _x;

	private _myVersion = (GVAR(versions) getOrDefault [_name, ["-", false]])#0;
	if (_myVersion isEqualTo "") then {
		_myVersion = "-";
	};
	_myVersion = [_myVersion, GVAR(versionlen), "…"] call _pad;
	private _serverVersion = (GVAR(versions_server) getOrDefault [_name, ["-", false]])#0;
	if (_serverVersion isEqualTo "") then {
		_serverVersion = "-";
	};
	_serverVersion = [_serverVersion, GVAR(versionlen), "…"] call _pad;

	_shortenedName = [_name, GVAR(namelen), "…"] call _pad;

	_descriptionLine = createHashMap;
	_descriptionLine set ["client", _myVersion];
	_descriptionLine set ["server", _serverVersion];
	_descriptionLine set ["shortenedName", _shortenedName];
	_descriptionLine set ["prefix", trim ((_shortenedName splitString "_")#0)];
	_descriptionLines set [_name, _descriptionLine]
} forEach _addonNames;

_addonNames sort true;

private _diaryRecordSources = [];
while { (count _addonNames) > 0 } do {
	private _addonNamesPage = _addonNames select [0, GVAR(maxLines)];
	_addonNames deleteRange [0, GVAR(maxLines)];

	private _lines = _addonNamesPage apply {
		_descriptionLine = _descriptionLines getOrDefault [_x, createHashMap];

		format [" %1 | %2 | %3",
			_descriptionLine getOrDefault ["client", "?"],
			_descriptionLine getOrDefault ["server", "?"],
			_descriptionLine getOrDefault ["shortenedName", "?"]
		]
	};

	private _first = _descriptionLines getOrDefault [_addonNamesPage#0, createHashMap];
	private _last = _descriptionLines getOrDefault [_addonNamesPage select ((count _addonNamesPage) - 1), createHashMap];

	INFO_3("adding %1 lines to addon versions help page, from %2 to %3...", count _addonNamesPage, trim (_first get "shortenedName"), trim (_last get "shortenedName"));

	private _range = format ["%1...%2",
		_first getOrDefault ["prefix", "?"],
		_last getOrDefault ["prefix", "?"]
	];

	private _title = format ["%1 : %2", GVAR(addonVersionsTitle), _range];

	_diaryRecordSources pushBack [
		_title,
		"<font face=""EtelkaMonospacePro"" size=""8"">" + ((_descriptionHeader + _lines) joinString "<br/>") + "</font>"
	];
};


reverse _diaryRecordSources;
player createDiarySubject [QGVAR(versionsSubject),"Addon Versions"];
{
	player createDiaryRecord [QGVAR(versionsSubject), _x];
} forEach _diaryRecordSources;

player removeDiaryRecord [QEGVAR(ui,helpSubject), [GVAR(addonVersionsTitle)] call EFUNC(ui,getHelpRecord)];
EGVAR(ui,helpRecords) deleteAt GVAR(addonVersionsTitle);
