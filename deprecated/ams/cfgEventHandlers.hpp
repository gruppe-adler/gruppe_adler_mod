class Extended_PostInit_EventHandlers {
    class ADDON {
        init = "['wil_ace_cpr_fnc_treatmentAdvanced_CPRLocal', wil_ace_cpr_fnc_treatmentAdvanced_CPRLocal] call CBA_fnc_addEventHandler;";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
    };
};
