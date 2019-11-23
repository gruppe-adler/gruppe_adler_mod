#include "script_component.hpp"

params [
    ["_vehicle", objNull],
    ["_lockCargoIndex", -999],
    ["_newState", true]
];

assert(!(isNull _vehicle));
assert(_lockCargoIndex != -999);

private _allSeats = fullCrew [_vehicle, "", true];
_allSeats findIf {
    _x params ["_unit", "_type", "_cargoIndex", "_turretPath", "_personTurret"]; //[B Alpha 1-2:7,"Turret",2,[0],true],

    if (_cargoIndex == _lockCargoIndex) then {
        switch (toLower _type) do {
            case "cargo": {
                _vehicle lockCargo [_cargoIndex, _newState];
            };
            case "turret": {
                _vehicle lockTurret [_turretPath, _newState];
            };
            default {
                WARNING("warning: unhandled cargo index");
            };
        };
    } else {
         false
    }
};
