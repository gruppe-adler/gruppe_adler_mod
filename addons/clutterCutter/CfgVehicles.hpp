class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class AFI_CutterAction {
					displayName = "Remove clutter";
					condition = "ACE_player == (vehicle ACE_player)";
					exceptions[] = {};
					statement = "ACE_player playActionNow 'medic'; [4, [], {_obj = createVehicle ['Land_ClutterCutter_medium_F', position ACE_player, [], 0, 'CAN_COLLIDE'];}, {ACE_player playActionNow 'medicstop';}, 'Removing clutter...'] call ace_common_fnc_progressBar";
					icon = "\x\grad\addons\clutterCutter\ui\cutterIcon.paa";
				};
			};
		};
	};
};
