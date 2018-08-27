#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

//check wether button was RMB
if !(_button isEqualTo 1) exitWith {};

(findDisplay IDD_MAIN) createDisplay QGVAR(RscDisplayDirectConnectPort);