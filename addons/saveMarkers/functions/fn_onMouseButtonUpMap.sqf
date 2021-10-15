#include "script_component.hpp"

params ["_mapCtrl","_mouseButton","_mouseX","_mouseY","_shiftDown","_ctrlDown","_altDown"];

// leftclick only
if (_mouseButton != 0) exitWith {};

if (isNil QGVAR(selectDrawEH)) exitWith {};

_mapCtrl ctrlRemoveEventHandler ["draw",GVAR(selectDrawEH)];
GVAR(selectDrawEH) = nil;

GVAR(mouseDragStart) params ["_startMouseX","_startMouseY"];
GVAR(mouseDragStart) = nil;
(_mapCtrl ctrlMapScreenToWorld [_mouseX,_mouseY]) params ["_endMouseX","_endMouseY"];

private _halfDeltaX = (_endMouseX - _startMouseX)/2;
private _halfDeltaY = (_endMouseY - _startMouseY)/2;

private _selectedArea = [[_startMouseX + _halfDeltaX,_startMouseY + _halfDeltaY],_halfDeltaX,_halfDeltaY,0,true];
private _selectedMarkers = [_selectedArea,_altDown || _shiftDown] call FUNC(getMarkersInArea);

if (_shiftDown) then {
    GVAR(selectedMarkers) = GVAR(selectedMarkers) - _selectedMarkers;
} else {
    if (_ctrlDown) then {
        GVAR(selectedMarkers) = GVAR(selectedMarkers) + _selectedMarkers;
    } else {
        GVAR(selectedMarkers) = _selectedMarkers;
    };
};

[] call FUNC(updateButtonSave);
[nil,-1] call FUNC(setListSelected);
