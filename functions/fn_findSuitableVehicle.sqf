params [
    ["_animal", objNull]
];

private _candidates = nearestObjects [getPos _animal, ["Car","Truck"], 10];

// get first vehicle with a suitable free "seat"

private _foundIdx = _candidates findIf { [_x] call GRAD_animalTransport_fnc_findSuitableSeat };

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
