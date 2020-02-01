/*
 * Author: Glowbal / edit by derZade
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Global Sync Values (bloodbags) <BOOL>
 *
 * ReturnValue:
 * Blood volume change (in % total) <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

/*
    IV Change per second calculation:
    250ml should take 60 seconds to fill. 250/60 = 4.166.
    Basic medical is 10x (will take 6 seconds for 250ml)
 */
#define IV_CHANGE_PER_SECOND         ([41.66, 8.332] select (ace_medical_level >= 2))

params ["_unit", "_syncValues"];

private _bloodVolume = _unit getVariable ["ace_medical_bloodVolume", 100];
private _bloodVolumeChange = -([_unit] call ace_medical_fnc_getBloodLoss);

if (!isNil {_unit getVariable "ace_medical_ivBags"}) then {
    if (_bloodVolume < 100) then {
        private _bloodBags = _unit getVariable ["ace_medical_ivBags", []];
        _bloodBags = _bloodBags apply {
            _x params ["_bagVolumeRemaining"];
            private _bagChange = IV_CHANGE_PER_SECOND min _bagVolumeRemaining; // absolute value of the change in miliLiters
            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
            _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 70); // ((bag change in ml) / (body total:7000ml)) out of 100 percent
            if (_bagVolumeRemaining < 0.01) then {
                []
            } else {
                [_bagVolumeRemaining];
            };
        };
        _bloodBags = _bloodBags - [[]]; // remove empty bags
        if (_bloodBags isEqualTo []) then {
            _unit setVariable ["ace_medical_ivBags", nil, true]; // no bags left - clear variable (always globaly sync this)
        } else {
            _unit setVariable ["ace_medical_ivBags", _bloodBags, _syncValues];
        };
    } else {
        _unit setVariable ["ace_medical_ivBags", nil, true]; // blood volume = 100% - clear variable (always globaly sync this)
    };
};

_bloodVolumeChange;
