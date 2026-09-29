% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% USER INTERFACE
% =========================================================


% =========================================================
% START SYSTEM
% =========================================================

start :-
    clear_answers,

    nl,
    write('================================================='), nl,
    write('       TOMATO PLANT DISEASE EXPERT SYSTEM'), nl,
    write('================================================='), nl,
    nl,

    write('Select the symptoms that you observe on the plant.'), nl,
    write('You can select multiple symptoms.'), nl,
    nl,

    display_leaf_symptoms,
    nl,
    display_stem_root_symptoms,
    nl,
    display_fruit_symptoms,
    nl,
    display_whole_plant_symptoms,

    nl,
    write('Enter symptom numbers separated by spaces.'), nl,
    write('Example: 1 2 5'), nl,
    nl,

    write('Your symptoms: '),
    flush_output,
    read_line_to_string(user_input, Input),

    parse_symptoms(Input, Symptoms),

    store_symptoms(Symptoms),

    nl,
    write('Analyzing symptoms...'), nl,

    backward_diagnosis(BackwardDiseases),
    forward_diagnosis(ForwardDiseases),

    display_result(BackwardDiseases),

    display_forward_result(ForwardDiseases),

    display_explanation(BackwardDiseases).


% =========================================================
% LEAF SYMPTOMS
% =========================================================

display_leaf_symptoms :-
    write('-------------------- LEAF SYMPTOMS --------------------'), nl,

    write(' 1. Dark patches on leaves'), nl,
    write(' 2. Concentric rings on lesions'), nl,
    write(' 3. Lower or older leaves affected'), nl,
    write(' 4. Water-soaked grey-green spots'), nl,
    write(' 5. Spots becoming darker'), nl,
    write(' 6. White fungal growth on underside of leaves'), nl,
    write(' 7. Circular dark brown necrotic lesions'), nl,
    write(' 8. Concentric pattern on lesions'), nl,
    write(' 9. Yellow halo around lesions'), nl,
    write('10. Yellowing leaves'), nl,
    write('11. Light green or bright yellow leaf lesions'), nl,
    write('12. White powdery patches on lower leaf surface'), nl,
    write('13. Leaf defoliation'), nl,
    write('14. Black sunken lesions on leaves'), nl,
    write('15. Black sunken lesions on stems'), nl,
    write('16. Black sunken lesions on fruits'), nl,
    write('17. Water-soaked areas on leaves'), nl,
    write('18. Circular leaf lesions'), nl,
    write('19. Brown or gray centers of lesions'), nl,
    write('20. Upward leaf curling'), nl,
    write('21. Yellow leaf margins'), nl,
    write('22. Smaller-than-normal leaves'), nl,
    write('23. Inward rolling of leaflets'), nl,
    write('24. Thick, crisp or brittle leaves'), nl,
    write('25. Dull green leaves'), nl,
    write('26. Purple veins'), nl,
    write('27. Bronzing of leaves'), nl,
    write('28. Leaf curling'), nl,
    write('29. Necrotic leaf streaks or spots'), nl,
    write('30. Yellow appearance'), nl,
    write('31. Shoestring-like leaf blades'), nl,
    write('32. Leaf mottling').


% =========================================================
% STEM AND ROOT SYMPTOMS
% =========================================================

display_stem_root_symptoms :-
    write('---------------- STEM / ROOT SYMPTOMS -----------------'), nl,

    write('33. Root infection'), nl,
    write('34. Collar portion affected'), nl,
    write('35. Lower leaves drying'), nl,
    write('36. Whole plant drying'), nl,
    write('37. Wilting'), nl,
    write('38. Permanent wilting'), nl,
    write('39. Optimum soil water level'), nl,
    write('40. Viscous ooze when cut stem is immersed in water'), nl,
    write('41. Dark brown streaks on stems'), nl,
    write('42. Dark brown streaks on growing tips'), nl,
    write('43. Downward-curved midrib or petiole').


