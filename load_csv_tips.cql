--2018/12/06 --from Mark Needham's blog
--MERGE, MERGE, MERGE -> merge merge + match, match, merge
--e.g1
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///.csv" AS row
WITH row LIMIT 0
MERGE (employee:Employee {employeeId: row.EmployeeID})
MERGE (order:Order {orderId: row.OrderID})

USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///.csv" AS row
MATCH (employee:Employee {employeeId: row.EmployeeID})
MATCH (order:Order {orderId: row.OrderID})
MERGE (employee)-[:SOLD]->(order)


--MATCH, MATCH, MATCH, MERGE, MERGE -> We can work around the problem in this case by having separate queries to create the relationships:
--e.g2
LOAD CSV WITH HEADERS FROM "file:///.csv" AS row
MATCH (employee:Employee {employeeId: row.EmployeeID})
MATCH (order:Order {orderId: row.OrderID})
MERGE (employee)-[:SOLD]->(order)

USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///.csv" AS row
MATCH (order:Order {orderId: row.OrderID})
MATCH (product:Product {productId: row.ProductID})
MERGE (order)-[:PRODUCT]->(product)


--MERGE, SET -> We can work around this at the cost of a bit of duplication using 'ON CREATE SET' and 'ON MATCH SET':
--e.g3
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///.csv" AS row
MERGE (supplier:Supplier {supplierId: row.SupplierID})
ON CREATE SET supplier.companyName = row.SupplierCompanyName
ON MATCH SET supplier.companyName = row.SupplierCompanyName

--unwind examples/ aplit()
  LOAD CSV WITH HEADERS FROM 'file:///data/locations.csv' AS line WITH split(line.locations,";") as locations, line.title as title UNWIND locations AS location
	MERGE (x:Location {name:location})
  MERGE (m:Movie {title:title})
  MERGE (m)-[:FILMED_IN]->(x)

