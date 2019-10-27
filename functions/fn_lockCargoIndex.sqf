params [
    ["_vehicle", objNull],
    ["_lockCargoIndex", -999],
    ["_newState", true]
];

assert(!(isNull _vehicle));
assert(_lockCargoIndex != -999);

private _allSeats = fullCrew [_vehicle, "", true];
_allSeats findIf {
    // [B Alpha 1-2:7,"Turret",2,[0],true],
    _x params ["_unit", "_type", "_cargoIndex", "_turretPath", "_personTurret"];

    if (_cargoIndex == _lockCargoIndex) then {
        diag_log format ["setting lock: cargoindex %1, turret %2 to %3", _cargoIndex, _turretPath, _newState];
        switch (toLower _type) do {
            case "cargo": {
                _vehicle lockCargo [_cargoIndex, _newState];
            };
            case "turret": {
                _vehicle lockTurret [_turretPath, _newState];
            };
            default {
                diag_log "warning: unhandled cargo index";
            };
        };
        diag_log "yarp";
    } else {
        diag_log "narp";
         false
    }
};
