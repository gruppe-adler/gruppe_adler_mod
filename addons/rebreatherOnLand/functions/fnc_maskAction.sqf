#include "script_component.hpp"

_swap = {
    params ["_unit"];

    private _oldVest = vest _unit;
    private _oldVestItems = (itemCargo (vestContainer _unit) + weaponCargo (vestContainer _unit));
    private _oldMags = [_unit] call FUNC(vestMagazines);

    private _newVest = switch (_oldVest) do {
        case (QGVAR(OxygenTank_Blk)): {QGVAR(OxygenTank_Blk_nomask)};
        case (QGVAR(OxygenTank_Oli)): {QGVAR(OxygenTank_Oli_nomask)};
        case (QGVAR(OxygenTank_Rgr)): {QGVAR(OxygenTank_Rgr_nomask)};
        case (QGVAR(OxygenTank_Blk_nomask)): {QGVAR(OxygenTank_Blk)};
        case (QGVAR(OxygenTank_Oli_nomask)): {QGVAR(OxygenTank_Oli)};
        case (QGVAR(OxygenTank_Rgr_nomask)): {QGVAR(OxygenTank_Rgr)};
        default {""};
    };
    if (_newVest == "") exitWith {};

    if (_newVest in MASKVESTS) then {
        [true] call FUNC(maskEffect);
    } else {
        [false] call FUNC(maskEffect);
    };

    removeVest _unit;
    _unit addVest _newVest;

    {
         _unit addItemToVest _x;
    } forEach _oldVestItems;

    {
         (vestContainer _unit) addMagazineAmmoCargo [(_x select 0), (_x select 2), (_x select 1)];
    } forEach _oldMags;
};


_action = [QGVAR(maskTakeOff), "Take off oxygen mask", "", _swap, {vest (_this select 0) in MASKVESTS}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;

_action = [QGVAR(maskTakeOff), "Put on oxygen mask", "", _swap, {vest (_this select 0) in [QGVAR(OxygenTank_Blk_nomask),QGVAR(OxygenTank_Oli_nomask),QGVAR(OxygenTank_Rgr_nomask)]}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;

GVAR(maskEffect) = false;
if (vest player in MASKVESTS) then {
    [true] call FUNC(maskEffect);
};