% =========================================================
% FRUIT SYMPTOMS
% =========================================================

display_fruit_symptoms :-
    write('-------------------- FRUIT SYMPTOMS -------------------'), nl,

    write('44. Spots on stem or fruit'), nl,
    write('45. Paler red or yellow areas on ripe fruit'), nl,
    write('46. No fruit formation'), nl,
    write('47. Fruit rot').


% =========================================================
% WHOLE PLANT / OTHER SYMPTOMS
% =========================================================

display_whole_plant_symptoms :-
    write('---------------- WHOLE PLANT SYMPTOMS -----------------'), nl,

    write('48. Seedling death'), nl,
    write('49. Rapid collapse and death'), nl,
    write('50. Plant death'), nl,
    write('51. Apical bud dieback'), nl,
    write('52. Flower dropping'), nl,
    write('53. Plant stunting'), nl,
    write('54. Flower drop'), nl,
    write('55. Early infection'), nl,
    write('56. Drooping appearance'), nl,
    write('57. No wilting'), nl,
    write('58. Bushy growth'), nl,
    write('59. Severe necrosis'), nl,
    write('60. Creamy-white spots on fruit'), nl,
    write('61. Tan or brown centers on fruit spots').


% =========================================================
% CONVERT USER INPUT TO SYMPTOMS
% =========================================================

parse_symptoms(Input, Symptoms) :-
    split_string(Input, " ", " ", NumberStrings),
    maplist(number_string, Numbers, NumberStrings),
    numbers_to_symptoms(Numbers, Symptoms).


numbers_to_symptoms([], []).

numbers_to_symptoms([Number | Rest], [Symptom | Symptoms]) :-
    symptom_number(Number, Symptom),
    numbers_to_symptoms(Rest, Symptoms).


% =========================================================
% SYMPTOM NUMBER MAPPING
% =========================================================

symptom_number(1, dark_patches).
symptom_number(2, concentric_rings).
symptom_number(3, lower_older_leaves).
symptom_number(4, water_soaked_grey_green_spots).
symptom_number(5, spots_darkening).
symptom_number(6, white_fungal_growth_under_leaf).
symptom_number(7, circular_dark_brown_necrotic_lesions).
symptom_number(8, concentric_pattern).
symptom_number(9, yellow_halo).
symptom_number(10, yellowing_leaves).
symptom_number(11, light_green_or_bright_yellow_leaf_lesions).
symptom_number(12, white_powdery_patches_lower_surface).
symptom_number(13, leaf_defoliation).
symptom_number(14, black_sunken_leaf_lesions).
symptom_number(15, black_sunken_stem_lesions).
symptom_number(16, black_sunken_fruit_lesions).
symptom_number(17, water_soaked_leaf_areas).
symptom_number(18, circular_leaf_lesions).
symptom_number(19, brown_or_gray_centers).
symptom_number(20, upward_leaf_curling).
symptom_number(21, yellow_leaf_margins).
symptom_number(22, smaller_than_normal_leaves).
symptom_number(23, inward_rolling_leaflets).
symptom_number(24, thick_crisp_brittle_leaves).
symptom_number(25, dull_green_leaves).
symptom_number(26, purple_veins).
symptom_number(27, bronzing).
symptom_number(28, leaf_curling).
symptom_number(29, necrotic_leaf_streaks_or_spots).
symptom_number(30, yellow_appearance).
symptom_number(31, shoestring_like_leaf_blades).
symptom_number(32, leaf_mottling).

symptom_number(33, root_infection).
symptom_number(34, collar_portion_affected).
symptom_number(35, lower_leaves_drying).
symptom_number(36, whole_plant_drying).
symptom_number(37, wilting).
symptom_number(38, permanent_wilting).
symptom_number(39, optimum_soil_water_level).
symptom_number(40, viscous_ooze_when_stem_immersed).
symptom_number(41, dark_brown_streaks_on_stems).
symptom_number(42, dark_brown_streaks_on_growing_tips).
symptom_number(43, downward_curved_midrib_or_petiole).

