params [["_target",objNull],["_bodyParts",[]]];

private _status = _target getVariable ["ace_medical_bodyPartStatus",[0,0,0,0,0,0]];
{
    _id = [_x] call ace_medical_fnc_selectionNameToNumber;
    if !(_id<0) then {
        _status set [_id,0];
    };

    false
} count _bodyParts;

_target setVariable ["ace_medical_bodyPartStatus",_status,true];
[_target] call ace_medical_fnc_handleDamage_advancedSetDamage;
