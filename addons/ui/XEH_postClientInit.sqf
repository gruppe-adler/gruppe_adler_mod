#include "script_component.hpp"

if (!hasInterface) exitWith {};

player createDiarySubject [QGVAR(helpSubject),"Gruppe Adler"];

private _helpRecords = missionNamespace getVariable [QGVAR(helpRecords),[]];
_helpRecords sort true;

{
    _x params ["_title","_text"];

    player createDiaryRecord [QGVAR(helpSubject),[
        _title,
        format ["<img width='32' height='32' image='\x\grad\addons\ui\dialog\logo_128.paa'/><font size='32' color='#D18D1F' face='RobotoCondensedLight'> %1</font><br/><br/>%2",_title,_text]
    ]];

} forEach _helpRecords;

_helpRecords resize 0;
GVAR(helpRecords) = nil;
