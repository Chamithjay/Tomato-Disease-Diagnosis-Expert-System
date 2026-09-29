% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% TEST CASES
% =========================================================

:- consult('main.pl').


run_tests :-
    nl,
    write('================================================='), nl,
    write('       TOMATO DISEASE EXPERT SYSTEM TESTS'), nl,
    write('================================================='), nl,
    nl,

    test_case(1),
    test_case(2),
    test_case(3),
    test_case(4),
    test_case(5),
    test_case(6),
    test_case(7),
    test_case(8),
    test_case(9),
    test_case(10),

    write('================================================='), nl,
    write('              TESTING COMPLETED'), nl,
    write('================================================='), nl.


% =========================================================
% TEST CASE 1 - EARLY BLIGHT
% =========================================================

test_case(1) :-
    test_result(
        1,
        'Early Blight',
        [dark_patches, concentric_rings],
        [early_blight]
    ).


% =========================================================
% TEST CASE 2 - LATE BLIGHT
% =========================================================

test_case(2) :-
    test_result(
        2,
        'Late Blight',
        [lower_older_leaves, water_soaked_grey_green_spots],
        [late_blight]
    ).


% =========================================================
% TEST CASE 3 - POWDERY MILDEW
% =========================================================

test_case(3) :-
    test_result(
        3,
        'Powdery Mildew',
        [white_powdery_patches_lower_surface],
        [powdery_mildew]
    ).


% =========================================================
% TEST CASE 4 - ANTHRACNOSE
% =========================================================

test_case(4) :-
    test_result(
        4,
        'Anthracnose',
        [apical_bud_dieback, flower_dropping],
        [anthracnose]
    ).


% =========================================================
% TEST CASE 5 - BACTERIAL WILT
% =========================================================

test_case(5) :-
    test_result(
        5,
        'Bacterial Wilt',
        [permanent_wilting, optimum_soil_water_level],
        [bacterial_wilt]
    ).


% =========================================================
% TEST CASE 6 - TARGET SPOT
% =========================================================

test_case(6) :-
    test_result(
        6,
        'Target Spot',
        [
            circular_dark_brown_necrotic_lesions,
            concentric_pattern,
            yellow_halo
        ],
        [target_spot]
    ).


% =========================================================
% TEST CASE 7 - TYLCV
% =========================================================

test_case(7) :-
    test_result(
        7,
        'Tomato Yellow Leaf Curl Virus',
        [upward_leaf_curling, yellow_leaf_margins],
        [tylcv]
    ).


% =========================================================
% TEST CASE 8 - CURLY TOP VIRUS
% =========================================================

test_case(8) :-
    test_result(
        8,
        'Curly Top Virus',
        [
            inward_rolling_leaflets,
            downward_curved_midrib_or_petiole,
            drooping_appearance,
            no_wilting
        ],
        [curly_top_virus]
    ).


% =========================================================
% TEST CASE 9 - TSWV
% =========================================================

test_case(9) :-
    test_result(
        9,
        'Tomato Spotted Wilt Virus',
        [
            bronzing,
            leaf_curling,
            necrotic_leaf_streaks_or_spots
        ],
        [tswv]
    ).


% =========================================================
% TEST CASE 10 - NO MATCH
% =========================================================

test_case(10) :-
    test_result(
        10,
        'No Matching Disease',
        [water_soaked_leaf_areas],
        []
    ).


% =========================================================
% TEST RESULT
% =========================================================

test_result(Number, Name, Symptoms, Expected) :-
    clear_answers,
    store_symptoms(Symptoms),
    backward_diagnosis(Actual),

    nl,
    write('-------------------------------------------------'), nl,
    write('Test Case '),
    write(Number),
    write(': '),
    write(Name),
    nl,
    write('-------------------------------------------------'), nl,

    write('Symptoms: '),
    write(Symptoms),
    nl,

    write('Expected Result: '),
    write(Expected),
    nl,

    write('Actual Result: '),
    write(Actual),
    nl,

    (
        Expected == Actual
        ->
        write('Result: PASS')
        ;
        write('Result: FAIL')
    ),
    nl,
    nl.