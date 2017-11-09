/*
 * Author: Glowbal / edit by Willard
 * local Callback for the CPR treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller","_target"];

if (_target getVariable ["ace_medical_inReviveState", false]) then {
    private _reviveStartTime = _target getVariable ["ace_medical_reviveStartTime",0];
    if (_reviveStartTime > 0) then {
        _target setVariable ["ace_medical_reviveStartTime", (_reviveStartTime + random(20)) min CBA_missionTime];
    };
};

if (ace_medical_level > 1 && {(random 1) >= 0.6}  &&  (_target getVariable ["ace_medical_bloodvolume", 100] > 60)) then {
    _target setVariable ["ace_medical_inCardiacArrest", nil,true];
    _target setVariable ["ace_medical_heartRate", 40,true];
    _target setVariable ["ace_medical_inReviveState", false, true];
    _target setVariable ["ace_medical_isUnconscious", false, true];
    _target setVariable ["ace_medical_heartRate", 40, true];
    _target setVariable ["ace_medical_bloodPressure", [50,70], true];
	_target setVariable ["ace_medical_addedToUnitLoop", false, true];
};

[_target, "activity", "STR_ace_medical_Activity_CPR", [[_caller, false, true] call ace_common_fnc_getName]] call ace_medical_fnc_addToLog;
[_target, "activity_view", "STR_ace_medical_Activity_CPR", [[_caller, false, true] call ace_common_fnc_getName]] call ace_medical_fnc_addToLog; // TODO expand message

true;
