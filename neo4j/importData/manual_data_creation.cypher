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

MATCH (battleCastleBlack:Battle {battleNumber: 28})
MATCH (jonSnow:Person {name: 'Jon Snow'})
MATCH (styr:Person {name: 'Styr'})
MATCH (freeFolk:Group {name: 'Free folk'})
MATCH (nightWatch:Group {name: "Night's Watch"})
MERGE (jonSnow)-[r1:COMMANDED_DEFENSE_IN]->(battleCastleBlack)
SET r1.won = true
MERGE (styr)-[r2:COMMANDED_ATTACK_IN]->(battleCastleBlack)
SET r2.won = false
MERGE (freeFolk)-[r3:ATTACKED_IN]->(battleCastleBlack)
SET r3.won = false
MERGE (nightWatch)-[r4:DEFENDED_IN]->(battleCastleBlack)
SET r4.won = true;

MATCH (siegeRiverrun:Battle {battleNumber: 36})
MATCH (rymanFrey:Person {name: 'Ryman Frey'})
MERGE (rymanFrey)-[r5:COMMANDED_ATTACK_IN]->(siegeRiverrun)
SET r5.won = true;
