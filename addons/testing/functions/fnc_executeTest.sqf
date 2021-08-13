#include "script_component.hpp"

_this spawn {
    GVAR(results) = [];
    [[], _this] call FUNC(executeContext);

    [GVAR(results)] call FUNC(printResults);
};
