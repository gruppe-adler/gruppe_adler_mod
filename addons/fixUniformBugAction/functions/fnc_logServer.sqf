params ["_unit", "_log"];

diag_log "UNIFORM BUG LOG: ";
diag_log "============================================================================";

{
    diag_log _x;
}forEach _log;

diag_log format ["Serverside Player: %1, Uniform: %2, UniformContainer: %3", _unit, uniform _unit, uniformContainer _unit];

diag_log "============================================================================";
diag_log "ENDE";
diag_log "============================================================================";
