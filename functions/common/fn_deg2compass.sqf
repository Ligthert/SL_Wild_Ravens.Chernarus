private ["_deg","_ret"];

// Our only parameter
_deg = _this select 0;

// Lets reduce this number into something realistich
while { _deg > 360 } do { _deg = _deg - 360; };

// Or increase
while { _deg < 0 } do { _deg = _deg + 360; };

if ( _deg >= 337.5 or  _deg <= 22.49  ) then { _ret = "North"; };
if ( _deg >= 22.5  and _deg <= 67.4) then { _ret = "Northeast"; };
if ( _deg >= 67.5  and _deg <= 112.49 ) then { _ret = "East"; };
if ( _deg >= 112.5 and _deg <= 157.49 ) then { _ret = "Southeast"; };
if ( _deg >= 157.5 and _deg <= 202.49 ) then { _ret = "South"; };
if ( _deg >= 202.5 and _deg <= 247.49 ) then { _ret = "Southwest"; };
if ( _deg >= 247.5 and _deg <= 292.49 ) then { _ret = "West"; };
if ( _deg >= 292.5 and _deg <= 337.49 ) then { _ret = "Northwest"; };

_ret;
