#include "script_component.hpp"

params ["_oldArray"];

private _newArray = [];
{

	private _var = _x;

	if (!isNil "_var") then {
		_newArray pushBack _var;
	};
}forEach _oldArray;

_newArray
