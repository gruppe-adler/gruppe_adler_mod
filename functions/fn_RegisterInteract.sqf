if (!hasInterface) exitWith {};

    /*
     * Argument:
     * 0: Action name <STRING>
     * 1: Name of the action shown in the menu <STRING>
     * 2: Icon <STRING>
     * 3: Statement <CODE>
     * 4: Condition <CODE>
     * 5: Insert children code <CODE> (Optional)
     * 6: Action parameters <ANY> (Optional)
     * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
     * 8: Distance <NUMBER> (Optional)
     * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
     * 10: Modifier function <CODE> (Optional)
     */
private _loadAction = [
    "GRAD_animalTransport_loadAction",
    "load on vehicle",
    "", // icon
    {
        !(isNull ([_target] call [_x] call GRAD_animalTransport_fnc_findSuitableVehicle))
    },
    {
        private _vehicle = [_x] call GRAD_animalTransport_fnc_findSuitableVehicle;

        // CBA_ event to owner of vic
         ["GRAD_animalTransport_loadAnimal", [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
    }
] call ace_interact_menu_fnc_createAction;

{
    [
        _x,
        0,
        "",
        _loadAction,
        true
    ]
} forEach ["Sheep_random_F", "Goat_random_F", "Alsatian_Random_F", "Fin_random_F"];

private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
private _action = ["grad_fortifications_mainBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa", {
    [grad_fortifications_fnc_loadFortDialog,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame
},{
    params ["","_unit"];
    isNull (objectParent _unit) &&
    {count ((_unit getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0} &&
    {!(_unit getVariable ["grad_fortifications_isPlacing", false])}
}] call ace_interact_menu_fnc_createAction;

["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;
