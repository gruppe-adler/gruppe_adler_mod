#include "script_component.hpp"

params [["_unit",objNull]];


//dead
if (!alive _x) exitWith {
    ["dead"]
};

private _status = [];


//unconscious
private _downSince = _x getVariable [QGVAR(downSince),-1];
if (_downSince > 0) then {
    _downTime = CBA_missionTime - _downSince;
    _downTimeText = format ([["%1s",_downTime],["%1min",round (_downTime/60)]] select {_downTime > 60});
    _status pushBack (format ["down for %1",_downTimeText]);
};


//injured
private _injuredBodyParts = [];
{
    if (_x > 0) then {
        _injuredBodyParts pushBack (["head","body","left arm","right arm","left leg","right leg"] select _forEachIndex);
    };
} forEach (_unit getVariable ["ace_medical_bodyPartStatus",[0,0,0,0,0,0]]);

if (count _injuredBodyParts > 0) then {
    _status pushBack (format ["%1 injured",_injuredBodyParts joinString ", "]);
};


//blood
private _bloodVolume = _unit getVariable ["ace_medical_bloodVolume",100];
if (_bloodVolume < 100) then {
    _status pushBack (format ["%1% blood",round _bloodVolume]);
};


_status
