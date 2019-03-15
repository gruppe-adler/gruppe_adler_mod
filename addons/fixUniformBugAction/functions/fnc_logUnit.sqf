#include "script_component.hpp"
params ["_unit"];

private _log = [];

_log pushBack format ["Player: %1, Unit: %2, Uniform: %3, UniformContainer: %4", _unit, typeOf _unit, uniform _unit, uniformContainer _unit];

[_unit, _log] remoteExecCall [QFUNC(logServer), 2];
hint "Bug logged!";
