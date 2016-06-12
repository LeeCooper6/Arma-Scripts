// Define arguments.
_unit = _this select 0;
_skillArray = _this select 1;
    _awarenessSkill = _skillArray select 0;
    _weaponSkill = _skillArray select 1;
    _teamworkSkill = _skillArray select 2;

// Set spotting and situational awareness skills.
_unit setSkill ["spotDistance", _awarenessSkill];
_unit setSkill ["spotTime", _awarenessSkill];
// Set aiming and reloading weapon skills.
_unit setSkill ["aimingAccuracy", _weaponSkill];
_unit setSkill ["aimingShake", _weaponSkill];
_unit setSkill ["aimingSpeed", _weaponSkill];
_unit setSkill ["reloadSpeed", _weaponSkill];
// Set communication and morale skills.
_unit setSkill ["commanding", _teamworkSkill];
_unit setSkill ["courage", _teamworkSkill];
_unit allowFleeing (1 - _teamworkSkill); // allowFleeing 1 means the unit flees 100% of the time, so we have to use the inverse of _teamworkSkill.

// Note: Skill levels are not 100% concrete because they are also somehow calculated using the server's difficulty settings as some sort of coefficient.
