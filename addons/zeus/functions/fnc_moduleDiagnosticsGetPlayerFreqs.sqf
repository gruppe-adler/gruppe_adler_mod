#include "script_component.hpp"

params [["_unit",objNull]];

private _freqs = [];

if  (isClass (configFile >> "CfgPatches" >> "acre_main")) then {

};

if  (isClass (configFile >> "CfgPatches" >> "tfar_core")) then {
    private _swFreq = _unit getVariable [QGVAR(freqSW), 0];
    if (!(_swFreq isEqualTo 0)) then {
        private _swAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalSW), 0];
        if (!(_swAdditionalFreq isEqualTo 0)) then {
            _freqs pushBack format ["SR %1 MHz / %2 MHz", _swFreq, _swAdditionalFreq];
        } else {
            _freqs pushBack format ["SR %1 MHz", _swFreq];
        };
    };

    private _lrFreq = _unit getVariable [QGVAR(freqLR), 0];
    if (!(_lrFreq isEqualTo 0)) then {
        private _lrAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalLR), 0];
        if (!(_lrAdditionalFreq isEqualTo 0)) then {
            _freqs pushBack format ["LR %1 MHz / %2 MHz", _lrFreq, _lrAdditionalFreq];
        } else {
            _freqs pushBack format ["LR %1 MHz", _lrFreq];
        };
    };
};

_freqs
