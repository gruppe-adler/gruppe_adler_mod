#include "script_component.hpp"
SCRIPT(XEH_postInitServer);

GVAR(versions_server) = + GVAR(versions);
publicVariable QGVAR(versions_server);
