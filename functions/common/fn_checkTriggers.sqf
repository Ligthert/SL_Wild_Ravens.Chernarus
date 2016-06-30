private ["_retval","_activated"];

_retval = 0;
_activated = 0;

{
    if (triggerActivated _x) then {
      _activated = _activated + 1;
    };
} forEach tasks;

if (count tasks == _activated) then {
  _retval = 1;
};

_retval;
