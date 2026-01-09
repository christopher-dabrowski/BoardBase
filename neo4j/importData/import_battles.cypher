// MATCH (existing:Battle)
// DETACH DELETE existing;
WITH {
  `Bran Stark`: 'Bran',
  `Black Walder Frey`: 'Walder Frey',
  `Ramsey Bolton`: 'Ramsay Bolton',
  `Alysane Mormot`: 'Alysane Mormont',
  `Raxter Redwyne`: 'Paxter Redwyne',
  `Robertt Glover`: 'Robett Glover',
  `Ryman Fey`: 'Ryman Frey',
  `Vance`: null,
  `Magnar Styr`: null
} AS commanderNameLookup
WITH
  commanderNameLookup,
  {
    `Free folk`: null,
    `Giants`: null,
    `Thenns`: null,
    `Brotherhood without Banners`: null,
    `Brave Companions`: null,
    `Night's Watch`: null
  } AS houseNameLookup

WITH
  commanderNameLookup,
  houseNameLookup,
  'file:///kaggle/battles.csv' AS battlesFile
// WITH commanderNameLookup, houseNameLookup, 'file:///kaggle/battles-with-deliberate-errors.csv' AS battlesFile
LOAD CSV WITH HEADERS FROM battlesFile AS row
WITH commanderNameLookup, houseNameLookup, row AS data
MERGE (b:Battle {battleNumber: toInteger(data.battle_number)})
SET
  b.name = data.name,
  b.year = toInteger(data.year),
  b.battleType = data.battle_type,
  b.majorDeath = toInteger(data.major_death) = 1,
  b.majorCapture = toInteger(data.major_capture) = 1,
  b.summer = toInteger(data.summer),
  b.attackerSize = toInteger(data.attacker_size),
  b.defenderSize = toInteger(data.defender_size)

CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  WHERE data.region IS NOT NULL
  OPTIONAL MATCH (r:Region {name: data.region})
  WITH b, data, r
  WHERE
    r IS NOT NULL OR
    apoc.util.validatePredicate(
      r IS NULL,
      "Region not found: %s",
      [data.region]
    )
  MERGE (b)-[:TOOK_PLACE_IN]->(r)
  RETURN count(*) AS regionCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  WHERE data.attacker_king IS NOT NULL
  UNWIND
    CASE
      WHEN
        data.attacker_king CONTAINS '/'
        THEN
          [
            firstName IN split(split(data.attacker_king, ' ')[0], '/')
            | trim(firstName) +
            ' ' +
            substring(
              data.attacker_king,
              size(split(data.attacker_king, ' ')[0]) + 1
            )
          ]
      ELSE [data.attacker_king]
    END AS kingName
  OPTIONAL MATCH (king:Person {name: kingName})
  WITH b, data, kingName, king
  WHERE
    king IS NOT NULL OR
    apoc.util.validatePredicate(
      king IS NULL,
      "Attacker king not found: %s",
      [kingName]
    )
  MERGE (king)-[r:COMMANDED_ATTACK_IN]->(b)
  SET r.won = (data.attacker_outcome = 'win')
  RETURN count(*) AS attackerKingCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  WHERE data.defender_king IS NOT NULL
  UNWIND
    CASE
      WHEN
        data.defender_king CONTAINS '/'
        THEN
          [
            firstName IN split(split(data.defender_king, ' ')[0], '/')
            | trim(firstName) +
            ' ' +
            substring(
              data.defender_king,
              size(split(data.defender_king, ' ')[0]) + 1
            )
          ]
      ELSE [data.defender_king]
    END AS kingName
  OPTIONAL MATCH (king:Person {name: kingName})
  WITH b, data, kingName, king
  WHERE
    king IS NOT NULL OR
    apoc.util.validatePredicate(
      king IS NULL,
      "Defender king not found: %s",
      [kingName]
    )
  MERGE (king)-[r:COMMANDED_DEFENSE_IN]->(b)
  SET r.won = (data.attacker_outcome = 'loss')
  RETURN count(*) AS defenderKingCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  UNWIND [data.attacker_1, data.attacker_2, data.attacker_3, data.attacker_4] AS
    attackerHouse
  WITH b, commanderNameLookup, houseNameLookup, attackerHouse
  WHERE attackerHouse IS NOT NULL
  WITH
    b,
    houseNameLookup,
    attackerHouse,
    CASE
      WHEN
        attackerHouse IN keys(houseNameLookup)
        THEN houseNameLookup[attackerHouse]
      ELSE attackerHouse
    END AS mappedAttackerHouse
  WHERE mappedAttackerHouse IS NOT NULL
  OPTIONAL MATCH (h:House)
  WHERE h.name CONTAINS mappedAttackerHouse
  WITH b, data, mappedAttackerHouse, h
  WHERE
    h IS NOT NULL OR
    apoc.util.validatePredicate(
      h IS NULL,
      "Attacking house not found: %s",
      [mappedAttackerHouse]
    )
  MERGE (h)-[r:ATTACKED_IN]->(b)
  SET r.won = (data.attacker_outcome = 'win')
  RETURN count(*) AS attackerHouseCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  UNWIND [data.defender_1, data.defender_2, data.defender_3, data.defender_4] AS
    defenderHouse
  WITH b, houseNameLookup, defenderHouse
  WHERE defenderHouse IS NOT NULL
  WITH
    b,
    houseNameLookup,
    defenderHouse,
    CASE
      WHEN
        defenderHouse IN keys(houseNameLookup)
        THEN houseNameLookup[defenderHouse]
      ELSE defenderHouse
    END AS mappedDefenderHouse
  WHERE mappedDefenderHouse IS NOT NULL
  OPTIONAL MATCH (h:House)
  WHERE h.name CONTAINS mappedDefenderHouse
  WITH b, data, mappedDefenderHouse, h
  WHERE
    h IS NOT NULL OR
    apoc.util.validatePredicate(
      h IS NULL,
      "Defending house not found: %s",
      [mappedDefenderHouse]
    )
  MERGE (h)-[r:DEFENDED_IN]->(b)
  SET r.won = (data.attacker_outcome = 'loss')
  RETURN count(*) AS defenderHouseCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  WHERE data.attacker_commander IS NOT NULL
  UNWIND
    [name IN split(data.attacker_commander, ',') | trim(name)] AS commanderName
  WITH b, commanderNameLookup, commanderName
  WHERE commanderName <> ''
  WITH
    b,
    commanderNameLookup,
    CASE
      WHEN commanderName STARTS WITH 'Lord ' THEN substring(commanderName, 5)
      ELSE commanderName
    END AS cleanedCommanderName
  WITH
    b,
    commanderNameLookup,
    cleanedCommanderName,
    CASE
      WHEN
        cleanedCommanderName IN keys(commanderNameLookup)
        THEN commanderNameLookup[cleanedCommanderName]
      ELSE cleanedCommanderName
    END AS mappedCommanderName
  WHERE mappedCommanderName IS NOT NULL
  OPTIONAL MATCH (p:Person)
  WHERE p.name = mappedCommanderName OR mappedCommanderName IN p.aliases
  WITH b, data, mappedCommanderName, p
  WHERE
    p IS NOT NULL OR
    apoc.util.validatePredicate(
      p IS NULL,
      "Attacker commander not found: %s",
      [mappedCommanderName]
    )
  MERGE (p)-[r:COMMANDED_ATTACK_IN]->(b)
  SET r.won = (data.attacker_outcome = 'win')
  RETURN count(*) AS attackerCommanderCount
}
WITH b, data, commanderNameLookup, houseNameLookup
CALL (b, data, commanderNameLookup, houseNameLookup) {
  WITH b, data, commanderNameLookup, houseNameLookup
  WHERE data.defender_commander IS NOT NULL
  UNWIND
    [name IN split(data.defender_commander, ',') | trim(name)] AS commanderName
  WITH b, commanderNameLookup, commanderName
  WHERE commanderName <> ''
  WITH
    b,
    commanderNameLookup,
    CASE
      WHEN commanderName STARTS WITH 'Lord ' THEN substring(commanderName, 5)
      ELSE commanderName
    END AS cleanedCommanderName
  WITH
    b,
    commanderNameLookup,
    cleanedCommanderName,
    CASE
      WHEN
        cleanedCommanderName IN keys(commanderNameLookup)
        THEN commanderNameLookup[cleanedCommanderName]
      ELSE cleanedCommanderName
    END AS mappedCommanderName
  WHERE mappedCommanderName IS NOT NULL
  OPTIONAL MATCH (p:Person)
  WHERE p.name = mappedCommanderName OR mappedCommanderName IN p.aliases
  WITH b, data, mappedCommanderName, p
  WHERE
    p IS NOT NULL OR
    apoc.util.validatePredicate(
      p IS NULL,
      "Defender commander not found: %s",
      [mappedCommanderName]
    )
  MERGE (p)-[r:COMMANDED_DEFENSE_IN]->(b)
  SET r.won = (data.attacker_outcome = 'loss')
  RETURN count(*) AS defenderCommanderCount
}

RETURN b.battleNumber, b.name, b.year;
MATCH (b:Battle)
RETURN count(b) AS totalBattles;

MATCH (b:Battle)-[r]-(n)
RETURN
  type(r) AS relationshipType,
  labels(n)[0] AS targetNodeType,
  count(*) AS count
ORDER BY count DESC;
