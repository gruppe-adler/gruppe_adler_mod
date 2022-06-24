#include "script_component.hpp"

params ["_title"];

assert(!isNil QGVAR(helpRecords));
GVAR(helpRecords) getOrDefault [_title, diaryRecordNull];