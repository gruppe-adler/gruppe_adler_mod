params [
    "_vehicle",
    "_animal"
];

private _unloadPoint = [
    missionConfigFile >> "GRAD_animalTransport" >> "Vehicles" >> typeOf _vehicle,
    "unloadPoint",
    [0, 0, 0]
] call BIS_fnc_returnConfigEntry;

_animal attachTo [_vehicle, _unloadPoint];
detach _animal;
_animal setDir ((getDir _vehicle) - 180);
