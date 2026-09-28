% =========================================================
% TOMATO PLANT DISEASE DIAGNOSIS EXPERT SYSTEM
% KNOWLEDGE BASE
% =========================================================
%
% Knowledge Source:
%
% HORDI Crop - Tomato
% Horticultural Crops Research and Development Institute
% Department of Agriculture, Sri Lanka
%
% Official Source:
% https://doa.gov.lk/hordi-crop-tomato/
%
% The diseases, causal organisms and symptom information
% represented below are based on the HORDI tomato document.
%
% The Prolog rules are a representation of the documented
% symptom statements.
%
% =========================================================


% =========================================================
% DISEASE INFORMATION
% =========================================================

disease_info(
    damping_off,
    fungal,
    ['Pythium spp.',
     'Phytophthora spp.',
     'Fusarium spp.',
     'Rhizoctonia spp.',
     'Sclerotium spp.',
     'Colletotrichum spp.']
).

disease_info(
    early_blight,
    fungal,
    ['Alternaria solani']
).

disease_info(
    late_blight,
    fungal,
    ['Phytophthora infestans']
).

disease_info(
    target_spot,
    fungal,
    ['Corynespora cassiicola']
).

disease_info(
    powdery_mildew,
    fungal,
    ['Oidium lycopersicum']
).

disease_info(
    anthracnose,
    fungal,
    ['Colletotrichum coccodes']
).

disease_info(
    septoria_leaf_spot,
    fungal,
    ['Septoria lycopersici']
).

disease_info(
    collar_root_rot,
    fungal,
    ['Fusarium spp.',
     'Rhizoctonia spp.',
     'Sclerotium spp.']
).

disease_info(
    bacterial_wilt,
    bacterial,
    ['Ralstonia solanacearum']
).

disease_info(
    bacterial_canker,
    bacterial,
    ['Clavibacter michiganensis subsp. michiganensis']
).

disease_info(
    tylcv,
    viral,
    ['Tomato Yellow Leaf Curl Virus']
).

disease_info(
    curly_top_virus,
    viral,
    ['Curly Top Virus']
).

disease_info(
    tswv,
    viral,
    ['Tomato Spotted Wilt Virus']
).

disease_info(
    cmv,
    viral,
    ['Cucumber Mosaic Virus']
).


% =========================================================
% DIAGNOSTIC RULES
% =========================================================
%
% The rules below represent symptom statements documented
% by HORDI.
%
% =========================================================


% =========================================================
% 1. DAMPING-OFF
% HORDI:
% "Seedling death due to root infection"
% =========================================================

rule(do01, damping_off) :-
    has_symptom(seedling_death),
    has_symptom(root_infection).


% =========================================================
% 2. EARLY BLIGHT
% HORDI:
% "Dark patches with concentric rings on leaves,
%  fruits and stems"
% =========================================================

rule(eb01, early_blight) :-
    has_symptom(dark_patches),
    has_symptom(concentric_rings).


% =========================================================
% 3. LATE BLIGHT
% HORDI:
% "First appear on the lower, older leaves as
%  water-soaked grey-green spots."
% =========================================================

rule(lb01, late_blight) :-
    has_symptom(lower_older_leaves),
    has_symptom(water_soaked_grey_green_spots).


% HORDI:
% "Later spots darken and a white fungal growth
%  forms on underside"
% =========================================================

rule(lb02, late_blight) :-
    has_symptom(spots_darkening),
    has_symptom(white_fungal_growth_under_leaf).


% =========================================================
% 4. TARGET SPOT
% =========================================================
%
% HORDI:
% "Circular, dark brown necrotic lesions in a
%  concentric pattern on leaves and surrounded
%  by a yellow halo and spread to all the leaflets"
% =========================================================

rule(ts01, target_spot) :-
    has_symptom(circular_dark_brown_necrotic_lesions),
    has_symptom(concentric_pattern),
    has_symptom(yellow_halo).


% HORDI:
% "Leaves turn yellow and rapidly collapse and die"
% =========================================================

rule(ts02, target_spot) :-
    has_symptom(yellowing_leaves),
    has_symptom(rapid_collapse_and_death).


% HORDI:
% "Spots also occur on the stem and fruits"
% =========================================================

