class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class Grad_switchHeadgear {
                    displayName = "Switch Headgear";
                    icon = "";
                    statement = QUOTE([] call FUNC(switchGear));
                    condition = QUOTE();
                };
            };
        };
    };
};
