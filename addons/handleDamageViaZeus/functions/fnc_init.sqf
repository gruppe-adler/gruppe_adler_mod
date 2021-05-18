#include "script_component.hpp"
/*
 * Author: Salbei
 * Help digging trench.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call grad_mod_handleDamageViaZeus_fnc_init
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
deleteVehicle _logic;

//Check if the Dialog is open
if (dialog || {isNull _unit}) exitWith {
    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
    if (!isNull _display) then {closeDialog 0};
};

// Store current target
GVAR(target) = _target;

// Create the menu display
createDialog "ACE_Medical_Menu";
GVAR(lastOpenedOn) = CBA_missionTime;