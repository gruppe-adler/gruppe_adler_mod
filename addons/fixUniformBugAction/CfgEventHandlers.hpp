class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PreStart_EventHandlers {
    class CAManBase {
        init = QUOTE(call FUNC(handleJIP));
    };
};
