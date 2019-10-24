//params [
//    ["_animal", objNull]
//];
params ["_animal"];

if (isNull _animal) exitWith {
    diag_log "aagh null animal!";
    objNull
};

// Truck_F
private _candidates = nearestObjects [_animal, ["Car", "Truck_F", "B_G_Van_01_transport_F"], 10, false];

private _foundIdx = _candidates findIf {
    ([_x] call GRAD_animalTransport_fnc_findSuitableSeat) != -1;
};

if (_foundIdx == -1) then {
    objNull
} else {
    _candidates select _foundIdx;
};
