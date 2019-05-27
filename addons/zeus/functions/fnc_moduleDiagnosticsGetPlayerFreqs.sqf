#include "script_component.hpp"

params [["_unit",objNull]];

private _freqs = [];

private _swFreq = _unit getVariable [QGVAR(freqSW), 0];
if (!(isNil "_swFreq") && {!(_swFreq isEqualTo 0)}) then {
    private _swAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalSW), 0];
    if (!(isNil "_swAdditionalFreq") && {!(_swAdditionalFreq isEqualTo 0)}) then {
        _freqs pushBack format ["SR %1 MHz / %2 MHz", _swFreq, _swAdditionalFreq];
    } else {
        _freqs pushBack format ["SR %1 MHz", _swFreq];
    };
};

private _lrFreq = _unit getVariable [QGVAR(freqLR), 0];
if (!(isNil "_lrFreq") && {!(_lrFreq isEqualTo 0)}) then {
    private _lrAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalLR), 0];
    if (!(isNil "_lrAdditionalFreq") && {!(_lrAdditionalFreq isEqualTo 0)}) then {
        _freqs pushBack format ["LR %1 MHz / %2 MHz", _lrFreq, _lrAdditionalFreq];
    } else {
        _freqs pushBack format ["LR %1 MHz", _lrFreq];
    };
};

_freqs
