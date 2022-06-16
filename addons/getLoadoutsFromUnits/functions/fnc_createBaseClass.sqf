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

private _uniforms = [];
private _vests = [];
private _backpacks = [];
private _headgears = [];
private _primaryWeapons = [];
private _primaryWeaponMagazines = [];
private _primaryWeaponMuzzles = [];
private _primaryWeaponOptics = [];
private _primaryWeaponPointers = [];
private _primaryWeaponUnderbarrels = [];
private _primaryWeaponUnderbarrelMagazines = [];
private _secondaryWeapons = [];
private _secondaryWeaponMagazines = [];
private _secondaryWeaponMuzzles = [];
private _secondaryWeaponOpticss = [];
private _secondaryWeaponPointers = [];
private _secondaryWeaponUnderbarrels = [];
private _secondaryWeaponUnderbarrelMagazines = [];
private _handgunWeapons = [];
private _handgunWeaponMagazines = [];
private _handgunWeaponMuzzles = [];
private _handgunWeaponOpticss = [];
private _handgunWeaponPointers = [];
private _handgunWeaponUnderbarrels = [];
private _handgunWeaponUnderbarrelMagazines = [];
private _goggless = [];
private _nvgoggless = [];
private _binocularss = [];
private _maps = [];
private _gpss = [];
private _compasss = [];
private _watchs = [];
private _radios = [];

{
	private _loadout = [_loadoutHash, _x] call CBA_fnc_hashGet;

	if (_loadout isNotEqualTo []) then {
		_loadout params [
			["_primaryWeapon", []], 
			["_secondaryWeapon", []], 
			["_handgunWeapon", []], 
			["_uniform", []], 
			["_vest", []], 
			["_backpack", []], 
			["_headgear", ""], 
			["_googles", ""], 
			["_binocluar", []], 
			["_items", []]
		];

		if (_uniform isNotEqualTo []) then {
			_uniforms pushBack (_uniform select 0);
		};

		if (_vest isNotEqualTo []) then {
			_vests pushBack (_vest select 0);
		};

		if (_backpack isNotEqualTo []) then {
			_backpacks pushBack (_backpack select 0);
		};

		_headgears pushBack _headgear;

		if (_primaryWeapon isNotEqualTo []) then {
			_primaryWeapons pushBack (_primaryWeapon select 0);
			_primaryWeaponMuzzles pushBack (_primaryWeapon select 1);
			_primaryWeaponPointers pushBack (_primaryWeapon select 2);
			_primaryWeaponOptics pushBack (_primaryWeapon select 3);
			_primaryWeaponUnderbarrels pushBack (_primaryWeapon select 6);

			if ((_primaryWeapon select 4) isNotEqualTo []) then {
				_primaryWeaponMagazines pushBack (_primaryWeapon select 4 select 0);
			};
			
			if ((_primaryWeapon select 4) isNotEqualTo []) then {
				_primaryWeaponUnderbarrelMagazines pushBack (_primaryWeapon select 5 select 0);
			};
		};

		if (_secondaryWeapon isNotEqualTo []) then {
			_secondaryWeapons pushBack (_secondaryWeapon select 0);
			_secondaryWeaponMuzzles pushBack (_secondaryWeapon select 1);
			_secondaryWeaponPointers pushBack (_secondaryWeapon select 2);
			_secondaryWeaponOptics pushBack (_secondaryWeapon select 3);
			_secondaryWeaponUnderbarrels pushBack (_secondaryWeapon select 6);

			if ((_secondaryWeapon select 4) isNotEqualTo []) then {
				_secondaryWeaponMagazines pushBack (_secondaryWeapon select 4 select 0);
			};
			
			if ((_secondaryWeapon select 4) isNotEqualTo []) then {
				_secondaryWeaponUnderbarrelMagazines pushBack (_secondaryWeapon select 5 select 0);
			};
		};

		if (_handgunWeapon isNotEqualTo []) then {
			_handgunWeapons pushBack (_handgunWeapon select 0);
			_handgunWeaponMuzzles pushBack (_handgunWeapon select 1);
			_handgunWeaponPointers pushBack (_handgunWeapon select 2);
			_handgunWeaponOptics pushBack (_handgunWeapon select 3);
			_handgunWeaponUnderbarrels pushBack (_handgunWeapon select 6);

			if ((_handgunWeapon select 4) isNotEqualTo []) then {
				_handgunWeaponMagazines pushBack (_handgunWeapon select 4 select 0);
			};
			
			if ((_handgunWeapon select 4) isNotEqualTo []) then {
				_handgunWeaponUnderbarrelMagazines pushBack (_handgunWeapon select 5 select 0);
			};
		};

		if (_binocular isNotEqualTo []) then {
			_binocularss pushBack (_binocular select 0);
		};

		_goggless pushBack _googles;

		if (_items isNotEqualTo []) then {
			_maps pushBack (_items select 0);
			_gpss pushBack (_items select 1);
			_radios pushBack (_items select 2);
			_compasss pushBack (_items select 3);
			_watchs pushBack (_items select 4);
			_nvgoggless pushBack (_items select 5);
		};
	};
}forEach _types;

