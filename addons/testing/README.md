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
    * alternatively: an *array of* setup code blocks (basically running the children several times with different setups)
* an array of children
* a cleanup code block

Leaf nodes are marked by having neither children nor cleanup, and in place of the setup code block you put a block with assertions.

Every setup block receives the parent setup's return value as parameter.

Every cleanup block receives its own node's setup return value as parameter.

When running the tests, **every leaf is executed in isolation** - preceded by all its ancestors setups, and succeeded by all its ancestors cleanups.

In the end, the results are pretty-printed to systemChat as well as `rpt`.

#### Usage example

```arma.sqf

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

```

may output:

```
20:32:06 "OK       a rubber boat I crash at extremely high speed > 50km/h does get destroyed"
20:32:06 "OK       a rubber boat I crash at high speed ~ 25km/h does get damaged somewhat"
20:32:06 "OK       a rubber boat I crash at high speed ~ 25km/h is not destroyed"
20:32:06 "OK       a rubber boat I crash at high speed ~ 25km/h does not hurt the occupant"
20:32:06 "OK       a rubber boat I crash at high speed ~ 25km/h and bump again very slightly afterward retains the higher damage from the first bump"
```

which looks a bit like this: https://youtu.be/LLb9savQ4c8
