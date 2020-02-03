### testing

Unit testing framework

#### Maintainer(s)

* Fusselwurm

#### Description

**Automate script testing.**

*If you're familiar with behavior-driven testing frameworks like Javascript's Jasmine, this one will feel familiar.*

Testing falls roughly into these stages:
* setup: place entities, set global variables etc
* test execution: trigger the thing you want to test                                 
* assertion: see that the thing happened you wanted to happen
* cleanup: remove everything and reset variables

Often, your setup varies slightly across different tests as your code branches out, and you want to test every branch.

To reflect this, with this framework you declare a tree of setups, with the actual test execution as the leave nodes.

Every branch consists of these elements:
* a description
* a setup code block
* an array of children
* a cleanup code block

Leaf nodes are marked by having neither children nor cleanup, and in place of the setup code block you put a block with assertions.

Every setup block receives the parent setup's return value as parameter.

Every cleanup block receives its own node's setup return value as parameter.

When running the tests, **every leaf is executed in isolation** - preceded by all its ancestors setups, and succeeded by all its ancestors cleanups.

In the end, the results are pretty-printed.

#### Usage example

```arma.sqf

["a boat",
    {
        if (worldName != "VR") then {
            throw "needs to run in VR!";
        };
        private _boat = "O_Boat_Transport_01_F" createVehicle [7496, 7540, 0.1];
        createVehicleCrew _boat;
        private _tree = createSimpleObject ["Tree_Fraxinus", [7505, 7531, 0]];
        _boat setDir 135;
        [_boat, _tree]
    },
    [
        ["I crash at high speed",
            {
                params [["_boat", objNull]];
                _boat setVelocityModelSpace  [0, 10, 0];
                sleep 2;
                [_boat]
            },
            [
                ["does get damaged",
                    {
                        params [["_boat", objNull]];
                        [damage _boat, 0] call grad_testing_fnc_assertGreaterThan;
                    }
                ],
                ["does not hurt the occupant",
                    {
                        params [["_boat", objNull]];
                        [0, damage (driver _boat)] call grad_testing_fnc_assertEquals;
                    }
                ],
                ["drives on",
                    {
                        params [["_boat", objNull]];
                        [speed _boat, 3] call grad_testing_fnc_assertGreaterThan;
                    }
                ]
            ]
        ],
        ["I bump at low speed",
            {
                params [["_boat", objNull]];
                _boat setVelocityModelSpace  [0, 3, 0];
                sleep 5;
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
                ],
                ["comes to a stop",
                    {
                        params [["_boat", objNull]];
                        [abs speed _boat, 0.5] call grad_testing_fnc_assertLessThan;
                    }
                ]
            ]
        ]
    ],
    {
        params [["_boat", objNull], ["_tree", objNull]];
        { deleteVehicle _x } forEach (crew _boat);
        deleteVehicle _boat;
        deleteVehicle _tree;
    }
] call grad_testing_fnc_executeTest;

```

which looks like this: https://youtu.be/LLb9savQ4c8
