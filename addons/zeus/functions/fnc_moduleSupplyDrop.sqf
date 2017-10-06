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
    [objNull, "Das Ziel muss eine Box sein"] call BIS_fnc_showCuratorFeedbackMessage;
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
    } forEach ("(configName _x) isKindOf 'Plane' && {getNumber(_x >> 'scope') == 2}" configClasses (configFile >> "CfgVehicles"));

    lbSort _listbox;

    _confirmButton ctrlSetEventHandler ["MouseButtonClick", {
        _dialog = findDisplay 3646235;
        _selection = lbCurSel (_dialog displayCtrl 1500);
        if(_selection == -1) exitWith {};

        GVAR(supplyPlaneType) = (_dialog displayCtrl 1500) lbData _selection;
        closeDialog 0;

        [GVAR(supplyBox), {
            params ["_success", "_box", "_positionAsl"];
            if(!_success) exitWith {
                GVAR(supplyPlaneType) = nil;
                GVAR(supplyBox) = nil;
            };
            if(isNil {_box} || {isNull _box}) exitWith {};

            if(local _box) then {
                _box allowDamage false;
            } else {
                [_box, false] remoteExecCall ["allowDamage", _box];
            };

            private _plane = createVehicle [
                GVAR(supplyPlaneType),
                [
                    (_positionAsl select 0) + 400 + ((random 600) - 300),
                    (_positionAsl select 1) + 400 + ((random 600) - 300),
                    0
                ], [], 0, "FLY"];
            _plane setPos (_plane modelToWorld [0,0,400]);
            _plane setVehicleAmmo 0;
            createVehicleCrew _plane;
            _plane flyInHeight 400;

            private _group = group (driver _plane);
            private _dropWaypoint = _group addWaypoint [_positionAsl, 0];
            _dropWaypoint setWaypointType "MOVE";
            _dropWaypoint setWaypointCompletionRadius 50;
            _plane flyInHeight 200;

            _dropWaypoint setWaypointStatements ["true", "
                if(isNull grad_zeus_supplyBox) exitWith {};

                private _currentPosition = getPosASL (vehicle this);
                private _exitWaypoint = (group this) addWaypoint [[0,0,0], 0];
                _exitWaypoint setWaypointType 'MOVE';
                (vehicle this) flyInHeight 1000;
                _exitWaypoint setWaypointStatements ['true', '
                    deleteVehicle (vehicle this);
                    GVAR(supplyPlaneType) = nil;
                    GVAR(supplyBox) = nil;
                '];

                private _light = 'Chemlight_blue' createVehicle [0,0,0];
                private _para = createVehicle ['B_Parachute_02_F', [0,0,0], 0, [], 'FLY'];
                _para setPosASL _currentPosition;
                grad_zeus_supplyBox attachTo [_para, [0,0,-1.3]];
                _light attachTo [_para, [0,0,0]];

                [
                    {(getPosATL grad_zeus_supplyBox) select 2 < 3},
                    {
                        detach grad_zeus_supplyBox;
                        if(local grad_zeus_supplyBox) then {
                            grad_zeus_supplyBox allowDamage true;
                        } else {
                            [grad_zeus_supplyBox, true] remoteExecCall ['allowDamage', grad_zeus_supplyBox];
                        }

                        'SmokeShellPurple' createVehicle (position grad_zeus_supplyBox);
                    }
                ] call CBA_fnc_waitUntilAndExecute;
            "];

        }] call ace_zeus_fnc_getModuleDestination;
    }];

    _abortButton ctrlSetEventHandler ["MouseButtonClick", {
        GVAR(supplyBox) = nil;
    }];
};
