--load the third table into the neo4j graph db to merge the activities

load csv with headers from 'file:///neuro_providers_activities_2018-11-14.csv' as row
with distinct row.`action_personnel_id_x` as prov_id, row.`action_type_dsc` as status, row.`activity_cat1` as act_cat1, row.`activity_cat2` as act_cat2, row.`activity_cat3` as act_cat3, row.`enc_id_x` as enc_id
match (p:provider {ID:prov_id})
match (e:encounter {ID:enc_id})
merge (p)-[w:works_on {a1:act_cat1, a2:act_cat2, a3:act_cat3, status:status}]->(e)
return w
