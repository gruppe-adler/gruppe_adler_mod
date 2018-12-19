#include "script_component.hpp"

allMapMarkers select {_x find "_USER_DEFINED" == 0 && {getMarkerType _x != ""}}
