// faction: OPF_F
opf_f_units = ["O_Soldier_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_Soldier_repair_F","O_Soldier_exp_F","O_Soldier_A_F","O_Soldier_AA_F","O_engineer_F"];
opf_f_officers = ["O_officer_F"];

// faction: OPF_G_F
opf_g_f_units = ["O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F"];
opf_g_f_officers = ["O_G_officer_F"];

// faction: IND_F
ind_f_units = ["I_Soldier_A_F","I_soldier_AR_F","I_medic_F","I_engineer_F","I_soldier_exp_F","I_Soldier_GL_F","I_soldier_M_F","I_soldier_AA_F","I_soldier_AT_F","I_officer_F","I_soldier_repair_F","I_Soldier_F","I_soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F"];
ind_f_officers = ["I_officer_F","I_Story_Colonel_F"];

// faction: IND_G_F
ind_g_f_units = ["I_G_Soldier_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F"];
ind_g_f_officers = ["I_G_officer_F"];


if ("param_enemy_faction" call BIS_fnc_getParamValue == 1) then {
  faction_units = opf_f_units;
  faction_officers = opf_f_officers;
  faction_side = east;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 2) then {
  faction_units = opf_g_f_units;
  faction_officers = opf_g_f_officers;
  faction_side = east;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 3) then {
  faction_units = ind_f_units;
  faction_officers = ind_f_officers;
  faction_side = independent;
};

if ("param_enemy_faction" call BIS_fnc_getParamValue == 4) then {
  faction_units = ind_g_f_units;
  faction_officers = ind_g_f_officers;
  faction_side = independent;
};
