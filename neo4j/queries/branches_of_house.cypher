MATCH (mainHouse:House {name: "House Lannister of Casterly Rock"})
OPTIONAL MATCH (branch:House)-[:BRANCH_OF*]->(mainHouse)
RETURN mainHouse.name AS mainHouse, branch.name AS branchHouse
