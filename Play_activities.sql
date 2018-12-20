SELECT * FROM GraphDB.`neuro_providers_activities_2018-11-14`;

select distinct count(case_number_x )
from `GraphDB`.`neuro_providers_activities_2018-11-14`; 

# return # count(case_number_x ) '345840'

select count(* )
from `GraphDB`.`neuro_providers_activities_2018-11-14`;  # count(* )'345840'

select distinct count(action_dt_tm_x)
from `GraphDB`.`neuro_providers_activities_2018-11-14`; # count(* )'345840'

select count(distinct enc_id_x)
from `GraphDB`.`neuro_providers_activities_2018-11-14`; ## count(distinct enc_id_x) '427'

select count(distinct action_personnel_id_x)
from `GraphDB`.`neuro_providers_activities_2018-11-14`; # count(distinct action_personnel_id_x) '521'


create table pairs_cat as (
select distinct * from `GraphDB`.`category_181119_1430` join `GraphDB`.`provider_pairs12_spors_11_08` on action_personnel_id_x = prov1);

create table pairs_cat as (
select distinct * from `GraphDB`.`category_181119_1430` join `GraphDB`.`provider_pairs12_spors_11_08` on action_personnel_id_x = prov1);


-- find new patterns in subset of data - low score ones

SELECT count(*) FROM GraphDB.subset_med_17; -- 87 in total;

-- create table for sub network

