#include "script_component.hpp"

params [["_ctrl",controlNull]];

private _text = if ([] call FUNC(isAdminOrZeus)) then {
    LLSTRING(sendBoxTitleAdmin)
} else {
    LLSTRING(sendBoxTitlePlayer)
};

_ctrl ctrlSetText _text
