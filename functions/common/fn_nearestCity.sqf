private ["_pos","_loc_city","_loc_village","_loc_capital","_closest","_dist_city","_dist_village","_dist_capital","_tmp_dist","_close_loc","_close_name"];
_pos = _this select 0;

//["NameVillage","NameCity","NameCityCapital"]
_loc_city    = nearestLocation [_pos, "nameCity"];
_loc_village = nearestLocation [_pos, "NameVillage"];
_loc_capital = nearestLocation [_pos, "NameCityCapital"];

_pos_city 		= getPos _loc_city;
_pos_village 	= getPos _loc_village;
_pos_capital	= getPos _loc_capital;

_dist_city		= _pos_city 	distance _pos;
_dist_village	= _pos_village 	distance _pos;
_dist_capital	= _pos_capital 	distance _pos;

_tmp_dist = 9999;

if (_dist_city <= _tmp_dist) then {
  _close_loc = _loc_city;
  _tmp_dist = _dist_city;
};

if (_dist_village <= _tmp_dist) then {
  _close_loc = _loc_village;
  _tmp_dist = _dist_village;
};

if (_dist_capital <= _tmp_dist) then {
  _close_loc = _loc_capital;
};

_closest = [getPos _close_loc,text _close_loc];

_closest;
