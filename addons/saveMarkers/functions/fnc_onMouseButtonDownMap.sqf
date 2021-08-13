#include "script_component.hpp"

params ["_mapCtrl","_mouseButton","_mouseX","_mouseY"];

// leftclick only
if (_mouseButton != 0) exitWith {};

if (!isNil QGVAR(selectDrawEH)) exitWith {};

GVAR(mouseDragStart) = _mapCtrl ctrlMapScreenToWorld [_mouseX,_mouseY];
GVAR(selectDrawEH) = _mapCtrl ctrlAddEventHandler ["draw",{
    params ["_mapCtrl"];

    (_mapCtrl ctrlMapScreenToWorld getMousePosition) params ["_currentMouseX","_currentMouseY"];
    GVAR(mouseDragStart) params ["_startMouseX","_startMouseY"];

    _halfDeltaX = (_currentMouseX - _startMouseX)/2;
    _halfDeltaY = (_currentMouseY - _startMouseY)/2;

    _mapCtrl drawRectangle [[_startMouseX + _halfDeltaX,_startMouseY + _halfDeltaY],_halfDeltaX,_halfDeltaY,0,[0,0,0,1],""];
}];
