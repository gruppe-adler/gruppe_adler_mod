#include "script_component.hpp"

if (!hasInterface) exitWith {};

player createDiarySubject [QGVAR(helpSubject),"Gruppe Adler Mod"];

private _helpRecordsQueue = missionNamespace getVariable [QGVAR(helpRecordsQueue),[]];
_helpRecordsQueue sort true;

ISNILS(GVAR(helpRecords), createHashMap);

{
    _x params ["_title","_text"];

    private _record = player createDiaryRecord [QGVAR(helpSubject),[
        _title,
        format ["<img width='32' height='32' image='\x\grad\addons\ui\dialog\logo_128.paa'/><font size='32' color='#D18D1F' face='RobotoCondensedLight'> %1</font><br/><br/>%2",_title,_text]
    ]];
    GVAR(helpRecords) set [_title, _record];

} forEach _helpRecordsQueue;

GVAR(helpRecordsQueue) = nil;
