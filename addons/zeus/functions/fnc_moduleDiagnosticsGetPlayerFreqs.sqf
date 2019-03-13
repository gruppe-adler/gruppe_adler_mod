#include "script_component.hpp"

params [["_unit",objNull]];

private _freqs = [];

private _swFreq = _unit getVariable [QGVAR(freqSW), -1];
if (!(isNil "_swFreq") && {_swFreq != -1}) then {
    private _swAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalSW), -1];
    if (!(isNil "_swAdditionalFreq") && {_swAdditionalFreq != -1}) then {
        _freqs pushBack format ["SR %1 MHz / %2 MHz", _swFreq, _swAdditionalFreq];
    } else {
        _freqs pushBack format ["SR %1 MHz",_mainFreq];
    };
};

private _lrFreq = _unit getVariable [QGVAR(freqLR), -1];
if (!(isNil "_lrFreq") && {_lrFreq != -1}) then {
    private _lrAdditionalFreq = _unit getVariable [QGVAR(freqAdditionalLR), -1];
    if (!(isNil "_lrAdditionalFreq") && {_lrAdditionalFreq != -1}) then {
        _freqs pushBack format ["LR %1 MHz / %2 MHz", _lrFreq, _lrAdditionalFreq];
    } else {
        _freqs pushBack format ["LR %1 MHz", _lrFreq];
    };
};

_freqs
