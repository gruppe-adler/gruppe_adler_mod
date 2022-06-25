#include "\z\ace\addons\medical_gui\script_component.hpp"

#define COMPONENT zeusMedicalMenu
#define COMPONENT_BEAUTIFIED Zeus Medical Menu

#include "\x\grad\addons\main\script_mod.hpp"
#include "\x\grad\addons\main\script_macros.hpp"

#define PATHTOF_SYSZ(var1,var2,var3) \z\var1\SUBPREFIX\var2\var3

#undef PATHTOEF
#undef QPATHTOEF
#define PATHTOEF(var1,var2,var3) PATHTOF_SYSZ(var1,var2,var3)
#define QPATHTOEF(var1,var2,var3) QUOTE(PATHTOEF(var1,var2,var3))

#define EECSTRING(var1,var2,var3) QUOTE(TRIPLES($STR,DOUBLES(var1,var2),var3))
#define EEELSTRING(ace,var1,var2,var3) QUOTE(TRIPLES(STR,DOUBLES(var1,var2),var3))

#define EEGVAR(var1,var2,var3) TRIPLES(var1,var2,var3)
#define QEEGVAR(var1,var2,var3) QUOTE(EEGVAR(var1,var2,var3))

// Returns a text config entry as compiled code or variable from missionNamespace
#define GET_FUNCTION(var,cfg) \
    private var = getText (cfg); \
    if (isNil var) then { \
        var = compile var; \
    } else { \
        var = missionNamespace getVariable var; \
    }

// Returns a number config entry with default value of 0
// If entry is a string, will get the variable from missionNamespace
#define GET_NUMBER_ENTRY(cfg) \
    if (isText (cfg)) then { \
        missionNamespace getVariable [getText (cfg), 0]; \
    } else { \
        getNumber (cfg); \
    }