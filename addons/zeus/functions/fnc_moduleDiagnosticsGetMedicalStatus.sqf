#include "script_component.hpp"

params [["_unit",objNull]];


//dead
if (!alive _x) exitWith {
    ["dead"]
};


//other states need blood volume
private _bloodVolume = format ["%1% blood",round (_unit getVariable ["ace_medical_bloodVolume",100])];


//unconscious
private _status = _x getVariable [QGVAR(downSince),-1];
if (_status > 0) exitWith {
    _downTime = if (_status > 60) then {
        format ["%1min",round ((CBA_missionTime - _status)/60)]
    } else {
        format ["%1s",(CBA_missionTime -_status)]
    };

    [format ["down for %1",_downTime],_bloodVolume]
};


//injured
private _injuredBodyParts = [];
{
    if (_x > 0) then {
        _injuredBodyParts pushBack (["head","body","left arm","right arm","left leg","right leg"] select _forEachIndex);
    };
} forEach (_unit getVariable ["ace_medical_bodyPartStatus",[0,0,0,0,0,0]]);

if (count _injuredBodyParts > 0) exitWith {
    [format ["%1 injured",_injuredBodyParts joinString ", "],_bloodVolume]
};



[]
