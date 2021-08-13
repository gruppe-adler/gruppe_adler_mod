#include "script_component.hpp"

[] call FUNC(createMarkerPreview);

GVAR(selectedMarkers) = nil;
GVAR(previewMarkers) = nil;

onMapSingleClick "";
