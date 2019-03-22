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
       
--test data - CA population
load csv with headers from "file:///CA_DRU_proj_2010-2060.csv" as csv
with distinct csv.`County Code` as ID, csv.`County Name` as Name, csv.`Age` as age,csv.`Population` as pop
match (c:County {id:ID, name:Name})
match (p:pop)
merge (p)-[r:for_year]-(c)
       
       
-- filter data with high SPOR connections
match p = ()-[c:COLLABORATED_WITH]-()
with avg(c.s) as avg, p
       return p
       where avg > 1.1

-- create nodes 2019-03-21 starting with genomics data
merge (c:cell {name:'AM01'})
return c;
       
match (c:cell {name:'AM01'})
       delete c;
       
-- load in with new  --- not working M;M relationship
       load csv with headers from 'file:///pilot1.csv' as row
with distinct row.`Gene_Symbol` as gene, row.`Pilot_AM01` as AM01,row.`Pilot_AM02` as AM02, row.`Pilot_AM03` as AM03, row.`Pilot_AM04` as AM04, row.`Pilot_AM05` as AM05, row.`Pilot_AM06` as AM06, row.`Pilot_AM07` as AM07, row.`Pilot_AM08` as AM08, row.`Pilot_AM09` as AM09, row.`Pilot_AM10` as AM10
merge (g:gene {name:gene})
merge (c:cell)
merge (c)-[e1:expresses_gene_num {num:AM01}]->(g)
merge (c)-[e2:expresses_gene_num {num:AM02}]->(g)
merge (c)-[e3:expresses_gene_num {num:AM03}]->(g)
merge (c)-[e4:expresses_gene_num {num:AM04}]->(g)
merge (c)-[e5:expresses_gene_num {num:AM05}]->(g)
merge (c)-[e6:expresses_gene_num {num:AM06}]->(g)
merge (c)-[e7:expresses_gene_num {num:AM07}]->(g)
merge (c)-[e8:expresses_gene_num {num:AM08}]->(g)
merge (c)-[e9:expresses_gene_num {num:AM09}]->(g)
merge (c)-[e10:expresses_gene_num {num:AM10}]->(g)
return gene;

	   -- check number is right ot not
match (g:gene) return count(g)	--99
	   
-- load the gene and cell name first -- and then load the nums aas properties using set
	   load csv with headers from 'file:///pilot1.csv' as row
with distinct row.`Gene_Symbol` as gene, row.`Pilot_AM01` as AM01,row.`Pilot_AM02` as AM02, row.`Pilot_AM03` as AM03, row.`Pilot_AM04` as AM04, row.`Pilot_AM05` as AM05, row.`Pilot_AM06` as AM06, row.`Pilot_AM07` as AM07, row.`Pilot_AM08` as AM08, row.`Pilot_AM09` as AM09, row.`Pilot_AM10` as AM10
merge (g:gene {name:gene})
merge (:cell {name:'AM01'})
merge (:cell {name:'AM02'})
merge (:cell {name:'AM03'})
merge (:cell {name:'AM04'})
merge (:cell {name:'AM05'})
merge (:cell {name:'AM06'})
merge (:cell {name:'AM07'})
merge (:cell {name:'AM08'})
merge (:cell {name:'AM09'})
merge (:cell {name:'AM10'})
       -- load in the nums
load csv with headers from 'file:///pilot1.csv' as row
with distinct row.`Gene_Symbol` as gene, row.`Pilot_AM01` as AM01,row.`Pilot_AM02` as AM02, row.`Pilot_AM03` as AM03, row.`Pilot_AM04` as AM04, row.`Pilot_AM05` as AM05, row.`Pilot_AM06` as AM06, row.`Pilot_AM07` as AM07, row.`Pilot_AM08` as AM08, row.`Pilot_AM09` as AM09, row.`Pilot_AM10` as AM10
merge (g:gene {name:gene})
merge (c:cell {name:'AM01'})-[e:EXPRESSES_GENE_NUM]-(g)
set e.num = AM01
return gene;

       
       -- load the cells info one by one in cypher
       -- then change the nums into integer type
match ()-[e:EXPRESSES_GENE_NUM]-()
set e.num = toInteger(e.num)
