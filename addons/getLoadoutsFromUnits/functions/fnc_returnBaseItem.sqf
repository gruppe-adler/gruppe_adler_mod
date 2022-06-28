#include "script_component.hpp"

params ["_array"];

private _return = "";

if (_array isNotEqualTo []) then {
	private _maxCount = 2;
	private _allreadyCounted = [];

	{
		if !(_x in _allreadyCounted) then {
			private _selectedItem = _x;
			private _count = {_x == _selectedItem} count _array;

			if (_count > _maxCount) then {
				_maxCount = _count;
				_return = _selectedItem;
			};

			_allreadyCounted pushBack _selectedItem;
		};
	}forEach _array;
};

_return