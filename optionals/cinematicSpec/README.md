### cinematicSpec

Allows toggling between spectator modes (ACE Spectator, Endgame Spectator) and the old school BI spec cam with 
inertia enabled.

You'll have to bind a key to it, see Addon Settings > Gruppe Adler > cinematic spec 

Right click to return to previous spec mode.

#### caveat

**Users**: If a scenario is *not* designed with this component in mind, it will *not* be able to pull you from spectator mode while you're in cinematicSpec.
If unsure, *do not* use this in a scenario where respawn exists.

**Scenario designers:** to disable spectator mode, call `grad_cinematicSpec_fnc_cancelCinematicSpec` with a callback. Example:

```sqf
[{
    [false] call ace_spectator_fnc_setSpectator;
}] call grad_cinematicSpec_fnc_api_cancelCinematicSpec;
```

Also, at mission start, please call `grad_cinematicSpec_fnc_api_declareCinematicSpecAware`


#### Maintainer(s)

* Fusselwurm