private _uniform = [_uniforms] call FUNC(returnBaseItem);
private _vest = [_vests] call FUNC(returnBaseItem);
private _backpack = [_backpacks] call FUNC(returnBaseItem);
private _headgear = [_headgears] call FUNC(returnBaseItem);
private _primaryWeapon = [_primaryWeapons] call FUNC(returnBaseItem);
private _primaryWeaponMagazine = [_primaryWeaponMagazines] call FUNC(returnBaseItem);
private _primaryWeaponMuzzle = [_primaryWeaponMuzzles] call FUNC(returnBaseItem);
private _primaryWeaponOptic = [_primaryWeaponOptics] call FUNC(returnBaseItem);
private _primaryWeaponPointer = [_primaryWeaponPointers] call FUNC(returnBaseItem);
private _primaryWeaponUnderbarrel = [_primaryWeaponUnderbarrels] call FUNC(returnBaseItem);
private _primaryWeaponUnderbarrelMagazine = [_primaryWeaponUnderbarrelMagazines] call FUNC(returnBaseItem);
private _secondaryWeapon = [_secondaryWeapons] call FUNC(returnBaseItem);
private _secondaryWeaponMagazine = [_secondaryWeaponMagazines] call FUNC(returnBaseItem);
private _secondaryWeaponMuzzle = [_secondaryWeaponMuzzles] call FUNC(returnBaseItem);
private _secondaryWeaponOptic = [_secondaryWeaponOptics] call FUNC(returnBaseItem);
private _secondaryWeaponPointer = [_secondaryWeaponPointers] call FUNC(returnBaseItem);
private _secondaryWeaponUnderbarrel = [_secondaryWeaponUnderbarrels] call FUNC(returnBaseItem);
private _secondaryWeaponUnderbarrelMagazine = [_secondaryWeaponUnderbarrelMagazines] call FUNC(returnBaseItem);
private _handgunWeapon = [_handgunWeapons] call FUNC(returnBaseItem);
private _handgunWeaponMagazine = [_handgunWeaponMagazines] call FUNC(returnBaseItem);
private _handgunWeaponMuzzle = [_handgunWeaponMuzzles] call FUNC(returnBaseItem);
private _handgunWeaponOptics = [_handgunWeaponOpticss] call FUNC(returnBaseItem);
private _handgunWeaponPointer = [_handgunWeaponPointers] call FUNC(returnBaseItem);
private _handgunWeaponUnderbarrel = [_handgunWeaponUnderbarrels] call FUNC(returnBaseItem);
private _handgunWeaponUnderbarrelMagazine = [_handgunWeaponUnderbarrelMagazines] call FUNC(returnBaseItem);
private _goggles = [_goggless] call FUNC(returnBaseItem);
private _nvgoggles = [_nvgoggless] call FUNC(returnBaseItem);
private _binoculars = [_binocularss] call FUNC(returnBaseItem);
private _map = [_maps] call FUNC(returnBaseItem);
private _gps = [_gpss] call FUNC(returnBaseItem);
private _compass = [_compasss] call FUNC(returnBaseItem);
private _watch = [_watchs] call FUNC(returnBaseItem);
private _radio = [_radios] call FUNC(returnBaseItem);

