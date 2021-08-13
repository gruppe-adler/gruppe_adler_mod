# `rebreatherOnLand`
This little addon adds three *Oxygen Tank* vests to the game that look cool for high altitude parachuting.

<img src="http://i.imgur.com/sqRzJfK.png" width="512" />

## Maintainer(s)
* McDiod

## Class Names
These are available in the arsenal/loadout editor:

display name        | class name
--------------------|--------------------
Oxygen Tank (Black) | V_GA_OxygenTank_Blk
Oxygen Tank (Olive) | V_GA_OxygenTank_Oli
Oxygen Tank (Green) | V_GA_OxygenTank_Rgr

These are not available in the arsenal/loadout editor and should only be used in conjunction with the *Extra Functionality*:

display name        | class name
--------------------|--------------------
Oxygen Tank (Black) | V_GA_OxygenTank_Blk_nomask
Oxygen Tank (Olive) | V_GA_OxygenTank_Oli_nomask
Oxygen Tank (Green) | V_GA_OxygenTank_Rgr_nomask


## Extra Functionality
There is some optional functionality that you can unlock by adding this to your init.sqf:

`[] call grad_rebreatherOnLand_fnc_init;`

The init function adds a CBA_perFrameHandler that costs minimal performance. To stop it again, i.e. because your parajump is complete, use:

`[] call grad_rebreatherOnLand_fnc_stop;`

**Take off mask:**  
Take off and put on your mask with ACE-Selfinteraction → Equipment → Take off oxygen mask. The mask will block some of your vision, but save you from oxygen deprivation when jumping from high altitude.

**Simulated oxygen deprivation:**  
Your oxygen levels will start out at 100%. You will gain/lose oxygen based your current height above sea level, the threshold being at 3500m. With your mask on you will gain oxygen at a constant rate, independent of height. When losing oxygen, your field of view will gradually decrease. At 60% and lower you will lose consciousness.

**Fog and ice effects:**  
If you have googles on, they will fog or ice up based on height. Above 7000m some ice will form on your goggles. Above 5500m your goggles will fog up.

**Simulated teary eyes:**  
Your vision will blur based on your speed when jumping without goggles. Only these completely closed goggles will prevent it:  
* "rhs_ess_black"
* "G_Combat"
* "G_Combat_Goggles_tna_F"
* "G_Lowprofile"
* "G_Balaclava_TI_G_blk_F"
* "G_Balaclava_TI_G_tna_F"

Or these helmets that come with goggles:  
* "rhsusf_cvc_green_ess"
* "rhsusf_cvc_ess"
