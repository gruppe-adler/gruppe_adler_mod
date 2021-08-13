#define COMPONENT rebreatherOnLand

#include "\x\grad_mod\addons\main\script_mod.hpp"
#include "\x\grad_mod\addons\main\script_macros.hpp"

#define MASKLAYER               222
#define ICELAYER                220
#define FOGLAYER                218

#define MASKVESTS               [QGVAR(OxygenTank_Blk),QGVAR(OxygenTank_Oli),QGVAR(OxygenTank_Rgr)]
#define CLOSEDGOGGLES           ["rhs_ess_black","G_Combat","G_Combat_Goggles_tna_F","G_Lowprofile","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_G_tna_F"]
#define GOGGLEHELMETS           ["rhsusf_cvc_green_ess","rhsusf_cvc_ess"]
#define PARACHUTES              ["rhs_d6_Parachute","Steerable_Parachute_F","NonSteerable_Parachute_F"]

#define INTERVAL                0.2
#define DEPRIVATIONTHRESHOLD    85
#define LOCTHRESHOLD            60
#define FOGFADE                 20
#define ICEFADE                 20
