#include "..\defines.hpp"

_swap = {
    params ["_unit"];

    private _oldVest = vest _unit;
    private _oldVestItems = (itemCargo (vestContainer _unit) + weaponCargo (vestContainer _unit));
    private _oldMags = [_unit] call grad_rebreatherOnLand_fnc_vestMagazines;

    private _newVest = switch (_oldVest) do {
        case ("V_GA_OxygenTank_Blk"): {"V_GA_OxygenTank_Blk_nomask"};
        case ("V_GA_OxygenTank_Oli"): {"V_GA_OxygenTank_Oli_nomask"};
        case ("V_GA_OxygenTank_Rgr"): {"V_GA_OxygenTank_Rgr_nomask"};
        case ("V_GA_OxygenTank_Blk_nomask"): {"V_GA_OxygenTank_Blk"};
        case ("V_GA_OxygenTank_Oli_nomask"): {"V_GA_OxygenTank_Oli"};
        case ("V_GA_OxygenTank_Rgr_nomask"): {"V_GA_OxygenTank_Rgr"};
        default {""};
    };
    if (_newVest == "") exitWith {};

    if (_newVest in MASKVESTS) then {
        [true] call grad_rebreatherOnLand_fnc_maskEffect;
    } else {
        [false] call grad_rebreatherOnLand_fnc_maskEffect;
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


_action = ["GRAD_rebreatherOnLand_MaskTakeOff", "Take off oxygen mask", "", _swap, {vest (_this select 0) in ["V_GA_OxygenTank_Blk","V_GA_OxygenTank_Oli","V_GA_OxygenTank_Rgr"]}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;

_action = ["GRAD_rebreatherOnLand_MaskTakeOff", "Put on oxygen mask", "", _swap, {vest (_this select 0) in ["V_GA_OxygenTank_Blk_nomask","V_GA_OxygenTank_Oli_nomask","V_GA_OxygenTank_Rgr_nomask"]}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;

grad_rebreatherOnLand_maskEffect = false;
if (vest player in MASKVESTS) then {
    [true] call grad_rebreatherOnLand_fnc_maskEffect;
};
