% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% USER INTERFACE
% =========================================================

start :-
    clear_answers,

    nl,
    write('================================================='), nl,
    write('       TOMATO PLANT DISEASE EXPERT SYSTEM'), nl,
    write('================================================='), nl,
    nl,

    write('Select the symptoms that you observe on the plant.'), nl,
    write('Enter symptom numbers separated by spaces.'), nl,
    write('Example: 1 2 5'), nl,
    nl,

    display_leaf_symptoms,
    nl,

    display_stem_root_symptoms,
    nl,

    display_fruit_symptoms,
    nl,

    display_whole_plant_symptoms,
    nl,

    write('Your symptoms: '),
    flush_output,

    read_line_to_string(user_input, Input),

    parse_symptoms(Input, Symptoms),
    store_symptoms(Symptoms),

    nl,
    write('Analyzing symptoms...'), nl,
    nl,

    diagnose(Diseases),

    display_result(Diseases).


% =========================================================
% LEAF SYMPTOMS
% =========================================================

display_leaf_symptoms :-
    write('------------------- LEAF SYMPTOMS -------------------'), nl,

    write(' 1. Dark patches'), nl,
    write(' 2. Concentric rings'), nl,
    write(' 3. Lower/older leaves affected'), nl,
    write(' 4. Water-soaked grey-green spots'), nl,
    write(' 5. Spots becoming darker'), nl,
    write(' 6. White fungal growth under leaves'), nl,
    write(' 7. Circular dark brown necrotic lesions'), nl,
    write(' 8. Concentric pattern of lesions'), nl,
    write(' 9. Yellow halo around lesions'), nl,
    write('10. Yellowing leaves'), nl,
    write('11. Light green or bright yellow leaf lesions'), nl,
    write('12. White powdery patches on lower leaf surface'), nl,
    write('13. Leaf defoliation'), nl,
    write('14. Black sunken leaf lesions'), nl,
    write('15. Water-soaked leaf areas'), nl,
    write('16. Circular leaf lesions'), nl,
    write('17. Brown or gray centers'), nl,
    write('18. Upward leaf curling'), nl,
    write('19. Yellow leaf margins'), nl,
    write('20. Smaller-than-normal leaves'), nl,
    write('21. Inward rolling leaflets'), nl,
    write('22. Thick, crisp and brittle leaves'), nl,
    write('23. Dull green leaves'), nl,
    write('24. Purple veins'), nl,
    write('25. Bronzing of leaves'), nl,
    write('26. Leaf curling'), nl,
    write('27. Necrotic leaf streaks or spots'), nl,
    write('28. Yellow appearance'), nl,
    write('29. Shoestring-like leaf blades'), nl,
    write('30. Leaf mottling'), nl.


% =========================================================
% STEM / ROOT SYMPTOMS
% =========================================================

display_stem_root_symptoms :-
    write('---------------- STEM / ROOT SYMPTOMS ----------------'), nl,

    write('31. Root infection'), nl,
    write('32. Collar portion affected'), nl,
    write('33. Lower leaves drying'), nl,
    write('34. Whole plant drying'), nl,
    write('35. Wilting'), nl,
    write('36. Permanent wilting'), nl,
    write('37. Optimum soil water level during wilting'), nl,
    write('38. Viscous ooze from cut stem when immersed in water'), nl,
    write('39. Brown leaf edges'), nl,
    write('40. Yellow border around brown leaf edges'), nl,
    write('41. One-sided lower-leaf wilting'), nl,
    write('42. Plant collapse and death'), nl,
    write('43. Brown vascular streaks'), nl,
    write('44. Internal stem discoloration'), nl,
    write('45. Long brown stem cankers'), nl,
    write('46. Dark brown streaks on stems'), nl,
    write('47. Dark brown streaks on growing tips'), nl,
    write('48. Downward-curved midrib or petiole'), nl.


% =========================================================
% FRUIT SYMPTOMS
% =========================================================

display_fruit_symptoms :-
    write('------------------- FRUIT SYMPTOMS -------------------'), nl,

    write('49. Spots on stem or fruit'), nl,
    write('50. Black sunken fruit lesions'), nl,
    write('51. Fruit rot'), nl,
    write('52. Small creamy-white fruit spots'), nl,
    write('53. Tan or brown centers on fruit spots'), nl,
    write('54. Paler red or yellow areas on ripe fruit'), nl,
    write('55. No fruit formation'), nl.


% =========================================================
% WHOLE-PLANT SYMPTOMS
% =========================================================

display_whole_plant_symptoms :-
    write('---------------- WHOLE-PLANT SYMPTOMS ----------------'), nl,

    write('56. Seedling death'), nl,
    write('57. Rapid collapse and death'), nl,
    write('58. Plant death'), nl,
    write('59. Apical bud dieback'), nl,
    write('60. Flower dropping'), nl,
    write('61. Plant stunting'), nl,
    write('62. Flower drop'), nl,
    write('63. Early infection'), nl,
    write('64. Drooping appearance without wilting'), nl,
    write('65. No wilting'), nl,
    write('66. Bushy growth'), nl,
    write('67. Severe necrosis'), nl.


% =========================================================
% CONVERT NUMBERS TO SYMPTOMS
% =========================================================

parse_symptoms(Input, Symptoms) :-
    split_string(Input, " ", " ", NumberStrings),
    maplist(number_string, Numbers, NumberStrings),
    numbers_to_symptoms(Numbers, Symptoms).


numbers_to_symptoms([], []).

numbers_to_symptoms([Number | Rest], [Symptom | OtherSymptoms]) :-
    symptom_by_number(Number, Symptom),
    numbers_to_symptoms(Rest, OtherSymptoms).


% =========================================================
% SYMPTOM NUMBER MAPPING
% =========================================================

