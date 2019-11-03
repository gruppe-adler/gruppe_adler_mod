params [
    ["_animal", objNull],
    ["_action", "default"]
];

assert(!isNull _animal);
assert(_action in ["stop", "default"]);

private _animalConfig = missionConfigFile >> "GRAD_animalTransport" >> "Animals" >> typeOf _animal;
if (isNull _animalConfig) exitWith {diag_log format["cannot handle animal %1", _animal]; };

private _move = [_animalConfig, _action, ""] call BIS_fnc_returnConfigEntry;

_animal playMove _move;
