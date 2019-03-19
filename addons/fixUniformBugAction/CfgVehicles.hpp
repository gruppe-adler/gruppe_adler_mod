class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(logUniformBug) {
                    displayName = "Log Unifrom Bug";
                    condition = "true";
                    statement = QUOTE([_target] call FUNC(handleUnit));
                    exceptions[] = {};
                    showDisabled = 0;
                    icon = "";
                };
            };
        };
    };
};
