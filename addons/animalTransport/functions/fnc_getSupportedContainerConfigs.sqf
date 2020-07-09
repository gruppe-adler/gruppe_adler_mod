#include "script_component.hpp"

if (isNil QGVAR(supportedContainerConfigs)) then {
    private _configArrays = [configFile, missionConfigFile] apply {
            "(!(configName _x isKindOf 'Animal')) && (!(isNull (_x >> 'GRAD_AnimalTransport')))" configClasses (_x >> "CfgVehicles");
    };

    GVAR(supportedContainerConfigs) = (_configArrays#0 + _configArrays#1);
};

GVAR(supportedContainerConfigs)
