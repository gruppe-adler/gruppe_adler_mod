class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class GRAD_houseLightSwitch_fusebox {
					displayName = CSTRING(locate);
					condition = QUOTE(call FUNC(condition));
					exceptions[] = {};
					statement = QUOTE(call FUNC(actionFusebox));
					icon = QPATHTOF(ui\bulbQuestion.paa);
				};
			};
		};
	};

	class ThingX;
    class Grad_Fuse_Box: ThingX {
        author = "Salbei";
        scope = 1;
        displayName = "Fuse Box";
        model = QPATHTOF(data\fuseBox.p3d);
        mass = 10;
        class AnimationSources
        {
            class fuseBox_open
            {
                source = "user";	// The controller is defined as a user animation.
                animPeriod = 1;		// The animation period used for this controller.
                initPhase = 0;		// Initial phase when object is created.
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                distance = 5;
                condition = "alive _target && {[_player, _target, []] call ace_common_fnc_canInteractWith}";
                class GVAR(open) {
                    selection = "";
                    displayName = CSTRING(open);
                    condition = QUOTE([_target] call FUNC(isClosed));
                    statement = QUOTE([_target] call FUNC(open));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(close) {
                    selection = "";
                    displayName = CSTRING(close);
                    condition = QUOTE([_target] call FUNC(isOpen));
                    statement = QUOTE([_target] call FUNC(close));
                    showDisabled = 0;
                    priority = -1;
                };
                class GVAR(on) {
                    selection = "";
                    displayName = CSTRING(on);
                    condition = QUOTE([_target] call FUNC(conditionOn));
                    statement = QUOTE([_target] call FUNC(lightsOn));
                    showDisabled = 0;
                    priority = -1;
                    icon = QPATHTOF(ui\bulbOn.paa);
                };
                class GVAR(off) {
                    selection = "";
                    displayName = CSTRING(off);
                    condition = QUOTE([_target] call FUNC(conditionOff));
                    statement = QUOTE([_target] call FUNC(lightsOff));
                    showDisabled = 0;
                    priority = -1;
                    icon = QPATHTOF(ui\bulbOff.paa);
                };
            };
        };
    };
};
