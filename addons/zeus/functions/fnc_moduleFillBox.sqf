#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _box = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
deleteVehicle _logic;

if !(typeOf _box isKindOf "ReammoBox_F") exitWith {[objNull, localize LSTRING(moduleFillBoxError)] call bis_fnc_showCuratorFeedbackMessage};

private _magazines = [];

{ 
 	private _player = _x; 

	if (isNull getAssignedCuratorLogic _player) then {
		private _loadout = getUnitLoadout _player; 
		_loadout params ["", "", "", ["_uniform", []], ["_vest", []], ["_backpack", []]];

		private _container = [];
		{
			if (count _x >= 2) then {
				_container append (_x select 1);
			};
		}forEach [_uniform, _vest, _backpack];
		
		{ 
			if (count _x > 2) then { 
				private _type = _x select 0;

				private _amount = -1;
				{
					_amount = switch (_x) do {
						case "HandGrenade" : {GVAR(amountHandgranades)};
						case "CA_LauncherMagazine" : {GVAR(amountRPG)};
						case "CA_Magazine" : {GVAR(amountRifle)};
						default {-1};
					};

					if (_amount > -1) exitWith {};
				}forEach ([configFile >> "CfgMagazines" >> _type, true ] call BIS_fnc_returnParents);

				_magazines pushBackUnique [_type, _amount]; 
			}; 
		}forEach _container; 
	};
}forEach allPlayers;

{	
	_x params ["_type", "_amount"];

	_box addMagazineCargoGlobal [_type, _amount];
}forEach _magazines;
