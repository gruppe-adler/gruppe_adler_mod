#include "script_component.hpp"

/*
    @Authors
        Christian 'chris5790' Klemm
        Salbei
    @Project
        Gruppe Adler Mod
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _box = attachedTo _logic;

deleteVehicle _logic;

if !(_box isKindOf "ReammoBox_F") exitWith {
    [objNull, localize LSTRING(notAmmoBox)] call BIS_fnc_showCuratorFeedbackMessage;
};

if(_box getVariable [QGVAR(supplyDropInProgress), false]) exitWith {
    [objNull, localize LSTRING(dropActiv)] call BIS_fnc_showCuratorFeedbackMessage;
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
    } forEach ("(configName _x) isKindOf 'Plane' && {getNumber(_x >> 'scope') == 2} && {((getNumber(_x >> 'VehicleTransport' >> 'Carrier' >> 'canBeTransported') == 1) || (getArray(_x >> 'VehicleTransport' >> 'Carrier' >> 'exits') isNotEqualTo []))}" configClasses (configFile >> "CfgVehicles"));

    lbSort _listbox;

    _confirmButton ctrlAddEventHandler ["MouseButtonClick", {
        _dialog = findDisplay 3646235;
        private _selection = lbCurSel (_dialog displayCtrl 1500);
        if(_selection == -1) exitWith {};

        GVAR(supplyPlaneType) = (_dialog displayCtrl 1500) lbData _selection;
        closeDialog 0;

        [
            GVAR(supplyBox),
            {
                params [
                    ["_success", false],
                    ["_box", objNull],
                    ["_positionAsl", [0,0,0]]
                ];

                _box setVariable [QGVAR(dropPos), _positionAsl];

                if(!_success || {isNil {_box}} || {isNull _box}) exitWith {
                    GVAR(supplyPlaneType) = nil;
                };

                [{
                [
                    GVAR(supplyBox),
                    {
                        params [
                            ["_success", false],
                            ["_box", objNull],
                            ["_planeSpawn", [0,0,0]]
                        ];

                        GVAR(supplyBox) = nil;

                        if(!_success || {isNull _box}) exitWith {
                            GVAR(supplyPlaneType) = nil;
                        };

                        if(_box getVariable [QGVAR(supplyDropInProgress), false]) exitWith {
                            [objNull, localize LSTRING(dropActiv)] call BIS_fnc_showCuratorFeedbackMessage;
                        };

                        _box setVariable [QGVAR(supplyDropInProgress), true, true];

                        [objNull, localize LSTRING(dropStarting)] call BIS_fnc_showCuratorFeedbackMessage;

                        if(local _box) then {
                            _box allowDamage false;
                        } else {
                            [_box, false] remoteExecCall ["allowDamage", _box];
                        };

                        private _positionAsl = _box getVariable [QGVAR(dropPos), [0,0,0]];
                        if ((_positionASL distance2D _planeSpawn) < 3000) then {
                            _planeSpawn = _positionASL getPos [3500, (_positionAsl getDir _planeSpawn)];
                        };

                        private _plane = createVehicle [
                            GVAR(supplyPlaneType),
                            _planeSpawn,
                            [],
                            0,
                            "FLY"
                        ];

                        GVAR(supplyPlaneType) = nil;

                        _plane addMPEventHandler ["MPKilled", {
                            params [["_plane", objNull]];
                            if(!local _plane) exitWith {};

                            private _box = _plane getVariable [QGVAR(box), objnull];
                            if(isNull _box) exitWith {};
                            _box setVariable [QGVAR(supplyDropInProgress), nil, true];
                        }];

                        _plane setVariable [QGVAR(box), _box, true];
                        _plane setVehicleAmmo 0;
                        _plane flyInHeight 200;
                        _plane setPos (_plane modelToWorld [0,0,200]);
                        _plane setDir (_plane getRelDir _positionAsl);
                        _plane setVelocityModelSpace [0,300,0];

                        createVehicleCrew _plane;

                        private _group = group (driver _plane);
                        _group setCombatMode "BLUE";
                        _group setBehaviour "CARELESS";

                        _plane setVehicleCargo _box;

                        // Create track marker for plane
                        private _marker = createMarkerLocal [str _plane, position _plane];
                        _marker setMarkerTypeLocal "mil_arrow";
                        _marker setMarkerColorLocal "ColorGreen";
                        _marker setMarkerTextLocal "Supply";

                        (getAssignedCuratorLogic player) addCuratorEditableObjects [_plane, true];

                        [
                            {
                                params [
                                    ["_args", []],
                                    ["_pfHandle", -1]
                                ];

                                _args params [
                                    ["_plane", objNull],
                                    ["_marker", ""]
                                ];

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

                        private _middlePoint =  _positionAsl + ((_planeSpawn vectorDiff _positionAsl) vectorMultiply 0.5);
                        _middlePoint set [2, _planeSpawn select 2];

                        private _lowerWaypoint = _group addWaypoint [_middlePoint, 0];
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
                    localize LSTRING(choosePlaneSpawn)
                ] call ace_zeus_fnc_getModuleDestination;
            },[]] call CBA_fnc_execNextFrame;
            },
            localize LSTRING(chooseDropZone)
        ] call ace_zeus_fnc_getModuleDestination;
    }];

    _abortButton ctrlAddEventHandler ["MouseButtonClick", {
        GVAR(supplyBox) = nil;
        closeDialog 0;
    }];
};
