if !(local _this) exitWith {};

if ( missionNamespace getVariable ["ace_common", false] ) then {
  execVM "loadout\ace3\at.sqf";
} else {
  execVM "loadout\vanilla\at.sqf";
};