rule(ts03, target_spot) :-
    has_symptom(stem_or_fruit_spots).


% =========================================================
% 5. POWDERY MILDEW
% =========================================================
%
% HORDI:
% "Light green to bright yellow lesions on the
%  upper surface of the leaf"
% =========================================================

rule(pm01, powdery_mildew) :-
    has_symptom(light_green_or_bright_yellow_leaf_lesions).


% HORDI:
% "Lower surface develop white powdery patches
%  when the fungus sporulation"
% =========================================================

rule(pm02, powdery_mildew) :-
    has_symptom(white_powdery_patches_lower_surface).


% HORDI:
% "Severe infection result in leaf defoliation"
% =========================================================

rule(pm03, powdery_mildew) :-
    has_symptom(leaf_defoliation).


% =========================================================
% 6. ANTHRACNOSE
% =========================================================
%
% HORDI:
% "Die-back from apical buds, Flower dropping"
% =========================================================

rule(an01, anthracnose) :-
    has_symptom(apical_bud_dieback),
    has_symptom(flower_dropping).


% HORDI:
% "Black, sunken leaf, stem and fruit lesions"
% =========================================================

rule(an02, anthracnose) :-
    has_symptom(black_sunken_leaf_lesions),
    has_symptom(black_sunken_stem_lesions),
    has_symptom(black_sunken_fruit_lesions).


% HORDI:
% "Fruit rot"
% =========================================================

rule(an03, anthracnose) :-
    has_symptom(fruit_rot).


% =========================================================
% 7. SEPTORIA LEAF SPOT
% =========================================================
%
% HORDI:
% "Water soaked areas on affected leaves become
%  circular with brown to gray centers."
% =========================================================

rule(sl01, septoria_leaf_spot) :-
    has_symptom(water_soaked_leaf_areas),
    has_symptom(circular_leaf_lesions),
    has_symptom(brown_or_gray_centers).


% =========================================================
% 8. COLLAR ROT / ROOT ROT
% =========================================================
%
% HORDI:
% "The pathogen attacks the collar portion of plant"
% =========================================================

rule(cr01, collar_root_rot) :-
    has_symptom(collar_portion_affected).


% HORDI:
% "The infection leads to the drying of lower leaves"
% =========================================================

rule(cr02, collar_root_rot) :-
    has_symptom(lower_leaves_drying).


% HORDI:
% "eventually the whole plant dries giving a typical
%  symptom of wilting which ultimately leads to its death"
% =========================================================

rule(cr03, collar_root_rot) :-
    has_symptom(whole_plant_drying),
    has_symptom(wilting),
    has_symptom(plant_death).


% =========================================================
% 9. BACTERIAL WILT
% =========================================================
%
% HORDI:
% "Permanent wilting of the plant during optimum
%  water level in the soil"
% =========================================================

rule(bw01, bacterial_wilt) :-
    has_symptom(permanent_wilting),
    has_symptom(optimum_soil_water_level).


% HORDI:
% "Viscous ooze exude at the cut end when immersed
%  in water"
% =========================================================

rule(bw02, bacterial_wilt) :-
    has_symptom(viscous_ooze_when_stem_immersed).


% =========================================================
% 10. BACTERIAL CANKER
% =========================================================
%
% HORDI:
% "Tomato leaves edges turn brown, with a yellow border"
% =========================================================

rule(bc01, bacterial_canker) :-
    has_symptom(brown_leaf_edges),
    has_symptom(yellow_border).


% HORDI:
% "Wilt on lower leaves, often on one side only"
% =========================================================

rule(bc02, bacterial_canker) :-
    has_symptom(one_sided_lower_leaf_wilting).


% HORDI:
% "Entire plant may collapse and die"
% =========================================================

rule(bc03, bacterial_canker) :-
    has_symptom(plant_collapse_and_death).


% HORDI:
% "Brown streaks can be seen in the vascular system
%  when the stem is cut open"
% =========================================================

rule(bc04, bacterial_canker) :-
    has_symptom(brown_vascular_streaks).


% HORDI:
% "Stem splits forming long, brown cankers"
% =========================================================

rule(bc05, bacterial_canker) :-
    has_symptom(long_brown_stem_cankers).


% HORDI:
% "Internal discoloration of stem from bacterial canker"
% =========================================================

