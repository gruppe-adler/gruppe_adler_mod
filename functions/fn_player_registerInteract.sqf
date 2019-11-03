if (!hasInterface) exitWith {};

private _animalConfigs = "true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Animals");
{
    private _interactPoint = ([_x, "actionPoint", [0, 0, 0]] call BIS_fnc_returnConfigEntry);


    // TODO when I make a mod of it: this belongs into the main config
    private _mainAction = [
        "ACE_MainActions",
        "",
        "",
        {},
        {true},
        {[]},
        [],
        _interactPoint
    ] call ace_interact_menu_fnc_createAction;
    // ACE_MainActions

    [
        configName _x,
        0,
        [],
        _mainAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass;

    private _loadAction = [
        "GRAD_animalTransport_loadAction",
        "load on vehicle",
        "", // icon
        { // action
            private _vehicle = [_target] call GRAD_animalTransport_fnc_findSuitableVehicle;
            ["GRAD_animalTransport_vehicle_loadAnimal", [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
        },
        { // condition
            (isNull (attachedTo _target)) &&
            !(isNull ([_target] call GRAD_animalTransport_fnc_findSuitableVehicle))
        },
        { // children
            private _spaces = [_target] call GRAD_animalTransport_fnc_findSuitableVehicles;
            ([_spaces] call CBA_fnc_hashKeys) apply {
                private _vehicle = _x;
                private _vehicleSpaces = [_spaces, _vehicle] call CBA_fnc_hashGet;
                _vehicleAction = [
                    format ["GRAD_animalTransport_loadAction_%1", _forEachIndex], // TODO file bug at jrenslow's plugin: "select#0" confuses parser here
                    format ["load onto %1", _vehicle],
                    "",
                    {
                        params ["_target", "", "_params"];
                        _params params ["_vehicle"];

                        ["GRAD_animalTransport_vehicle_loadAnimal", [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
                    },
                    {true},
                    {[]},
                    [_vehicle]
                ] call ace_interact_menu_fnc_createAction;
                _spaceActions = _vehicleSpaces apply {
                    private _spaceName = configName _x;
                    [
                        format ["GRAD_animalTransport_loadAction_%1_%2", _forEachIndex, _spaceName],
                        _spaceName,
                        "",
                        {
                            params ["_target", "", "_params"];
                            _params params ["_vehicle", "_spaceName"];
                            ["GRAD_animalTransport_vehicle_loadAnimal", [_vehicle, _target, _spaceName], _vehicle] call CBA_fnc_targetEvent;
                        },
                        {true},
                        {[]},
                        [_vehicle, _spaceName]
                    ] call ace_interact_menu_fnc_createAction;
                };
                [
                    _vehicleAction,
                    _spaceActions apply {
                        [
                            _x,
                            [],
                            _target
                        ]
                    },
                    _target
                ]
            };
        },
        [],
        _interactPoint
    ] call ace_interact_menu_fnc_createAction;
    [
        configName _x,
        0,
        ["ACE_MainActions"],
        _loadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass;

} forEach _animalConfigs;


private _vehicleConfigs = "true" configClasses(missionConfigFile >> "GRAD_animalTransport" >> "Vehicles");
{
    private _unloadActionPoint = ([_x, "unloadActionPoint", [0, 0, 0]] call BIS_fnc_returnConfigEntry);
    private _conditions = {
        private _animals = (_target getVariable ["GRAD_animalTransport_animals", ([] call cba_fnc_hashCreate)]);
        ([_animals] call cba_fnc_hashSize) > 0
    };
    private _childActions = {
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
                        ["GRAD_animalTransport_vehicle_unloadAnimal", _params, (attachedTo _params)] call CBA_fnc_targetEvent;
                    },
                    {true},
                    {},
                    _animal
                ] call ace_interact_menu_fnc_createAction);
            } apply {
                [_x, [], _target]
            };
    };
    private _action = {
        [_target] call GRAD_animalTransport_fnc_player_unloadAnimals;
    };
    private _positionedUnloadAction = [
        "GRAD_animalTransport_unloadAction",
        "unload animals",
        "",
        _action,
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
    ] call ace_interact_menu_fnc_addActionToClass;
} forEach _vehicleConfigs;
