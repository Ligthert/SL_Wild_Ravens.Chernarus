if (!isServer) exitWith {};

private ["_ammobox","_weapons","_magazines","_items"];
_ammobox = _this select 0;

clearWeaponCargoGlobal _ammobox;
clearMagazineCargoGlobal _ammobox;
clearItemCargoGlobal _ammobox;
clearBackpackCargoGlobal _ammobox;


if ( missionNamespace getVariable ["ace_common", false] ) then {

  _weapons = [["launch_NLAW_F",5]];
  _magazines = [["ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim",48],["ACE_20Rnd_762x51_Mag_Tracer_Dim",12],["HandGrenade",24],["SmokeShell",12],["DemoCharge_Remote_Mag",12]];
  _items = [["ACE_fieldDressing",32],["ACE_morphine",16],["ACE_epinephrine",8],["ACE_bloodIV",4]];

} else {
  _weapons = [["launch_NLAW_F",5]];
  _magazines = [["NLAW_F",10],["30Rnd_65x39_caseless_mag",48],["20Rnd_762x51_Mag",12],["HandGrenade",24],["SmokeShell",12],["DemoCharge_Remote_Mag",12]];
  _items = [["FirstAidKit",16]];
};

{ _ammobox addWeaponCargoGlobal [_x select 0, _x select 1]; } forEach _weapons;
{ _ammobox addMagazineCargoGlobal [_x select 0, _x select 1]; } forEach _magazines;
{ _ammobox addItemCargoGlobal [_x select 0, _x select 1]; } forEach _items;
