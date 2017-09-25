class ACE_ArmRight
{
     class FieldDressing;
     class GRAD_ALK_arms: FieldDressing
     {
          displayName = $STR_GRAD_ALK_ACTION_ARMS;
          condition = "[_player,  _target,  'arm_r',  'GRAD_ALK_arms'] call ace_medical_fnc_canTreatCached";
          statement = "[_player,  _target,  'arm_r',  'GRAD_ALK_arms'] call ace_medical_fnc_treatment";
          exceptions[] = {};
          icon = "";
     };
};
class ACE_ArmLeft
{
     class FieldDressing;
     class GRAD_ALK_arms: FieldDressing
     {
          displayName = $STR_GRAD_ALK_ACTION_ARMS;
          condition = "[_player,  _target,  'arm_l',  'GRAD_ALK_arms'] call ace_medical_fnc_canTreatCached";
          statement = "[_player,  _target,  'arm_l',  'GRAD_ALK_arms'] call ace_medical_fnc_treatment";
          exceptions[] = {};
          icon = "";
     };
};

class ACE_LegRight
{
     class FieldDressing;
     class GRAD_ALK_legs: FieldDressing
     {
          displayName = $STR_GRAD_ALK_ACTION_LEGS;
          condition = "[_player,  _target,  'leg_r',  'GRAD_ALK_legs'] call ace_medical_fnc_canTreatCached";
          statement = "[_player,  _target,  'leg_r',  'GRAD_ALK_legs'] call ace_medical_fnc_treatment";
          exceptions[] = {};
          icon = "";
     };
};
class ACE_LegLeft
{
     class FieldDressing;
     class GRAD_ALK_legs: FieldDressing
     {
          displayName = $STR_GRAD_ALK_ACTION_LEGS;
          condition = "[_player,  _target,  'leg_l',  'GRAD_ALK_legs'] call ace_medical_fnc_canTreatCached";
          statement = "[_player,  _target,  'leg_l',  'GRAD_ALK_legs'] call ace_medical_fnc_treatment";
          exceptions[] = {};
          icon = "";
     };
};