CREATE TABLE `subset_med_17` (
  `action_type_dsc` text,
  `activity_cat1` text,
  `activity_cat2` text,
  `activity_cat3` text,
  `code_dsc` text,
  `ich_freq` int,
  `cards_freq` int,
  `QualOrder` text,
  `Sequence` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT enc_id_x, action_personnel_id_x  
FROM GraphDB.`neuro_providers_activities_2018-11-14` join `GraphDB`.`subset_med_17` on 
GraphDB.`neuro_providers_activities_2018-11-14`.activity_cat1 = `GraphDB`.`subset_med_17`.activity_cat1 
and `GraphDB`.`subset_med_17`.activity_cat2  = `GraphDB`.`neuro_providers_activities_2018-11-14`.activity_cat2 
and `GraphDB`.`neuro_providers_activities_2018-11-14`.activity_cat3 = `subset_med_17`.activity_cat3
and `subset_med_17`.ich_freq = `GraphDB`.`neuro_providers_activities_2018-11-14`.ich_freq; -- count is 1653



SELECT count(*)
FROM GraphDB.`neuro_providers_activities_2018-11-14` join `GraphDB`.`subset_med_17` on 
GraphDB.`neuro_providers_activities_2018-11-14`.activity_cat1 = `GraphDB`.`subset_med_17`.activity_cat1 
and `GraphDB`.`subset_med_17`.activity_cat2  = `GraphDB`.`neuro_providers_activities_2018-11-14`.activity_cat2 
and `GraphDB`.`neuro_providers_activities_2018-11-14`.activity_cat3 = `subset_med_17`.activity_cat3
and `subset_med_17`.ich_freq = `GraphDB`.`neuro_providers_activities_2018-11-14`.ich_freq
and `subset_med_17`.cards_freq = `GraphDB`.`neuro_providers_activities_2018-11-14`.cards_freq
and `subset_med_17`.code_dsc = `GraphDB`.`neuro_providers_activities_2018-11-14`.code_dsc
and `subset_med_17`.action_type_dsc = `GraphDB`.`neuro_providers_activities_2018-11-14`.action_type_dsc
and `subset_med_17`.QualOrder = `GraphDB`.`neuro_providers_activities_2018-11-14`.QualOrder
and `subset_med_17`.Sequence = `GraphDB`.`neuro_providers_activities_2018-11-14`.Sequence; -- still count is 1653

-- Based on the query result, I found that there are 1653 activities the providers acted on a certain encounter meet the subset of 'drugs' critieria
-- Next step output the providers and encpunters id and determine the sub-network

select provider_pairs12_spors_11_08.prov1, provider_pairs12_spors_11_08.prov2
from found_subset_id_1218 join provider_pairs12_spors_11_08 on found_subset_id_1218.action_personnel_id_x = provider_pairs12_spors_11_08.prov1; -- doesn't work as lack of provider id info


-- find all the corresponding pairs 
-- select count(*)
select `GraphDB`.`complete_pairs_enc_1219`.enc_id_x, prov1, prov2
from `GraphDB`.`found_subset_id_1218` right join `GraphDB`.`complete_pairs_enc_1219`
on `GraphDB`.`complete_pairs_enc_1219`.enc_id_x = `GraphDB`.`found_subset_id_1218`.enc_id_x 
where `GraphDB`.`found_subset_id_1218`.action_personnel_id_x in (`GraphDB`.`complete_pairs_enc_1219`.`prov1`, `GraphDB`.`complete_pairs_enc_1219`.`prov2`); -- returns more than 50,000 rows

select `GraphDB`.`neuro_providers_activities_2018-11-14`.action_personnel_id_x, `GraphDB`.`found_subset_id_1218`.enc_id_x
-- select distinct count(*)
from `GraphDB`.`neuro_providers_activities_2018-11-14` right join `GraphDB`.`found_subset_id_1218`
on `GraphDB`.`neuro_providers_activities_2018-11-14`.action_personnel_id_x = `GraphDB`.`found_subset_id_1218`.action_personnel_id_x 
where `GraphDB`.`neuro_providers_activities_2018-11-14`.enc_id_x = `GraphDB`.`found_subset_id_1218`.enc_id_x and found_subset_id_1218.activity_cat3 = `neuro_providers_activities_2018-11-14`.activity_cat3;


-- find the complement subset for drugs_subnetwork

-- mysql doesn't support minus 
select `GraphDB`.`neuro_providers_activities_2018-11-14`.enc_id_x, `GraphDB`.`neuro_providers_activities_2018-11-14`.action_personnel_id_x
from `GraphDB`.`neuro_providers_activities_2018-11-14`

MINUS

select `GraphDB`.`neuro_providers_activities_2018-11-14`.enc_id_x, `GraphDB`.`neuro_providers_activities_2018-11-14`.action_personnel_id_x
FROM `GraphDB`.`subset_drugs`;

-- change to not in to find the subset

select `GraphDB`.`neuro_providers_activities_2018-11-14`.enc_id_x, `GraphDB`.`neuro_providers_activities_2018-11-14`.action_personnel_id_x
from `GraphDB`.`neuro_providers_activities_2018-11-14` where (enc_id_x,  action_personnel_id_x) not in 
(select enc_id_x, action_personnel_id_x
FROM `GraphDB`.`subset_drugs`);


SELECT `subset_drugs`.`enc_id_x`,
    `subset_drugs`.`action_personnel_id_x`,
    `subset_drugs`.`cards_freq`,
    `subset_drugs`.`case_number_x`
FROM `GraphDB`.`subset_drugs`;

--  see what the table is like
SELECT * FROM GraphDB.complete_pairs_enc_1219;

-- select the provider pairs according to the provider_encounter pairss
select  `GraphDB`.`complete_pairs_enc_1219`.prov1, `GraphDB`.`complete_pairs_enc_1219`.prov2, `GraphDB`.`complete_pairs_enc_1219`.spor_actual
from `GraphDB`.`complete_pairs_enc_1219` where (enc_id_x,  prov1) not in 
(select enc_id_x, action_personnel_id_x
FROM `GraphDB`.`subset_drugs`);


-- select the provider pairs that are 'abnormal'
select  `GraphDB`.`complete_pairs_enc_1219`.prov1, `GraphDB`.`complete_pairs_enc_1219`.prov2, `GraphDB`.`complete_pairs_enc_1219`.spor_actual
from `GraphDB`.`complete_pairs_enc_1219` where (enc_id_x,  prov1) in 
(select enc_id_x, action_personnel_id_x
FROM `GraphDB`.`subset_drugs`);














