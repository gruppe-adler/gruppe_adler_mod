#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Collect treatment actions for medical menu from config.
 * Adds dragging actions if it exists.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_collectActions
 *
 * Public: No
 */

GVAR(actions) = [];

{
    private _configName = configName _x;
    private _displayName = getText (_x >> "displayName");
    private _category = getText (_x >> "category");
    private _condition = {true};
    private _statement = compile format [QUOTE([ARR_4(ACE_player, GVAR(target), %1 select GVAR(selectedBodyPart), '%2')] call FUNC(treatment)), ALL_BODY_PARTS, _configName];

	diag_log str _statement;

    GVAR(actions) pushBack [_displayName, _category, _condition, _statement];
} forEach configProperties [configFile >> "ace_medical_treatment_actions", "isClass _x"];
