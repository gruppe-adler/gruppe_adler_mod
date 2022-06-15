#include "script_component.hpp"

params ["_loadoutHash", "_types"];

private _baseLoadout = [
	["","","","",[],[],""],													//PrimaryWeapon
	["","","","",[],[],""],													//SecondaryWeapon
	["","","","",[],[],""],													//Handgun
	[],																		//Uniform
	[],																		//Vest
	[],																		//Backpack
	"",																		//Headwear
	"",																		//Facewear
	[],																		//Binocular
	["", "", "", "", "", ""]												//Items (Map, Radio, etc)
];
private _soldierLoadout = [_loadoutHash, "Soldier_F"] call CBA_fnc_hashGet;
if (_soldiersLoadout isEqualTo []) exitWith { _baseLoadout };

_types deleteAt (_types find "Soldier_F");

{
	private _type = _x;
	private _loadout = [_loadoutHash, _type] call CBA_fnc_hashGet;

	//Compare Weapons
	{
		private _loadoutWeapon = _x;
		private _weaponArraySoldier = _soldierLoadout select _forEachIndex;
		private _baseLoadoutWeapons = _baseLoadout select _forEachIndex;

		if (_loadoutWeapon isNotEqualTo []) then {
			{
				if ((_x isNotEqualTo "" && {_x isNotEqualTo []}) && {_x isEqualTo (_weaponArraySoldier select _forEachIndex)}) then {
					_baseLoadoutWeapons set [_forEachIndex, _x];
					_weaponArraySoldier set [_forEachIndex, ""];
					_loadoutWeapon set [_forEachIndex, ""];
				};
			}forEach _loadoutWeapon;
		};
	}forEach [
		_loadout select 0, 
		_loadout select 1, 
		_loadout select 2
	];

	//Compare Clothes
	{
		private _string = _x;
		private _compare = _soldierLoadout select (_forEachIndex +3);
		private _array = [];
		private _array2 = [];

		if (_string isEqualtype []) then {
			_array = _string;
			_array2 = _compare;

			_string = _array select 0;
			_compare = _array2 select 0;
		};

		if (_string isNotEqualTo "" && {_string isEqualTo _compare}) then {
			private _baseArraySet = _string;

			if (_array isNotEqualTo []) then {
				_baseArraySet = [_string];

				_array set [0, ""];
				_string = _array;

				_array2 set [0, ""];
				_compare = _array;
			};

			_baseLoadout set [(_forEachIndex +3), _baseArraySet];
			_soldierLoadout set [(_forEachIndex +3), _compare];
			_loadout set [(_forEachIndex +3), _string];
		};
	}forEach [
		_loadout select 3, 
		_loadout select 4, 
		_loadout select 5, 
		_loadout select 6, 
		_loadout select 7, 
		_loadout select 8
	];

	//Compare Items
	private _tools = _loadout select 9;
	private _soldierTools = _soldierLoadout select 9;
	private _baseTools = _baseLoadout select 9;
	{
		if (_x isNotEqualTo ""  && {_x isEqualTo (_soldierTools select _forEachIndex)}) then {
			_baseTools set [_forEachIndex, _x];
			_tools set [_forEachIndex, ""];
			_soldierTools set [_forEachIndex, ""];
		};
	}forEach _tools;

	_loadout set [9, _tools];
	_soldierLoadout set [9, _soldierTools];
	_baseLoadout set [9, _baseTools];

	[_loadoutHash, _type, _loadout] call CBA_fnc_hashSet;
}forEach _types;

[_loadoutHash, "Soldier_F", _soldierLoadout] call CBA_fnc_hashGet;

_types pushBack "Soldier_F";
reverse _types;

_baseLoadout