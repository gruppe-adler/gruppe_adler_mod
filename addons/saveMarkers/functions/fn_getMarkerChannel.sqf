#include "script_component.hpp"

params ["_marker"];

if (_marker find "_USER_DEFINED" != 0) exitWith {0};

(_marker splitString " ") params ["",["_markerData",""]];
(_markerData splitString "/") params ["","",["_markerChannel",0]];

_markerChannel
