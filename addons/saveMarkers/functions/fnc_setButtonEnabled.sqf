#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_idc","_enabled"];

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlButton = _display displayCtrl _idc;

_ctrlButton ctrlEnable _enabled;
