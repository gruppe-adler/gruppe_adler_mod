
class ACE_Medical_Actions
{
     class Advanced
     {
          class GRAD_ALK_legs
          {

               displayName = $STR_GRAD_ALK_ACTION_LEGS;
               displayNameProgress = $STR_ACE_Medical_TreatmentAction;
               category = "advanced";
               treatmentLocations[] = {"All"};
               allowedSelections[] = {"All"};
               allowSelfTreatment = 0;
               requiredMedic = 1;
               treatmentTime = "GRAD_ALK_fnc_treatmentTime";
               treatmentTimeSelfCoef = 1;
               items[] = {"GRAD_ALK"};
               condition = "GRAD_ALK_fnc_condition";
               patientStateCondition = 1;
               callbackSuccess = "GRAD_ALK_fnc_callbackSuccess";
               callbackFailure = "";
               callbackProgress = "";
               itemConsumed = 0;
               animationPatient = "";
               animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
               animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
               animationCaller = "AinvPknlMstpSlayWrflDnon_medicOther";
               animationCallerProne = "AinvPpneMstpSlayW[wpn]Dnon_medicOther";
               animationCallerSelf = "AinvPknlMstpSlayW[wpn]Dnon_medic";
               animationCallerSelfProne = "AinvPpneMstpSlayW[wpn]Dnon_medic";
               litter[] = {{"All", "", {"ACE_MedicalLitter_gloves"}}};
          };

          class GRAD_ALK_arms: GRAD_ALK_legs
          {
               displayName = $STR_GRAD_ALK_ACTION_ARMS;
          };
     };
};
