MATCH (start:Person {name: 'Jon Snow'}), (end:Person {name: 'Tyrion Lannister'})
CALL
  apoc.algo.dijkstra(
    start,
    end,
    'COMMANDED_ATTACK_IN>|COMMANDED_DEFENSE_IN>|<COMMANDED_ATTACK_IN|<COMMANDED_DEFENSE_IN',
    'distance'
  )
  YIELD path
RETURN path
