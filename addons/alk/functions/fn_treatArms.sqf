params ["_caller","_target"];

_target setHitPointDamage ["HitHands",0];

[_target, "activity_view", localize "STR_GRAD_ALK_LOG_ARMS", [[_caller, false, true] call ace_common_fnc_getName]] call ace_medical_fnc_addToLog;
