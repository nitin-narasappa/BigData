
// Tuning Queries example(note the number of accesses after the index creation, on the whole movie example data):

PROFILE
MATCH (p:Person { name:"Tom Hanks" })
RETURN p

// Total database accesses: 251

CREATE INDEX ON :Person(name)

PROFILE
MATCH (p:Person { name:"Tom Hanks" })
RETURN p

// Total database accesses: 2
