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


