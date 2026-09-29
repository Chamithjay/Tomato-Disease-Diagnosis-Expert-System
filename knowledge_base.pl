% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% KNOWLEDGE BASE
% =========================================================
%
% Main knowledge source:
% Department of Agriculture Sri Lanka
% HORDI Crop - Tomato
%
% https://doa.gov.lk/hordi-crop-tomato/
%
% The rules below represent symptom relationships
% documented in the above source.
% =========================================================


% =========================================================
% DISEASE INFORMATION
% =========================================================

disease_info(damping_off, fungal,
    ['Pythium spp.', 'Phytophthora spp.', 'Fusarium spp.',
     'Rhizoctonia spp.', 'Sclerotium spp.', 'Colletotrichum spp.']).

disease_info(early_blight, fungal,
    ['Alternaria solani']).

disease_info(late_blight, fungal,
    ['Phytophthora infestans']).

disease_info(target_spot, fungal,
    ['Corynespora cassiicola']).

disease_info(powdery_mildew, fungal,
    ['Oidium lycopersicum']).

disease_info(anthracnose, fungal,
    ['Colletotrichum coccodes']).

disease_info(septoria_leaf_spot, fungal,
    ['Septoria lycopersici']).

disease_info(collar_root_rot, fungal,
    ['Fusarium spp.', 'Rhizoctonia spp.', 'Sclerotium spp.']).

disease_info(bacterial_wilt, bacterial,
    ['Ralstonia solanacearum']).

disease_info(tylcv, viral,
    ['Tomato Yellow Leaf Curl Virus']).

disease_info(curly_top_virus, viral,
    ['Curly Top Virus']).

disease_info(tswv, viral,
    ['Tomato Spotted Wilt Virus']).

disease_info(cmv, viral,
    ['Cucumber Mosaic Virus']).


% =========================================================
% RULES
% =========================================================

% ---------------- DAMPING-OFF ----------------

rule(do01, damping_off) :-
    has_symptom(seedling_death),
    has_symptom(root_infection).


% ---------------- EARLY BLIGHT ----------------

rule(eb01, early_blight) :-
    has_symptom(dark_patches),
    has_symptom(concentric_rings).


% ---------------- LATE BLIGHT ----------------

rule(lb01, late_blight) :-
    has_symptom(lower_older_leaves),
    has_symptom(water_soaked_grey_green_spots).

rule(lb02, late_blight) :-
    has_symptom(spots_darkening),
    has_symptom(white_fungal_growth_under_leaf).


% ---------------- TARGET SPOT ----------------

rule(ts01, target_spot) :-
    has_symptom(circular_dark_brown_necrotic_lesions),
    has_symptom(concentric_pattern),
    has_symptom(yellow_halo).

rule(ts02, target_spot) :-
    has_symptom(yellowing_leaves),
    has_symptom(rapid_collapse_and_death).

rule(ts03, target_spot) :-
    has_symptom(stem_or_fruit_spots).


% ---------------- POWDERY MILDEW ----------------

rule(pm01, powdery_mildew) :-
    has_symptom(light_green_or_bright_yellow_leaf_lesions).

rule(pm02, powdery_mildew) :-
    has_symptom(white_powdery_patches_lower_surface).

rule(pm03, powdery_mildew) :-
    has_symptom(leaf_defoliation).


% ---------------- ANTHRACNOSE ----------------

rule(an01, anthracnose) :-
    has_symptom(apical_bud_dieback),
    has_symptom(flower_dropping).

rule(an02, anthracnose) :-
    has_symptom(black_sunken_leaf_lesions),
    has_symptom(black_sunken_stem_lesions),
    has_symptom(black_sunken_fruit_lesions).

rule(an03, anthracnose) :-
    has_symptom(fruit_rot).


% ---------------- SEPTORIA LEAF SPOT ----------------

rule(sl01, septoria_leaf_spot) :-
    has_symptom(water_soaked_leaf_areas),
    has_symptom(circular_leaf_lesions),
    has_symptom(brown_or_gray_centers).


% ---------------- COLLAR / ROOT ROT ----------------

rule(cr01, collar_root_rot) :-
    has_symptom(collar_portion_affected).

rule(cr02, collar_root_rot) :-
    has_symptom(lower_leaves_drying).

rule(cr03, collar_root_rot) :-
    has_symptom(whole_plant_drying),
    has_symptom(wilting),
    has_symptom(plant_death).


% ---------------- BACTERIAL WILT ----------------

rule(bw01, bacterial_wilt) :-
    has_symptom(permanent_wilting),
    has_symptom(optimum_soil_water_level).

rule(bw02, bacterial_wilt) :-
    has_symptom(viscous_ooze_when_stem_immersed).


% ---------------- TYLCV ----------------

rule(ty01, tylcv) :-
    has_symptom(upward_leaf_curling).

rule(ty02, tylcv) :-
    has_symptom(yellow_leaf_margins).

rule(ty03, tylcv) :-
    has_symptom(smaller_than_normal_leaves).

rule(ty04, tylcv) :-
    has_symptom(plant_stunting),
    has_symptom(flower_drop).

rule(ty05, tylcv) :-
    has_symptom(early_infection),
    has_symptom(no_fruit_formation).


% ---------------- CURLY TOP VIRUS ----------------

rule(ct01, curly_top_virus) :-
    has_symptom(inward_rolling_leaflets).

rule(ct02, curly_top_virus) :-
    has_symptom(downward_curved_midrib_or_petiole),
    has_symptom(drooping_appearance),
    has_symptom(no_wilting).

rule(ct03, curly_top_virus) :-
    has_symptom(thick_crisp_brittle_leaves),
    has_symptom(dull_green_leaves),
    has_symptom(purple_veins).


% ---------------- TSWV ----------------

rule(tw01, tswv) :-
    has_symptom(bronzing),
    has_symptom(leaf_curling),
    has_symptom(necrotic_leaf_streaks_or_spots).

rule(tw02, tswv) :-
    has_symptom(dark_brown_streaks_on_stems),
    has_symptom(dark_brown_streaks_on_growing_tips).

rule(tw03, tswv) :-
    has_symptom(plant_stunting).

rule(tw04, tswv) :-
    has_symptom(paler_red_or_yellow_ripe_fruit).

rule(tw05, tswv) :-
    has_symptom(severe_necrosis),
    has_symptom(plant_death).


% ---------------- CMV ----------------

rule(cm01, cmv) :-
    has_symptom(yellow_appearance),
    has_symptom(bushy_growth),
    has_symptom(plant_stunting).

rule(cm02, cmv) :-
    has_symptom(shoestring_like_leaf_blades).

rule(cm03, cmv) :-
    has_symptom(leaf_mottling).