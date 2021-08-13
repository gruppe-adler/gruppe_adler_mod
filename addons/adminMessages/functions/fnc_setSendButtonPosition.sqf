#include "script_component.hpp"
#include "..\gui\defines.hpp"

params [["_ctrl",controlNull]];

if !([] call FUNC(isAdminOrZeus)) exitWith {};

_ctrl ctrlSetPosition [TITLE_X,SENDBUTTON_Y_2];
_ctrl ctrlCommit 0;
