#include "script_component.hpp"

params [["_title","ERROR: NO TITLE"],["_text","ERROR: NO TEXT"]];

ISNILS(GVAR(helpRecordsQueue), []);

GVAR(helpRecordsQueue) pushBack [_title,_text];
