params ["_caller", "_target", "_selectionName", "_className", "_items"];

private _function = ["GRAD_ALK_fnc_treatArms","GRAD_ALK_fnc_treatLegs"] select (_className isEqualTo "GRAD_ALK_legs");

[_caller,_target] remoteExec [_function,_target];

true
