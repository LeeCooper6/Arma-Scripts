// Define argument.
_unit = _this select 0;

// Disable AI and make it playable.
{_unit disableAI _x} forEach ["Target", "Autotarget", "Move", "Anim", "FSM", "TeamSwitch", "AimingError", "Suppression", "CheckVisible", "Cover", "AutoCombat", "Path"];
setPlayable _unit;
