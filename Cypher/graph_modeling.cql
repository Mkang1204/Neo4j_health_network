match (p:patient)
match (b:BAL_sample)
merge (b)-[i:IS_TAKEN_FROM]-(p)










match (g:gene)
match (b:BAL_sample)
merge (b)-[h:HAS_RNAseq_RESULT]->(g)

-- Created 57905 relationships, completed after 398945 ms.


