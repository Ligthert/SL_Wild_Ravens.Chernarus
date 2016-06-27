private ["_objects","_dmg","_cunt","_retval"];

_objects = _this select 0;
_dmg	 = _this select 1;

_cunt = 0;


{
  if ( getDammage _x >= _dmg ) then { _cunt = _cunt + 1; };
} foreach _objects;


if ( _cunt == count _objects ) then {
  _retval = 1;
} else {
  _retval = 0;
};

_retval;
