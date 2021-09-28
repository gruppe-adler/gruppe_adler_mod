class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class GRAD_houseLightSwitch_fusebox {
					displayName = "Locate fuse box";
					condition = QUOTE(call FUNC(condition_fusebox));
					exceptions[] = {};
					statement = QUOTE(call FUNC(action_fusebox));
					icon = "\x\grad\addons\houseLightSwitch\ui\bulb-question.paa";
				};
			};
		};
	};
};
