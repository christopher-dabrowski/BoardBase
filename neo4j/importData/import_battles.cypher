WITH 'file:///kaggle/battles.csv' AS battlesFile
// WITH 'file:///kaggle/battles-with-deliberate-errors.csv' AS battlesFile
LOAD CSV WITH HEADERS FROM battlesFile AS row
WITH apoc.map.clean(row, [], ['', null]) AS data
WHERE data.name IS NOT NULL

// MATCH (existing:Battle)
// DETACH DELETE existing;

MERGE (b:Battle {battleNumber: toInteger(data.battle_number)})
SET
  b +=
    apoc.map.clean(
      data,
      [
        'battle_number',
        'attacker_king',
        'defender_king',
        'attacker_1',
        'attacker_2',
        'attacker_3',
        'attacker_4',
        'defender_1',
        'defender_2',
        'defender_3',
        'defender_4',
        'attacker_commander',
        'defender_commander',
        'region',
        'attacker_size',
        'defender_size',
        'major_death',
        'major_capture',
        'summer'
      ],
      ['', null]
    ),
  b.year = toInteger(data.year),
  b.attackerOutcome = data.attacker_outcome,
  b.battleType = data.battle_type,
  b.majorDeath = toInteger(data.major_death) = 1,
  b.majorCapture = toInteger(data.major_capture) = 1,
  b.summer = toInteger(data.summer),
  b.attackerSize = toInteger(data.attacker_size),
  b.defenderSize = toInteger(data.defender_size)

WITH b, data
WHERE data.region IS NOT NULL
OPTIONAL MATCH (r:Region {name: data.region})
WITH b, data, r
WHERE
  r IS NOT NULL OR
  apoc.util.validatePredicate(r IS NULL, "Region not found: %s", [data.region])
MERGE (b)-[:TOOK_PLACE_IN]->(r)

WITH b, data

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
MERGE (king)-[:COMMANDED_ATTACK_IN]->(b)

WITH DISTINCT b, data

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
MERGE (king)-[:COMMANDED_DEFENSE_IN]->(b)

WITH DISTINCT b, data

UNWIND [data.attacker_1, data.attacker_2, data.attacker_3, data.attacker_4] AS
  attackerHouse
WITH b, data, attackerHouse
WHERE attackerHouse IS NOT NULL
OPTIONAL MATCH (h:House {name: attackerHouse})
WITH b, data, attackerHouse, h
WHERE
  h IS NOT NULL OR
  apoc.util.validatePredicate(
    h IS NULL,
    "Attacking house not found: %s",
    [attackerHouse]
  )
MERGE (h)-[:ATTACKED_IN]->(b)

WITH DISTINCT b, data

UNWIND [data.defender_1, data.defender_2, data.defender_3, data.defender_4] AS
  defenderHouse
WITH b, data, defenderHouse
WHERE defenderHouse IS NOT NULL
OPTIONAL MATCH (h:House {name: defenderHouse})
WITH b, data, defenderHouse, h
WHERE
  h IS NOT NULL OR
  apoc.util.validatePredicate(
    h IS NULL,
    "Defending house not found: %s",
    [defenderHouse]
  )
MERGE (h)-[:DEFENDED_IN]->(b)

WITH DISTINCT b, data

WHERE data.attacker_commander IS NOT NULL
UNWIND
  [name IN split(data.attacker_commander, ',') | trim(name)] AS commanderName
WITH b, data, commanderName
WHERE commanderName <> ''
OPTIONAL MATCH (p:Person {name: commanderName})
WITH b, data, commanderName, p
WHERE
  p IS NOT NULL OR
  apoc.util.validatePredicate(
    p IS NULL,
    "Attacker commander not found: %s",
    [commanderName]
  )
MERGE (p)-[:COMMANDED_ATTACK_IN]->(b)

WITH DISTINCT b, data

WHERE data.defender_commander IS NOT NULL
UNWIND
  [name IN split(data.defender_commander, ',') | trim(name)] AS commanderName
WITH b, commanderName
WHERE commanderName <> ''
OPTIONAL MATCH (p:Person {name: commanderName})
WITH b, commanderName, p
WHERE
  p IS NOT NULL OR
  apoc.util.validatePredicate(
    p IS NULL,
    "Defender commander not found: %s",
    [commanderName]
  )
MERGE (p)-[:COMMANDED_DEFENSE_IN]->(b)

RETURN b.battleNumber, b.name, b.year;

MATCH (b:Battle)
RETURN
  count(b) AS totalBattles,
  count(b.location) AS battlesWithLocation,
  count(b.attackerSize) AS battlesWithAttackerSize,
  count(b.defenderSize) AS battlesWithDefenderSize;

MATCH (b:Battle)-[r]->(n)
RETURN
  type(r) AS relationshipType,
  labels(n)[0] AS targetNodeType,
  count(*) AS count
ORDER BY count DESC;