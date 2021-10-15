class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_InitPost_EventHandlers  {
    class Rubber_duck_base_F {
        class ADDON {
            init = QUOTE(_this call FUNC(addHandleDamageBoat));
        };
    };
    class Boat_Transport_02_base_F {
        class ADDON {
            init = QUOTE(_this call FUNC(addHandleDamageBoat));
        };
    };
};