_baseLoadout set [0, [_primaryWeapon, _primaryWeaponMuzzle, _primaryWeaponPointer, _primaryWeaponOptic, [_primaryWeaponMagazine], [_primaryWeaponUnderbarrelMagazine], _primaryWeaponUnderbarrel]];
_baseLoadout set [1, [_secondaryWeapon, _secondaryWeaponMuzzle, _secondaryWeaponPointer, _secondaryWeaponOptic, [_secondaryWeaponMagazine], [_secondaryWeaponUnderbarrelMagazine], _secondaryWeaponUnderbarrel]];
_baseLoadout set [2, [_handgunWeapon, _handgunWeaponMuzzle, _handgunWeaponPointer, _handgunWeaponOptic, [_handgunWeaponMagazine], [_handgunWeaponUnderbarrelMagazine], _handgunWeaponUnderbarrel]];
_baseLoadout set [3, [_uniform]];
_baseLoadout set [4, [_vest]];
_baseLoadout set [5, [_backpack]];
_baseLoadout set [6, _headgear];
_baseLoadout set [7, _goggles];
_baseLoadout set [8, [_binoculars]];
_baseLoadout set [9, [_map, _gps, _radio, _compass, _watch, _nvgoggles]];

{
	private _loadout = [_loadoutHash, _x] call CBA_fnc_hashGet;

	if (_loadout isNotEqualTo []) then {
		_loadout params [
			["_primaryWeaponClass", []], 
			["_secondaryWeaponClass", []], 
			["_handgunWeaponClass", []], 
			["_uniformClass", []], 
			["_vestClass", []], 
			["_backpackClass", []], 
			["_headgearClass", ""], 
			["_googlesClass", ""], 
			["_binocluarClass", []], 
			["_itemsClass", []]
		];

		if (_primaryWeaponClass isNotEqualTo []) then {
			if ((_primaryWeaponClass select 0) isEqualTo _primaryWeapon) then {
				_primaryWeaponClass set [0, nil];
			};
			if ((_primaryWeaponClass select 1) isEqualTo _primaryWeaponMuzzle) then {
				_primaryWeaponClass set [1, nil];
			};
			if ((_primaryWeaponClass select 2) isEqualTo _primaryWeaponPointer) then {
				_primaryWeaponClass set [2, nil];
			};
			if ((_primaryWeaponClass select 3) isEqualTo _primaryWeaponOptic) then {
				_primaryWeaponClass set [3, nil];
			};

			private _mag = _primaryWeaponClass select 4;
			if ((_mag select 0) isEqualTo _primaryWeaponMagazine) then {
				_mag set [0, nil];
				_primaryWeaponClass set [4, _mag];
			};

			private _magU = _primaryWeaponClass select 5;
			if ((_magU select 0) isEqualTo _primaryWeaponUnderbarrelMagazine) then {
				_magU set [0, nil];
				_primaryWeaponClass set [5, _magU];
			};
			
			if ((_primaryWeaponClass select 6) isEqualTo _primaryWeaponUnderbarrel) then {
				_primaryWeaponClass set [6, nil];
			};
		};

		if (_secondaryWeaponClass isNotEqualTo []) then {
			if ((_secondaryWeaponClass select 0) isEqualTo _secondaryWeapon) then {
				_secondaryWeaponClass set [0, nil];
			};
			if ((_secondaryWeaponClass select 1) isEqualTo _secondaryWeaponMuzzle) then {
				_secondaryWeaponClass set [1, nil];
			};
			if ((_secondaryWeaponClass select 2) isEqualTo _secondaryWeaponPointer) then {
				_secondaryWeaponClass set [2, nil];
			};
			if ((_secondaryWeaponClass select 3) isEqualTo _secondaryWeaponOptic) then {
				_secondaryWeaponClass set [3, nil];
			};

			private _mag = _secondaryWeaponClass select 4;
			if ((_mag select 0) isEqualTo _secondaryWeaponMagazine) then {
				_mag set [0, nil];
				_secondaryWeaponClass set [4, _mag];
			};

			private _magU = _secondaryWeaponClass select 5;
			if ((_magU select 0) isEqualTo _secondaryWeaponUnderbarrelMagazine) then {
				_magU set [0, nil];
				_secondaryWeaponClass set [5, _magU];
			};
			
			if ((_secondaryWeaponClass select 6) isEqualTo _secondaryWeaponUnderbarrel) then {
				_secondaryWeaponClass set [6, nil];
			};
		};

		if (_handgunWeaponClass isNotEqualTo []) then {
			if ((_handgunWeaponClass select 0) isEqualTo _handgunWeapon) then {
				_handgunWeaponClass set [0, nil];
			};
			if ((_handgunWeaponClass select 1) isEqualTo _handgunWeaponMuzzle) then {
				_handgunWeaponClass set [1, nil];
			};
			if ((_handgunWeaponClass select 2) isEqualTo _handgunWeaponPointer) then {
				_handgunWeaponClass set [2, nil];
			};
			if ((_handgunWeaponClass select 3) isEqualTo _handgunWeaponOptic) then {
				_handgunWeaponClass set [3, nil];
			};

			private _mag = _handgunWeaponClass select 4;
			if ((_mag select 0) isEqualTo _handgunWeaponMagazine) then {
				_mag set [0, nil];
				_handgunWeaponClass set [4, _mag];
			};

			private _magU = _handgunWeaponClass select 5;
			if ((_magU select 0) isEqualTo _handgunWeaponUnderbarrelMagazine) then {
				_magU set [0, nil];
				_handgunWeaponClass set [5, _magU];
			};
			
			if ((_handgunWeaponClass select 6) isEqualTo _handgunWeaponUnderbarrel) then {
				_handgunWeaponClass set [6, nil];
			};
		};

		if (_uniformClass isNotEqualTo []) then {
			if (_uniformClass select 0 isEqualTo _uniform) then {
				_uniformClass set [0, nil];
			};
		};

		if (_vestClass isNotEqualTo []) then {
			if (_vestClass select 0 isEqualTo _vest) then {
				_vestClass set [0, nil];
			};
		};

		if (_backpackClass isNotEqualTo []) then {
			if (_backpackClass select 0 isEqualTo _backpack) then {
				_backpackClass set [0, nil];
			};
		};

		if (_headgearClass isNotEqualTo "") then {
			if (_headgearClass isEqualTo _headgear) then {
				_headgearClass = nil;
			};
		};

		if (_gogglesClass isNotEqualTo "") then {
			if (_gogglesClass isEqualTo _goggles) then {
				_gogglesClass = nil;
			};
		};

		if (_binocularClass isNotEqualTo []) then {
			if (_binocularClass select 0 isEqualTo _binocular) then {
				_binocularClass set [0, nil];
			};
		};

		if (_itemsClass isNotEqualTo []) then {
			if ((_itemsClass select 0) isEqualTo _map) then {
				_itemsClass set [0, nil];
			};
			if ((_itemsClass select 1) isEqualTo _gps) then {
				_itemsClass set [1, nil];
			};
			if ((_itemsClass select 2) isEqualTo _radio) then {
				_itemsClass set [2, nil];
			};
			if ((_itemsClass select 3) isEqualTo _compass) then {
				_itemsClass set [3, nil];
			};
			if ((_itemsClass select 4) isEqualTo _watch) then {
				_itemsClass set [4, nil];
			};
			if ((_itemsClass select 5) isEqualTo _nvgoggles) then {
				_itemsClass set [5, nil];
			};
		};


		[_loadoutHash, _x, [_primaryWeaponClass, _secondaryWeaponClass, _handgunWeaponClass, _uniformClass, _vestClass, _backpackClass, _headgearClass, _googlesClass, _binocluarClass, _itemsClass]] call CBA_fnc_hashSet;
	};
}forEach _types;

_baseLoadout