symptom_by_number(1, dark_patches).
symptom_by_number(2, concentric_rings).
symptom_by_number(3, lower_older_leaves).
symptom_by_number(4, water_soaked_grey_green_spots).
symptom_by_number(5, spots_darkening).
symptom_by_number(6, white_fungal_growth_under_leaf).
symptom_by_number(7, circular_dark_brown_necrotic_lesions).
symptom_by_number(8, concentric_pattern).
symptom_by_number(9, yellow_halo).
symptom_by_number(10, yellowing_leaves).
symptom_by_number(11, light_green_or_bright_yellow_leaf_lesions).
symptom_by_number(12, white_powdery_patches_lower_surface).
symptom_by_number(13, leaf_defoliation).
symptom_by_number(14, black_sunken_leaf_lesions).
symptom_by_number(15, water_soaked_leaf_areas).
symptom_by_number(16, circular_leaf_lesions).
symptom_by_number(17, brown_or_gray_centers).
symptom_by_number(18, upward_leaf_curling).
symptom_by_number(19, yellow_leaf_margins).
symptom_by_number(20, smaller_than_normal_leaves).
symptom_by_number(21, inward_rolling_leaflets).
symptom_by_number(22, thick_crisp_brittle_leaves).
symptom_by_number(23, dull_green_leaves).
symptom_by_number(24, purple_veins).
symptom_by_number(25, bronzing).
symptom_by_number(26, leaf_curling).
symptom_by_number(27, necrotic_leaf_streaks_or_spots).
symptom_by_number(28, yellow_appearance).
symptom_by_number(29, shoestring_like_leaf_blades).
symptom_by_number(30, leaf_mottling).

symptom_by_number(31, root_infection).
symptom_by_number(32, collar_portion_affected).
symptom_by_number(33, lower_leaves_drying).
symptom_by_number(34, whole_plant_drying).
symptom_by_number(35, wilting).
symptom_by_number(36, permanent_wilting).
symptom_by_number(37, optimum_soil_water_level).
symptom_by_number(38, viscous_ooze_when_stem_immersed).
symptom_by_number(39, brown_leaf_edges).
symptom_by_number(40, yellow_border).
symptom_by_number(41, one_sided_lower_leaf_wilting).
symptom_by_number(42, plant_collapse_and_death).
symptom_by_number(43, brown_vascular_streaks).
symptom_by_number(44, internal_stem_discoloration).
symptom_by_number(45, long_brown_stem_cankers).
symptom_by_number(46, dark_brown_streaks_on_stems).
symptom_by_number(47, dark_brown_streaks_on_growing_tips).
symptom_by_number(48, downward_curved_midrib_or_petiole).

symptom_by_number(49, stem_or_fruit_spots).
symptom_by_number(50, black_sunken_fruit_lesions).
symptom_by_number(51, fruit_rot).
symptom_by_number(52, creamy_white_fruit_spots).
symptom_by_number(53, tan_or_brown_centers).
symptom_by_number(54, paler_red_or_yellow_ripe_fruit).
symptom_by_number(55, no_fruit_formation).

symptom_by_number(56, seedling_death).
symptom_by_number(57, rapid_collapse_and_death).
symptom_by_number(58, plant_death).
symptom_by_number(59, apical_bud_dieback).
symptom_by_number(60, flower_dropping).
symptom_by_number(61, plant_stunting).
symptom_by_number(62, flower_drop).
symptom_by_number(63, early_infection).
symptom_by_number(64, drooping_appearance).
symptom_by_number(65, no_wilting).
symptom_by_number(66, bushy_growth).
symptom_by_number(67, severe_necrosis).


% =========================================================
% DISPLAY RESULTS
% =========================================================

display_result([]) :-
    write('================================================='), nl,
    write('              NO MATCHING DISEASE'), nl,
    write('================================================='), nl,
    nl,
    write('No matching disease was identified based on the'), nl,
    write('symptoms provided.'), nl,
    nl.

display_result(Diseases) :-
    Diseases \= [],
    write('================================================='), nl,
    write('              POSSIBLE DIAGNOSIS'), nl,
    write('================================================='), nl,
    nl,

    display_disease_results(Diseases),

    nl,
    write('The result represents possible diagnoses based'), nl,
    write('on the symptoms entered into the system.'), nl,
    nl.


display_disease_results([]).

display_disease_results([Disease | Rest]) :-
    write('- '),
    write_disease_name(Disease),
    nl,

    rules_for_disease(Disease, RuleIDs),

    write('  Matching rule(s): '),
    write(RuleIDs),
    nl,

    display_disease_results(Rest).


% =========================================================
% DISEASE NAME DISPLAY
% =========================================================

write_disease_name(damping_off) :-
    write('Damping-off').

write_disease_name(early_blight) :-
    write('Early Blight').

write_disease_name(late_blight) :-
    write('Late Blight').

write_disease_name(target_spot) :-
    write('Target Spot').

write_disease_name(powdery_mildew) :-
    write('Powdery Mildew').

write_disease_name(anthracnose) :-
    write('Anthracnose').

write_disease_name(septoria_leaf_spot) :-
    write('Septoria Leaf Spot').

write_disease_name(collar_root_rot) :-
    write('Collar / Root Rot').

write_disease_name(bacterial_wilt) :-
    write('Bacterial Wilt').

write_disease_name(bacterial_canker) :-
    write('Bacterial Canker').

write_disease_name(tylcv) :-
    write('Tomato Yellow Leaf Curl Virus (TYLCV)').

write_disease_name(curly_top_virus) :-
    write('Curly Top Virus').

write_disease_name(tswv) :-
    write('Tomato Spotted Wilt Virus (TSWV)').

write_disease_name(cmv) :-
    write('Cucumber Mosaic Virus (CMV)').