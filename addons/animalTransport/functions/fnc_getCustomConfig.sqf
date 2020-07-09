params [
    ["_vehicle", objNull] // NOTE: animals are also vehicles
];

private _configs = [
    configFile,
    missionConfigFile
];
private _idx = _configs findIf {
    isClass (_x >> "CfgVehicles" >> (typeOf _vehicle) >> "GRAD_AnimalTransport")
};
if (_idx == -1) exitWith {configNull};

(_configs#_idx) >> "CfgVehicles" >> (typeOf _vehicle) >> "GRAD_AnimalTransport"
