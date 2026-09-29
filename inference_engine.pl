% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% INFERENCE ENGINE
% =========================================================


% =========================================================
% DYNAMIC DATABASE
% =========================================================

:- dynamic known/2.
:- dynamic derived/2.


% =========================================================
% SYMPTOM HANDLING
% =========================================================

has_symptom(Symptom) :-
    known(Symptom, yes).


store_symptoms([]).

store_symptoms([Symptom | Rest]) :-
    assertz(known(Symptom, yes)),
    store_symptoms(Rest).


clear_answers :-
    retractall(known(_, _)),
    retractall(derived(_, _)).


% =========================================================
% BACKWARD CHAINING
% =========================================================

backward_matching_rule(RuleID, Disease) :-
    rule(RuleID, Disease).


backward_diagnosis(Diseases) :-
    findall(
        Disease,
        backward_matching_rule(_, Disease),
        DiseaseList
    ),
    sort(DiseaseList, Diseases).


backward_rules_for_disease(Disease, RuleIDs) :-
    findall(
        RuleID,
        rule(RuleID, Disease),
        RuleIDs
    ).


% =========================================================
% FORWARD CHAINING
% =========================================================

forward_chain :-
    retractall(derived(_, _)),
    forward_step.


forward_step :-
    findall(
        RuleID-Disease,
        (
            rule(RuleID, Disease),
            \+ derived(RuleID, Disease)
        ),
        NewRules
    ),
    apply_forward_rules(NewRules).


apply_forward_rules([]).

apply_forward_rules([RuleID-Disease | Rest]) :-
    assertz(derived(RuleID, Disease)),
    apply_forward_rules(Rest).


forward_diagnosis(Diseases) :-
    forward_chain,

    findall(
        Disease,
        derived(_, Disease),
        DiseaseList
    ),

    sort(DiseaseList, Diseases).


forward_rules_for_disease(Disease, RuleIDs) :-
    forward_chain,

    findall(
        RuleID,
        derived(RuleID, Disease),
        RuleIDs
    ).


% =========================================================
% EXPLANATION FACILITY
% =========================================================

explain_disease(Disease) :-
    write('Disease: '),
    write_disease_name(Disease),
    nl,

    write('Reasoning:'), nl,

    backward_rules_for_disease(Disease, RuleIDs),

    display_rule_explanations(RuleIDs).


display_rule_explanations([]).

display_rule_explanations([RuleID | Rest]) :-
    write('  Rule applied: '),
    write(RuleID),
    nl,

    display_rule_condition(RuleID),

    display_rule_explanations(Rest).


display_rule_condition(RuleID) :-
    rule_condition_text(RuleID, Text),

    write('  '),
    write(Text),
    nl.


% =========================================================
% RULE EXPLANATION TEXT
% =========================================================

rule_condition_text(do01,
    'Seedling death AND root infection -> Damping-off').

rule_condition_text(eb01,
    'Dark patches AND concentric rings -> Early Blight').

rule_condition_text(lb01,
    'Lower/older leaves AND water-soaked grey-green spots -> Late Blight').

rule_condition_text(lb02,
    'Spots darkening AND white fungal growth underneath -> Late Blight').

rule_condition_text(ts01,
    'Circular dark brown necrotic lesions AND concentric pattern AND yellow halo -> Target Spot').

rule_condition_text(ts02,
    'Yellowing leaves AND rapid collapse/death -> Target Spot').

rule_condition_text(ts03,
    'Spots on stem or fruit -> Target Spot').

rule_condition_text(pm01,
    'Light green/bright yellow leaf lesions -> Powdery Mildew').

rule_condition_text(pm02,
    'White powdery patches on lower leaf surface -> Powdery Mildew').

rule_condition_text(pm03,
    'Leaf defoliation -> Powdery Mildew').

rule_condition_text(an01,
    'Apical bud dieback AND flower dropping -> Anthracnose').

rule_condition_text(an02,
    'Black sunken leaf AND stem AND fruit lesions -> Anthracnose').

rule_condition_text(an03,
    'Fruit rot -> Anthracnose').

rule_condition_text(sl01,
    'Water-soaked areas AND circular lesions AND brown/gray centers -> Septoria Leaf Spot').

rule_condition_text(cr01,
    'Collar portion affected -> Collar/Root Rot').

rule_condition_text(cr02,
    'Lower leaves drying -> Collar/Root Rot').

rule_condition_text(cr03,
    'Whole plant drying AND wilting AND death -> Collar/Root Rot').

rule_condition_text(bw01,
    'Permanent wilting AND optimum soil water level -> Bacterial Wilt').

rule_condition_text(bw02,
    'Viscous ooze when cut stem is immersed in water -> Bacterial Wilt').

rule_condition_text(ty01,
    'Upward leaf curling -> TYLCV').

rule_condition_text(ty02,
    'Yellow leaf margins -> TYLCV').

rule_condition_text(ty03,
    'Smaller-than-normal leaves -> TYLCV').

rule_condition_text(ty04,
    'Plant stunting AND flower drop -> TYLCV').

rule_condition_text(ty05,
    'Early infection AND no fruit formation -> TYLCV').

rule_condition_text(ct01,
    'Inward rolling leaflets -> Curly Top Virus').

rule_condition_text(ct02,
    'Downward-curved midrib/petiole AND drooping without wilting -> Curly Top Virus').

rule_condition_text(ct03,
    'Thick/crisp/brittle leaves AND dull green leaves AND purple veins -> Curly Top Virus').

rule_condition_text(tw01,
    'Bronzing AND leaf curling AND necrotic streaks/spots -> TSWV').

rule_condition_text(tw02,
    'Dark brown stem streaks AND growing-tip streaks -> TSWV').

rule_condition_text(tw03,
    'Plant stunting -> TSWV').

rule_condition_text(tw04,
    'Paler red/yellow areas on ripe fruit -> TSWV').

rule_condition_text(tw05,
    'Severe necrosis AND plant death -> TSWV').

rule_condition_text(cm01,
    'Yellow appearance AND bushy growth AND plant stunting -> CMV').

rule_condition_text(cm02,
    'Shoestring-like leaf blades -> CMV').

rule_condition_text(cm03,
    'Leaf mottling -> CMV').