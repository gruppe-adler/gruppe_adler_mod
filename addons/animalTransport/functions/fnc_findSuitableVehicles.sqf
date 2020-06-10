#include "script_component.hpp"

/**
 * returns CBA hash map of vehicle to array of Space configs
 */
params [
    ["_animal", objNull]
];

assert(!(isNull _animal));

private _candidates = [_animal] call FUNC(findTransportsInLoadingRange);

private _result = [] call cba_fnc_hashCreate;
{
    [
        _result,
        _x,
        ([_x, typeOf _animal] call FUNC(findSuitableSpaces))
    ] call cba_fnc_hashSet;
} forEach _candidates;

_result
