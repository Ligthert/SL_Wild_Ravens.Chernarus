_locs = nearestLocations [getpos player, ["NameVillage","NameCity","NameCityCapital","Hill"], 300];

diag_log count _locs;

{
  //diag_log _x;
  //diag_log name _x
  //diag_log getText( configfile >> "CfgWorlds" >> worldName >> "Names" >> _x >> "name" );

  diag_log "========";
  diag_log (text _x);
  diag_log (size _x);
  diag_log (type _x);
  diag_log (locationPosition  _x);
  diag_log "========";

} forEach _locs;

// configfile >> "CfgWorlds" >> "Chernarus" >> "Names" >> "city_Chernogorsk"
