WITH 'Robb/Joffrey Baratheon' AS kingName
CALL kd.parseKingName(kingName) YIELD name
RETURN name;

WITH 'John Snow' AS kingName
CALL kd.parseKingName(kingName) YIELD name
RETURN name;

WITH 'Hodor' AS kingName
CALL kd.parseKingName(kingName) YIELD name
RETURN name;