rule(bc06, bacterial_canker) :-
    has_symptom(internal_stem_discoloration).


% HORDI:
% "Small, creamy, white spots with tan or brown centers
%  on fruit (bird eye spot)"
% =========================================================

rule(bc07, bacterial_canker) :-
    has_symptom(creamy_white_fruit_spots),
    has_symptom(tan_or_brown_centers).


% =========================================================
% 11. TOMATO YELLOW LEAF CURL VIRUS
% =========================================================
%
% HORDI:
% "Upward curling of leaves"
% =========================================================

rule(ty01, tylcv) :-
    has_symptom(upward_leaf_curling).


% HORDI:
% "Yellow (chlorotic) leaf margins"
% =========================================================

rule(ty02, tylcv) :-
    has_symptom(yellow_leaf_margins).


% HORDI:
% "Smaller leaves than normal"
% =========================================================

rule(ty03, tylcv) :-
    has_symptom(smaller_than_normal_leaves).


% HORDI:
% "Plant stunting and flower drop"
% =========================================================

rule(ty04, tylcv) :-
    has_symptom(plant_stunting),
    has_symptom(flower_drop).


% HORDI:
% "If tomato plants are infected early in their growth,
%  there may be no fruit formed"
% =========================================================

rule(ty05, tylcv) :-
    has_symptom(early_infection),
    has_symptom(no_fruit_formation).


% =========================================================
% 12. CURLY TOP VIRUS
% =========================================================
%
% HORDI:
% "Inward rolling of leaflets along the midrib"
% =========================================================

rule(ct01, curly_top_virus) :-
    has_symptom(inward_rolling_leaflets).


% HORDI:
% "Petiole and midrib frequently curve downwards,
%  giving the leaf a drooping but not wilting appearance"
% =========================================================

rule(ct02, curly_top_virus) :-
    has_symptom(downward_curved_midrib_or_petiole),
    has_symptom(drooping_appearance),
    has_symptom(no_wilting).


% HORDI:
% "Leaves are thick, crisp, brittle and dull green
%  in color with purple veins"
% =========================================================

rule(ct03, curly_top_virus) :-
    has_symptom(thick_crisp_brittle_leaves),
    has_symptom(dull_green_leaves),
    has_symptom(purple_veins).


% =========================================================
% 13. TOMATO SPOTTED WILT VIRUS
% =========================================================
%
% HORDI:
% "Plants show bronzing, curling, necrotic streaks
%  and spots on the leaves"
% =========================================================

rule(tw01, tswv) :-
    has_symptom(bronzing),
    has_symptom(leaf_curling),
    has_symptom(necrotic_leaf_streaks_or_spots).


% HORDI:
% "Dark-brown streaks also appear on leaf petioles,
%  stems and growing tips"
% =========================================================

rule(tw02, tswv) :-
    has_symptom(dark_brown_streaks_on_stems),
    has_symptom(dark_brown_streaks_on_growing_tips).


% HORDI:
% "Plants are small and stunted"
% =========================================================

rule(tw03, tswv) :-
    has_symptom(plant_stunting).


% HORDI:
% "The ripe fruit shows paler red or yellow areas
%  on the skin"
% =========================================================

rule(tw04, tswv) :-
    has_symptom(paler_red_or_yellow_ripe_fruit).


% HORDI:
% "Plants are killed by severe necrosis"
% =========================================================

rule(tw05, tswv) :-
    has_symptom(severe_necrosis),
    has_symptom(plant_death).


% =========================================================
% 14. CUCUMBER MOSAIC VIRUS
% =========================================================
%
% HORDI:
% "Early stages are yellow, bushy and considerably
%  stunted. Later, filiformity or shoestring-like
%  leaf blades"
% =========================================================

rule(cm01, cmv) :-
    has_symptom(yellow_appearance),
    has_symptom(bushy_growth),
    has_symptom(plant_stunting).


% HORDI:
% "Shoestring like leaf blades"
% =========================================================

rule(cm02, cmv) :-
    has_symptom(shoestring_like_leaf_blades).


% HORDI:
% "Leaf mottling"
% =========================================================

rule(cm03, cmv) :-
    has_symptom(leaf_mottling).


% =========================================================
% END OF KNOWLEDGE BASE
% =========================================================