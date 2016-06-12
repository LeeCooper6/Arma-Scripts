// Define argument variables.
_unit = _this select 0;
_bleedArgs = _this select 1;
	_bleedLowerBound = _bleedArgs select 0;
	_bleedUpperBound = _bleedArgs select 1;
	_bleedTime = _bleedArgs select 2;
	_bleedAmount = (_bleedUpperBound - _bleedLowerBound) / _bleedTime;
_healArgs = _this select 2;
	_healLowerBound = _healArgs select 0;
	_healUpperBound = _healArgs select 1;
	_healTime = _healArgs select 2;
	_healAmount = (_healUpperBound - _healLowerBound) / _healTime;

while {alive _unit} do { // Run system as long as the unit is alive.
	if (alive _unit && (1 - damage _unit) >= _bleedLowerBound && (1 - damage _unit) < _bleedUpperBound) then { // If the unit is alive and between the lower bound (inclusive) and the upper bound (exclusive) for bleeding, bleed a small amount.
		_unit setBleedingRemaining 1;
		_unit setDamage (damage _unit + _bleedAmount);
	};
	if (alive _unit && (1 - damage _unit) >= _healLowerBound && (1 - damage _unit) < _healUpperBound) then { // If the unit is alive and between the lower bound (inclusive) and upper bound (exclusive) for healing, heal a small amount.
		_unit setDamage (damage _unit - _healAmount);
	};
    sleep 1; // Delay between heals/bleeds.
};