symptom_number(44, stem_or_fruit_spots).
symptom_number(45, paler_red_or_yellow_ripe_fruit).
symptom_number(46, no_fruit_formation).
symptom_number(47, fruit_rot).

symptom_number(48, seedling_death).
symptom_number(49, rapid_collapse_and_death).
symptom_number(50, plant_death).
symptom_number(51, apical_bud_dieback).
symptom_number(52, flower_dropping).
symptom_number(53, plant_stunting).
symptom_number(54, flower_drop).
symptom_number(55, early_infection).
symptom_number(56, drooping_appearance).
symptom_number(57, no_wilting).
symptom_number(58, bushy_growth).
symptom_number(59, severe_necrosis).
symptom_number(60, creamy_white_fruit_spots).
symptom_number(61, tan_or_brown_centers).


% =========================================================
% DISPLAY DIAGNOSIS RESULT
% =========================================================

display_result([]) :-
    nl,
    write('================================================='), nl,
    write('              NO MATCHING DISEASE'), nl,
    write('================================================='), nl,
    write('The selected symptoms do not match any of the'), nl,
    write('available disease rules in the knowledge base.'), nl,
    nl.


display_result(Diseases) :-
    Diseases \= [],
    nl,
    write('================================================='), nl,
    write('              POSSIBLE DIAGNOSIS'), nl,
    write('================================================='), nl,
    display_diseases(Diseases),
    nl,
    write('Note: These are possible diagnoses based on the'), nl,
    write('selected symptoms and the available rules.'), nl,
    write('They are not a confirmed laboratory diagnosis.'), nl,
    nl.


% =========================================================
% DISPLAY DISEASE NAMES
% =========================================================

display_diseases([]).

display_diseases([Disease | Rest]) :-
    write(' - '),
    write_disease_name(Disease),
    nl,
    display_diseases(Rest).


write_disease_name(damping_off) :- write('Damping-off').
write_disease_name(early_blight) :- write('Early Blight').
write_disease_name(late_blight) :- write('Late Blight').
write_disease_name(target_spot) :- write('Target Spot').
write_disease_name(powdery_mildew) :- write('Powdery Mildew').
write_disease_name(anthracnose) :- write('Anthracnose').
write_disease_name(septoria_leaf_spot) :- write('Septoria Leaf Spot').
write_disease_name(collar_root_rot) :- write('Collar / Root Rot').
write_disease_name(bacterial_wilt) :- write('Bacterial Wilt').
write_disease_name(tylcv) :- write('Tomato Yellow Leaf Curl Virus (TYLCV)').
write_disease_name(curly_top_virus) :- write('Curly Top Virus').
write_disease_name(tswv) :- write('Tomato Spotted Wilt Virus (TSWV)').
write_disease_name(cmv) :- write('Cucumber Mosaic Virus (CMV)').


% =========================================================
% FORWARD CHAINING RESULT
% =========================================================

display_forward_result([]) :-
    nl,
    write('---------------- FORWARD CHAINING ----------------'), nl,
    write('No disease was derived using forward chaining.'), nl,
    nl.


display_forward_result(Diseases) :-
    Diseases \= [],
    nl,
    write('---------------- FORWARD CHAINING ----------------'), nl,
    write('Derived disease(s):'), nl,
    display_diseases(Diseases),
    nl.


% =========================================================
% EXPLANATION FACILITY
% =========================================================

display_explanation([]) :-
    nl,
    write('------------------- REASONING -------------------'), nl,
    write('No rules were satisfied, so no explanation is available.'), nl,
    nl.


display_explanation(Diseases) :-
    Diseases \= [],
    nl,
    write('------------------- REASONING -------------------'), nl,
    display_explanations(Diseases).


display_explanations([]).

display_explanations([Disease | Rest]) :-
    nl,
    explain_disease(Disease),
    display_explanations(Rest).