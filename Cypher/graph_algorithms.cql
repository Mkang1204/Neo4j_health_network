-- Community detection with Louvain algorithms

CALL algo.louvain(
'MATCH (p:provider) RETURN id(p) as id',
'MATCH (p1:provider)-[:works_on]->(e:encounter)<-[:works_on]-(p2:provider)
RETURN id(p1) as source, id(p2) as target, count(*) as weight',
{graph:'cypher', iterations:3, write: true});
  
  
-- Filter data with counts - shared more than 10 encounters
match pat = (p1:provider)-[w1:works_on]-(e:encounter)-[w2:works_on]-(p2:provider)
with p1,w1,w2,p2,count(e) as cnt
where cnt >=10
return *
  
  
--Figure 1b looks closest. Many of the titles are difficult to read - maybe two anesthesiology residents, a number of radiologists, 
--a pharmacist (far left) and two NMH physicians (attendings? residents?) are the major players? 
--   Does a network of low-performing team members look similar or different?
