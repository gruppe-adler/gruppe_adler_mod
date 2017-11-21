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
                if(_box getVariable [QGVAR(supplyDropInProgress), false]) exitWith {
                    [objNull, "Es ist gerade ein Abwurf mit dieser Box aktiv"] call BIS_fnc_showCuratorFeedbackMessage;
                };

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
                _plane addMPEventHandler ["MPKilled", {
                    params ["_plane"];
                    if(!local _plane) exitWith {};

                    private _box = _plane getVariable [QGVAR(box), objnull];
                    if(isNull _box) exitWith {};
                    _box setVariable [QGVAR(supplyDropInProgress), nil, true];
                }];
                GVAR(supplyPlaneType) = nil;

                _plane setVariable [QGVAR(box), _box, true];
                _plane setVehicleAmmo 0;

                _plane flyInHeight 400;
                private _velocity = velocityModelSpace _vehicle;
                _plane setPos (_plane modelToWorld [0,0,400]);
                _plane setDir (_plane getRelDir GVAR(supplyBox));

                _plane setVelocityModelSpace _velocity;

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
                _dropWaypoint setWaypointStatements ["true", QUOTE(this call FUNC(moduleSupplyDropSuccess))];
            },
            "Ziel auswählen"
        ] call ace_zeus_fnc_getModuleDestination;
    }];

    _abortButton ctrlAddEventHandler ["MouseButtonClick", {
        GVAR(supplyBox) = nil;
        closeDialog 0;
    }];
};
