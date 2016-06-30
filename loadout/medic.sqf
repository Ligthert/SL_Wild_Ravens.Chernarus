if !(local _this) exitWith {};

if ( missionNamespace getVariable ["ace_common", false] ) then {
  execVM "loadout\ace3\medic.sqf";
} else {
  execVM "loadout\vanilla\medic.sqf";
};
