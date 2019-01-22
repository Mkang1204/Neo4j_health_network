-- Community detection with Louvain algorithms

CALL algo.louvain(
'MATCH (p:provider) RETURN id(p) as id',
'MATCH (p1:provider)-[:works_on]->(e:encounter)<-[:works_on]-(p2:provider)
RETURN id(p1) as source, id(p2) as target, count(*) as weight',
{graph:'cypher', iterations:3, write: true});
