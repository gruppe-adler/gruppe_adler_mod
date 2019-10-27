if (!hasInterface) exitWith {};

private _vehicleConfigs = "true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Vehicles");

private _loadAction = [
    "GRAD_animalTransport_loadAction",
    "load on vehicle",
    "", // icon
    {
        private _vehicle = [_target] call GRAD_animalTransport_fnc_findSuitableVehicle;
        ["GRAD_animalTransport_loadAnimal", [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
    },
    {
        (isNull (attachedTo _target)) &&
        !(isNull ([_target] call GRAD_animalTransport_fnc_findSuitableVehicle))
    }
] call ace_interact_menu_fnc_createAction;


private _unloadSingleAction = [
    "GRAD_animalTransport_unloadSingleAction",
    "unload from vehicle",
    "", // icon
    {
        ["GRAD_animalTransport_unloadSingleAnimal", [_target], attachedTo _target] call CBA_fnc_targetEvent;
    },
    {
        private _attachedTo = attachedTo _target;
        if (isNull _attachedTo) exitWith {false};
        [_attachedTo getVariable ["GRAD_animalTransport_animals", []]] call CBA_fnc_isHash
    }
] call ace_interact_menu_fnc_createAction;

{
    [
        _x,
        0,
        [],
        _loadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass
} forEach ["Sheep_random_F", "Goat_random_F", "Alsatian_Random_F", "Fin_random_F"];

{
    private _unloadActionPoint = ([_x, "unloadActionPoint", [0, 0, 0]] call BIS_fnc_returnConfigEntry);
    private _conditions = { // condition
        private _animals = (_target getVariable ["GRAD_animalTransport_animals", ([] call cba_fnc_hashCreate)]);
        ([_animals] call cba_fnc_hashSize) > 0
    };
    private _childActions = { // child actions
        params ["_target"];
        private _animals = (_target getVariable ["GRAD_animalTransport_animals", ([] call cba_fnc_hashCreate)]);
        ([_animals] call CBA_fnc_hashKeys)
            apply {
                private _animal = [_animals, _x] call CBA_fnc_hashGet;
                ([
                    (format ["GRAD_animalTransport_unloadSingleAction_%1", _x]),
                    _x,
                    "", // icon
                    {
                        params ["", "_player", "_params"];
                        ["GRAD_animalTransport_unloadSingleAnimal", _params, (attachedTo _params)] call CBA_fnc_targetEvent;
                    },
                    {true},
                    {},
                    _animal
                ] call ace_interact_menu_fnc_createAction);
            } apply {
                [_x, [], _target]
            };
    };
    private _positionedUnloadAction = [
        "GRAD_animalTransport_unloadAction",
        "unload animals",
        "",
        { // action
            ["GRAD_animalTransport_unloadAnimals", [_target], _target] call CBA_fnc_targetEvent;
        },
        _conditions,
        _childActions,
        [],
        _unloadActionPoint
    ] call ace_interact_menu_fnc_createAction;

    [
        configName _x,
        0,
        [],
        _positionedUnloadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass
} forEach _vehicleConfigs;
