% =========================================================
% TOMATO PLANT DISEASE EXPERT SYSTEM
% INFERENCE ENGINE
% =========================================================

:- dynamic known/2.


% =========================================================
% CHECK WHETHER A SYMPTOM WAS SELECTED
% =========================================================

has_symptom(Symptom) :-
    known(Symptom, yes).


% =========================================================
% STORE SELECTED SYMPTOMS
% =========================================================

store_symptoms([]).

store_symptoms([Symptom | Rest]) :-
    assertz(known(Symptom, yes)),
    store_symptoms(Rest).


% =========================================================
% CLEAR PREVIOUS SYMPTOMS
% =========================================================

clear_answers :-
    retractall(known(_, _)).


% =========================================================
% FIND RULES THAT MATCH THE SELECTED SYMPTOMS
% =========================================================

matching_rule(RuleID, Disease) :-
    rule(RuleID, Disease).


find_matching_rules(Matches) :-
    findall(
        rule(RuleID, Disease),
        matching_rule(RuleID, Disease),
        AllMatches
    ),
    sort(AllMatches, Matches).


% =========================================================
% DETERMINE POSSIBLE DISEASES
% =========================================================

diagnose(Diseases) :-
    find_matching_rules(Matches),

    findall(
        Disease,
        member(rule(_, Disease), Matches),
        DiseaseList
    ),

    sort(DiseaseList, Diseases).


% =========================================================
% FIND RULES MATCHED FOR A SPECIFIC DISEASE
% =========================================================

rules_for_disease(Disease, RuleIDs) :-
    find_matching_rules(Matches),

    findall(
        RuleID,
        member(rule(RuleID, Disease), Matches),
        RuleIDs
    ).