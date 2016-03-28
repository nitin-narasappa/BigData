
// This is NOT an executable, purposefully added the cql extension so that this file is read rather than executed :-)

Each query is turned into an execution plan by something called the execution planner. The execution plan tells Neo4j which operations to perform when executing the query. 
Two different execution planning strategies are included in Neo4j:

Rule
This planner has rules that are used to produce execution plans. The planner considers available indexes, but does not use statistical information to guide the query compilation.
Cost
This planner uses the statistics service in Neo4j to assign cost to alternative plans and picks the cheapest one. While this should lead to superior execution plans in most cases, it is still under development.
By default, Neo4j 3.0.0-M05 will use the cost planner for some queries, but not all. You can force it to use a specific planner by using the query.planner.version configuration setting (see dbms.cypher.planner),
 or by prepending your query with CYPHER planner=cost or CYPHER planner=rule. Neo4j might still not use the planner you selected — not all queries are solvable by the cost planner at this point.
 

Profiling the query:
 
EXPLAIN
If you want to see the execution plan but not run the statement, prepend your Cypher statement with EXPLAIN. The statement will always return an empty result and make no changes to the database.

PROFILE
If you want to run the statement and see which operators are doing most of the work, use PROFILE. This will run your statement and keep track of how many rows pass through each operator, and how much each operator needs to interact with the storage layer to retrieve the necessary data. 
Please note that profiling your query uses more resources, so you should not profile unless you are actively working on a query.


