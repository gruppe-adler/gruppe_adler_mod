#include "script_component.hpp"

params [["_title","ERROR: NO TITLE"],["_text","ERROR: NO TEXT"]];

if (isNil QGVAR(helpRecords)) then {
    GVAR(helpRecords) = [];
};

GVAR(helpRecords) pushBack [_title,_text];
