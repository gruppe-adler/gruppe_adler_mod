#include "script_component.hpp"
params ["_units", "_types"];

private _return = [];

private _display = (findDisplay 46) createDisplay QGVAR(RscDisplayGetLoadoutsFromUnits);
private _textCtrl = _display displayCtrl 1100;

























_return
