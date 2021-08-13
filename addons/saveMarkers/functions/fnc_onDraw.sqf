#include "script_component.hpp"

params ["_mapCtrl"];

{
    _mapCtrl drawIcon [
        "\A3\ui_f\data\map\diary\icons\diaryAssignTask_ca.paa",
        [0,1,0,1],
        getMarkerPos _x,
        12,
        12,
        0
    ]
} forEach GVAR(selectedMarkers);

{
    _textPos = _mapCtrl ctrlMapScreenToWorld ((_mapCtrl ctrlMapWorldToScreen (getMarkerPos _x)) apply {_x + 0.02});

    _mapCtrl drawIcon [
        "\A3\ui_f\data\map\markers\system\dummy_ca.paa",
        [0,1,0,1],
        _textPos,
        12,
        12,
        0,
        "preview",
        0,
        0.04
    ]
} forEach GVAR(previewMarkers);
