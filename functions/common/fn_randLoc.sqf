private ["_pos_last","_found","_post_new","_marker"];

_pos_last = _this select 0;

nodes = [];
nodes set [0,_pos_last];

checks = [];
checks set [0, "Land_HelipadEmpty_F" createVehicleLocal _pos_last];

for "_node" from 1 to ("param_objectives" call BIS_fnc_getParamValue) do {

  _found = 0;
  _pos_new = [];

  while { _found == 0 } do {

    _savePos = 0;
    while { _savePos == 0 } do {

      _savePos = 1;

      if ( _node == 1 ) then {
        _pos_new = [_pos_last, random [900,1000,1200],(((objStart getRelDir objCenter)-40) + random 40)] call BIS_fnc_relPos;
      } else {
        _pos_new = [_pos_last, random [900,1000,1200], random 360 ] call BIS_fnc_relPos;
      };

      {
        if ( (_x distance _pos_new) < 800  ) then { _savePos = 0 };
      } foreach checks;

    };

    if ( [_pos_new] call SL_fnc_checkPos ) then {
      _found = 1;
      nodes set [count nodes, _pos_new];
      checks set [count checks, "Land_HelipadEmpty_F" createVehicleLocal _pos_new];
      _pos_last = _pos_new;
      // _marker = [(format["marker%1",random 999999]),_pos_new,"ICON",[1,1],"TYPE:","mil_dot","COLOR:","ColorGreen","TEXT:", str _node ] call CBA_fnc_createMarker;
    };

  };

};
