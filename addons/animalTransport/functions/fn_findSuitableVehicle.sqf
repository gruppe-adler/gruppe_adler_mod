params [
    ["_animal", objNull]
];

if (isNull _animal) exitWith {
    diag_log "aagh null animal!";
    objNull
};

// configured vehicle classes
_possibleVehicleClasses =  ("true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Vehicles"));
_possibleVehicleClasses = _possibleVehicleClasses apply { configName _x};
private _candidates = nearestObjects [_animal, _possibleVehicleClasses, GRAD_animalTransport_loadingRange, false];

private _foundIdx = _candidates findIf {
    !(isNull ([_x, typeOf _animal] call GRAD_animalTransport_fnc_findSuitableSpace));
};

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
