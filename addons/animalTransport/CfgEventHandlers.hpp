class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
        clientInit = QUOTE(call COMPILE_FILE(XEH_postClientInit));
    };
};


class Extended_Init_EventHandlers {
    class Sheep_random_F {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };
    class Goat_Base_F {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };
    class Dog_Base_F {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };    
    class Fowl_Base_F {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };
    class Rabbit_F {
        class ADDON {
            init = QUOTE(_this call ace_dragging_fnc_initObject);
        };
    };
};
