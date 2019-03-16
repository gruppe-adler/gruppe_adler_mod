#include "script_component.hpp"
#include "..\IDCs.hpp"

// called upon display load
// PARAMS:
// 	0: Display <DISPLAY>

params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
disableSerialization;

private _display = ctrlParent _control;

// (_display displayCtrl IDC_NAME)