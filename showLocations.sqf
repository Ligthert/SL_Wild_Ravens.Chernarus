private ["_randomLoc", "_locationName", "_locationPos", "_locationRadA", "_locationRadB", "_locationType", "_locationAngle", "_locationTypes","_found","_marker"];

_locations = configfile >> "CfgWorlds" >> worldName >> "Names";

{
/*
  _locationName = getText(_x >> "name");
  _locationPos = getArray(_x >> "position");
  _locationRadA = getNumber(_x >> "radiusA");
  _locationRadB = getNumber(_x >> "radiusB");
  _locationType = getText(_x >> "type");
  _locationAngle = getNumber(_x >> "angle");

  _marker = createMarker [format["marker%1",random 9999], _locationPos];
  _marker setMarkerColor "ColorRed";
  _marker setMarkerShape "mil_dot";
  _marker setMarkerText (format["Name: %1 | RadiusA: %2 | RadiusB: %3 | Type: %4 | Angle: %5",_locationName,_locationRadA,_locationRadB,_locationType,_locationAngle]);
*/

} forEach _locations;
