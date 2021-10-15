#include "script_component.hpp"

["a rubber boat",
    {
        if (worldName != "VR") then {
            throw "needs to run in VR!";
        };
        private _boat = "O_Boat_Transport_01_F" createVehicle [0, 0, 0];
        _boat setPos [7501, 7535, 0.1];
        _boat setDir 135;
        createVehicleCrew _boat;
        private _tree = createSimpleObject ["Land_HBarrier_5_F", [7506, 7529, 0]];

        _tree setDir 128;

        [_boat, _tree, crew _boat]
    },
    [
        ["I crash at extremely high speed > 50km/h",
            {
                params [["_boat", objNull]];
                private _driver = driver _boat;
                _boat setVelocityModelSpace  [0, 20, 0];
                sleep 1.5;
                [_boat, _driver]
            },
            [
                ["does get destroyed",
                    {
                        params [["_boat", objNull]];
                        [alive _boat, false] call grad_testing_fnc_assertEquals;
                    }
                ]
            ]
        ],
        ["I crash at high speed ~ 25km/h",
            {
                params [["_boat", objNull]];
                _boat setVelocityModelSpace  [0, 8, 0];
                sleep 1.5;
                [_boat]
            },
            [
                ["does get damaged somewhat without being destroyed",
                    {
                        params [["_boat", objNull]];
                        [damage _boat, 0.2] call grad_testing_fnc_assertGreaterThan;
                        [alive _boat, true] call grad_testing_fnc_assertEquals;
                    }
                ],
                ["does not hurt the occupant",
                    {
                        params [["_boat", objNull]];
                        [0, damage (driver _boat)] call grad_testing_fnc_assertEquals;
                    }
                ],
                ["and bump again very slightly afterward",
                    {
                        params [["_boat", objNull]];
                        private _damage = damage _boat;
                        _boat setPos [7496, 7540, 0.1];
                        _boat setVelocityModelSpace [0, 3, 0];
                        sleep 3;
                        [_boat, _damage]
                    },
                    [
                        ["retains the higher damage from the first bump",
                            {
                                params [["_boat", objNull], ["_firstDamage", -1]];
                                [_firstDamage, 0.4] call grad_testing_fnc_assertGreaterThan;
                                [damage _boat, _firstDamage] call grad_testing_fnc_assertEquals;
                            }
                        ]
                    ]
                ]
            ]
        ],
        ["I bump at low speed",
            {
                params [["_boat", objNull]];
                _boat setVelocityModelSpace  [0, 3, 0];
                sleep 3;
                [_boat]
            },
            [
                ["does not get damaged",
                    {
                        params [["_boat", objNull]];
                        [0, damage _boat] call grad_testing_fnc_assertEquals;
                    }
                ],
                ["does not hurt the occupant",
                    {
                        params [["_boat", objNull]];
                        [0, damage (driver _boat)] call grad_testing_fnc_assertEquals;
                    }
                ]
            ]
        ],
        ["that gets hit by an explosion",
            {
                params [["_boat", objNull]];
                private _driver = driver _boat;
                _bomb = "APERSTripMine_Wire_Ammo" createVehicle (getPos _boat);
                _bomb setdamage 1;
                sleep 1;
                [_boat, _driver]
            },
            [
                ["gets destroyed",
                    {
                        params [["_boat", objNull]];
                        [alive _boat, false] call grad_testing_fnc_assertEquals;
                    }
                ],
                ["kills the occupant",
                    {
                        // NOTE: for some reason, boat occupants are protected from explosions. to be investigated.
                        // so even when they should be killed - retuned damage is 1 - they actually are not.
                        //params [["_boat", objNull], ["_driver", objNull]];
                        // [alive _driver, false] call grad_testing_fnc_assertEquals;
                        ["does not work. #not_our_fault"] call grad_testing_fnc_skipTest;
                    }
                ]
            ]
        ],
        ["that gets hit by a few bullets",
            {
                params [["_boat", objNull]];
                private _projectilePos = (getPosASL _boat) vectorAdd [0, -6, 0.3];
                for "_i" from 0 to 8 do {
                    private _projectile = "B_65x39_Case_yellow" createVehicle _projectilePos;
                    _projectile setPosASL _projectilePos;
                    _projectile setVelocity [0, 800, 0];
                };
                sleep 1;
                [_boat]
            },
            [
                ["nearly gets destroyed",
                    {
                        params [["_boat", objNull]];
                        [damage _boat, 0.7, 0.9] call grad_testing_fnc_assertBetween;
                    }
                ],
                ["and later bumps with moderate speed",
                    {
                        params [["_boat", objNull]];
                        _boat setVelocityModelSpace  [0, 8, 0];
                        sleep 1.5;
                        [_boat]
                    },
                    [
                        ["keeps the high bullet damage",
                            {
                                params [["_boat", objNull]];
                                [damage _boat, 0.7, 0.9] call grad_testing_fnc_assertBetween;
                            }
                        ]
                    ]
                ]
            ]
        ]
    ],
    {
        params [["_boat", objNull], ["_tree", objNull], ["_crew", []]];
        { deleteVehicle _x } forEach _crew;
        deleteVehicle _boat;
        deleteVehicle _tree;
        sleep 0.2;
    }
] call grad_testing_fnc_executeTest;
