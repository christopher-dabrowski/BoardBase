MERGE (freeFolk:Group {name: 'Free folk'})
MATCH (beyondTheWall:Region {name: "Beyond the Wall"})
MERGE (freeFolk)-[:IN_REGION]->(beyondTheWall);

MERGE (nightWatch:Group {name: "Night's Watch"})
MATCH (north:Region {name: "The North"})
MATCH (beyondTheWall:Region {name: "Beyond the Wall"})
MERGE (nightWatch)-[:IN_REGION]->(north)
MERGE (nightWatch)-[:IN_REGION]->(beyondTheWall)
MATCH (jonSnow:Person {name: 'Jon Snow'})
MERGE (jonSnow)-[:MEMBER_OF]->(nightWatch);

MERGE (styr:Person {name: 'Styr', aliases: ['Magnar Styr'], isFemale: false})
MATCH (freeFolk:Group {name: 'Free folk'})
MERGE (styr)-[:MEMBER_OF]->(freeFolk);

MERGE
  (raymanFrey:Person
    {name: 'Ryman Frey', aliases: ['Ser Fey'], isFemale: false})
MATCH (houseFrey:House {name: 'House Frey of the Crossing'})
MERGE (raymanFrey)-[:ALLIED_WITH]->(houseFrey);
