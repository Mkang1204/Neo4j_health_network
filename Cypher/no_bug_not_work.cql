--load the third table into the neo4j graph db to merge the activities

load csv with headers from 'file:///neuro_providers_activities_2018-11-14.csv' as row
with distinct row.`action_personnel_id_x` as prov_id, row.`action_type_dsc` as status, row.`activity_cat1` as act_cat1, row.`activity_cat2` as act_cat2, row.`activity_cat3` as act_cat3, row.`enc_id_x` as enc_id
match (p:provider {ID:prov_id})
match (e:encounter {ID:enc_id})
merge (p)-[w:works_on {a1:act_cat1, a2:act_cat2, a3:act_cat3, status:status}]->(e)
return w
           
-- load activities table 
load csv with headers from "file:///neuro_providers_activities_18-12-12.csv" as row
with distinct row.`enc_id_x` as enc_ID, row.`action_personnel_id` as prov_ID, row.`activity_cat1` as act1, row.`activity_cat2` as act2, row.`activity_cat3` as act3, row.`activity_type` as type
match (p:provider {ID: prov_ID})
match (e:encounter {ID: enc_ID})
merge (p)-[w:worked_on {a1:act1, a2:act2, a3:act3, a_t:type}]->(e)
return w
