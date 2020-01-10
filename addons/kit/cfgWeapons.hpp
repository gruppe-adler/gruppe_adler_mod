class CfgWeapons
{
	class Uniform_Base;
	//class U_I_G_Story_Protagonist_F;
	
	
	class U_B_CombatUniform_mcam: Uniform_Base
	{
		class ItemInfo;
	};

	class grad_u_combatUniform_usArmy_OCP: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_S: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP, Rolled-up) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_S";
        };
	};

	class grad_u_combatUniform_usArmy_OCP_T: U_B_CombatUniform_mcam
	{
		author = "Synch";
		displayName = "Combat Uniform (OCP, Tee) [US Army]";		
		class ItemInfo: ItemInfo
        {
            uniformClass = "grad_soldier_combatUniform_usArmy_OCP_T";
        };
	};

};
