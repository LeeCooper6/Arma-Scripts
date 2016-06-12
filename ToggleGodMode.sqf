// Define argument.
_unit = _this select 0;

if (!captive _unit) then { // If unit is not in god mode...
    // Make the unit invincible, make them friendly to all AI, disable their recoil, and disable their fatigue/stamina.
    _unit allowDamage false;
    _unit setCaptive true;
    _unit setUnitRecoilCoefficient 0;
    _unit enableFatigue false;
    _unit enableStamina false;
} else { // If unit is already in god mode...
    // Make the unit vincible, make them unfriendly to enemy AI, enable their recoil, and enable their fatigue/stamina.
    _unit allowDamage true;
    _unit setCaptive false;
    _unit setUnitRecoilCoefficient 1;
    _unit enableFatigue true;
    _unit enableStamina true;
};
