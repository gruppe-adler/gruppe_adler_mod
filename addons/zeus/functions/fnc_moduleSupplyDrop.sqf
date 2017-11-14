/*
    @Authors
        Christian 'chris5790' Klemm
    @Project
        Gruppe Adler Mod
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _box = attachedTo _logic;

deleteVehicle _logic;

if !(_box isKindOf "ReammoBox_F") exitWith {
    [objNull, "Das Abwurfobjekt muss eine Ammobox sein"] call BIS_fnc_showCuratorFeedbackMessage;
};

if(_box getVariable [QGVAR(supplyDropInProgress), false]) exitWith {
    [objNull, "Es ist gerade ein Abwurf mit dieser Box aktiv"] call BIS_fnc_showCuratorFeedbackMessage;
};

if(!createDialog QGVAR(moduleSupplyDrop)) exitWith {};

GVAR(supplyBox) = _box;

[] spawn {
    disableSerialization;

    private _dialog = findDisplay 3646235;
    private _listbox = _dialog displayCtrl 1500;
    private _confirmButton = _dialog displayCtrl 2400;
    private _abortButton = _dialog displayCtrl 2401;

    {
        private _entry = _listbox lbAdd getText(_x >> "displayName");
        _listbox lbSetData [_entry, configName _x];
        _listbox lbSetPicture [_entry, getText(_x >> "picture")];
    } forEach ("(configName _x) isKindOf 'Plane' && {getNumber(_x >> 'scope') == 2}" configClasses (configFile >> "CfgVehicles"));

    lbSort _listbox;

    _confirmButton ctrlAddEventHandler ["MouseButtonClick", {
        _dialog = findDisplay 3646235;
        _selection = lbCurSel (_dialog displayCtrl 1500);
        if(_selection == -1) exitWith {};

        GVAR(supplyPlaneType) = (_dialog displayCtrl 1500) lbData _selection;
        closeDialog 0;

        [
            GVAR(supplyBox),
            {
                params ["_success", "_box", "_positionAsl"];
                GVAR(supplyBox) = nil;
                if(!_success) exitWith {
                    GVAR(supplyPlaneType) = nil;
                };
                if(isNil {_box} || {isNull _box}) exitWith {};
                _box setVariable [QGVAR(supplyDropInProgress), true, true];

                [objNull, "Abwurf wird gestartet"] call BIS_fnc_showCuratorFeedbackMessage;

                if(local _box) then {
                    _box allowDamage false;
                } else {
                    [_box, false] remoteExecCall ["allowDamage", _box];
                };

                private _plane = createVehicle [
                    GVAR(supplyPlaneType),
                    [
                        (_positionAsl select 0) + 3000,
                        (_positionAsl select 1) + 3000,
                        0
                    ],
                    [],
                    0,
                    "FLY"
                ];
                GVAR(supplyPlaneType) = nil;

                _plane setVariable [QGVAR(box), _box, true];

                _plane flyInHeight 400;
                _plane setPos (_plane modelToWorld [0,0,400]);
                _plane setVehicleAmmo 0;
                _plane setDir (_plane getRelDir GVAR(supplyBox));
                createVehicleCrew _plane;
                (group (driver _plane)) setCombatMode "BLUE";
                (group (driver _plane)) setBehaviour "CARELESS";

                // Create track marker for plane
                private _marker = createMarkerLocal [str _plane, position _plane];
                _marker setMarkerTypeLocal "mil_arrow";
                _marker setMarkerColorLocal "ColorGreen";
                _marker setMarkerTextLocal "Supply";

                [
                    {
                        params ["_args", "_pfHandle"];
                        _args params ["_plane", "_marker"];
                        if(!alive _plane || {isNull _plane}) exitWIth {
                            [_pfHandle] call CBA_fnc_removePerFrameHandler;
                            deleteMarkerLocal _marker;
                        };

                        _marker setMarkerPosLocal (position _plane);
                        _marker setMarkerDirLocal (direction _plane);
                    },
                    0,
                    [_plane, _marker]
                ] call CBA_fnc_addPerFrameHandler;
                private _group = group (driver _plane);

                private _lowerWaypoint = _group addWaypoint [
                    [
                        (_positionAsl select 0) + 1000,
                        (_positionAsl select 1) + 1000,
                        (_positionAsl select 2)
                    ], 0];
                _lowerWaypoint setWaypointType "MOVE";
                _lowerWaypoint setWaypointCompletionRadius 80;
                _lowerWaypoint setWaypointStatements ["true", "
                    (vehicle this) flyInHeight 150;
                "];

                private _dropWaypoint = _group addWaypoint [_positionAsl, 0];
                _dropWaypoint setWaypointType "MOVE";
                _dropWaypoint setWaypointCompletionRadius 80;

                GVAR(dropWaypointSucceeded) = {
                    GVAR(dropWaypointSucceeded) = nil;
                    private _supplyBox = (vehicle _this) getVariable [QGVAR(box), objNull];

                    [objNull, "Abwurf erfolgreich"] call BIS_fnc_showCuratorFeedbackMessage;

                    private _exitWaypoint = (group _this) addWaypoint [[0,0,0], 0];
                    _exitWaypoint setWaypointType "MOVE";
                    _exitWaypoint setWaypointCompletionRadius 500;
                    (vehicle _this) flyInHeight 1000;

                    GVAR(exitWaypointSucceeded) = {
                        GVAR(exitWaypointSucceeded) = nil;

                        private _crew = crew (vehicle _this);
                        deleteVehicle (vehicle _this);

                        {
                            deleteVehicle _x;
                        } forEach _crew;
                    };

                    _exitWaypoint setWaypointStatements ["true", QUOTE(this call GVAR(exitWaypointSucceeded))];

                    private _bbr = boundingBoxReal (vehicle _this);
                    private _p1 = _bbr select 0;
                    private _p2 = _bbr select 1;
                    private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
                    private _dropPos = (vehicle _this) modelToWorld [_maxWidth + 10 ,0,0];

                    private _light = "Chemlight_blue" createVehicle [0,0,0];
                    private _para = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "NONE"];
                    _para setPosASL _dropPos;
                    _supplyBox attachTo [_para, [0,0,0]];
                    _light attachTo [_para, [0,0,0]];

                    [
                        {(getPosATL (_this select 0)) select 2 < 1.5},
                        {
                            params ["_box"];

                            _box setVariable [QGVAR(supplyDropInProgress), nil, true];
                            detach _box;
                            if(local _box) then {
                                _box allowDamage true;
                            } else {
                                [_box, true] remoteExecCall ["allowDamage", _box];
                            };

                            "SmokeShellBlue" createVehicle (position _box);
                        },
                        [_supplyBox]
                    ] call CBA_fnc_waitUntilAndExecute;
                };

                _dropWaypoint setWaypointStatements ["true", QUOTE(this call GVAR(dropWaypointSucceeded))];
            },
            "Ziel auswählen"
        ] call ace_zeus_fnc_getModuleDestination;
    }];

    _abortButton ctrlAddEventHandler ["MouseButtonClick", {
        GVAR(supplyBox) = nil;
        closeDialog 0;
    }];
};
