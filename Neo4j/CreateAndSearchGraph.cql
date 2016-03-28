
// Neo4j NOTES:

// "()" Round brackets represent nodes
// "[]" Square brackets represent relationships/actions
// "{}" Curly brackets represent attributes of nodes/relationships/actions.
 
// Create a node "TheMatrix" of the type Movie:
 CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
 
// This will create a Movie node with title="The Matrix" and released=1999 etc
 
// Create a node "TomH" of the type Person:
 CREATE (TomH:Person {name:'Tom Hanks', born:1956})
 
// This will create a node of the type Person with attributes name="Tom Hanks" and born=1956.
 
// Create a node "CastAway" of the type Movie:
 CREATE (CastAway:Movie {title:'Cast Away', released:2000, tagline:'At the edge of the world, his journey begins.'})
 
// This will create a Movie node "CastAway" with title="Cast Away" and released=2000 and tagline="At the edge of the world, his journey begins.".
 
// Create other nodes "HelenH" and "RobertZ" before executing the relationship query:
  
  CREATE (HelenH:Person {name:'Helen Hunt', born:1963})
  CREATE (RobertZ:Person {name:'Robert Zemeckis', born:1951})
 
 //Create a relationship:
 CREATE
  (TomH)-[:ACTED_IN {roles:['Chuck Noland']}]->(CastAway),
  (HelenH)-[:ACTED_IN {roles:['Kelly Frears']}]->(CastAway),
  (RobertZ)-[:DIRECTED]->(CastAway)
  
 // This will create a relationship between the Person node "TomH" and the movie "CastAway" with the type of relationship as "ACTED_IN" and attribute role="Chuck Noland". 
  
  Executing all these queries will create a graph with nodes and relationships.
  
//  Now, finding a person with name "Tom Hanks" is just executing the cypher query:
  MATCH(tom {name:"Tom Hanks"}) RETURN tom
  
//  Find 10 persons:
  MATCH (people:Person) RETURN people.name LIMIT 10
  
//  Find a movie released between 1990 and 2000:
  MATCH (nineties:Movie) WHERE nineties.released > 1990 AND nineties.released < 2000 RETURN nineties.title
  
//  List all movies Tom Hanks acted:
  MATCH (tom:Person {name: "Tom Hanks"})-[:ACTED_IN]->(tomHanksMovies) RETURN tom,tomHanksMovies
  
//  List co-actors of Tom Hanks:
  MATCH (tom:Person {name:"Tom Hanks"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(coActors) RETURN coActors.name
  
 
