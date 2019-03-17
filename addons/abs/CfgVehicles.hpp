class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_Actions {
			class ACE_Head {
				class FieldDressing;
				class GRAD_ABS_head: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 0] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 0] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};

			class ACE_Torso {
				class FieldDressing;
				class GRAD_ABS_torso: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 1] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 1] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};

			class ACE_ArmRight {
				class FieldDressing;
				class GRAD_ABS_arms: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 2] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 2] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};
			class ACE_ArmLeft {
				class FieldDressing;
				class GRAD_ABS_arms: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 3] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 3] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};

			class ACE_LegRight {
				class FieldDressing;
				class GRAD_ABS_legs: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 4] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 4] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};

			class ACE_LegLeft {
				class FieldDressing;
				class GRAD_ABS_legs: FieldDressing {
					displayName = CSTRING(ABS);
					condition = QUOTE([_target, _player, 5] call FUNC(canUseAbs));
					statement = QUOTE([_target, _player, 5] call FUNC(useAbs));
					exceptions[] = {};
					icon = "";
				};
			};
		};
	};
};
