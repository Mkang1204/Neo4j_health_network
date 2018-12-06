--create personnel with their categories

load csv with headers from "file:///PROV_NEW_CAT_X_181119_1430.csv" as csv
with distinct csv.`action_personnel_id_x` as prov_ID, csv.`new_cat1` as cat1, csv.`new_cat2` as cat2
create (p:provider {ID: prov_ID, c1: cat1, c2:cat2})
        
--create the collaboration relationship between providers(personnel)
load csv with headers from "file:///neuro_provider_pairs12_SPORS_classified_2018-11-08.csv" as row
with distinct row.`prov1` as prov1_ID, row.`prov2` as prov2_ID,row.`spor_actual` as SPORscore
match (p1:provider {ID: prov1_ID}),(p2:provider {ID: prov2_ID})
merge (p1)-[c:COLLABORATED_WITH {s:SPORscore}]-(p2)
return c      
						
--create new activities between encounters and personnel
load csv with headers from "file:///new_activities.csv" as row
with distinct row.`action_personnel_id_x` as personnel_id, row.`action_type_dsc` as status, row.`activity_cat1` as act_cat1, row.`activity_cat2` as act_cat2, row.`activity_cat3` as act_cat3,
row.`enc_id_x` as enc_id
merge (p:personnel {id:personnel_id, a1:act_cat1, a2:act_cat2, a3:act_cat3,s:status})
merge (e:encounter {id:enc_id})
merge (p)-[w:works_on]-(e)
return w

       
