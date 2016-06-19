private ["_found","_houses","_house","_cpos","_range","_bpos"];

_cpos = _this select 0;
_range = _this select 1;

_houses = _cpos nearObjects ["House",_range];
_found = 0;
_cbpos = 0;

while { _found == 0 } do
{
    _house = _houses call BIS_fnc_selectRandom;
  _cbpos = 0;
  for "_x" from 1 to 100 do {
    if (format ["%1",(_house buildingPos _x)] != "[0,0,0]") then {
      _cbpos = _cbpos + 1;
    };

  };

  if (_cbpos > 2) then {
    _found = 1;
  };

};

[_house,_cbpos];
