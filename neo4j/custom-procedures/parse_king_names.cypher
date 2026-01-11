WITH 'Robb/Joffrey Baratheon' AS kingName
CALL kd.parseKingName(kingName) YIELD name
RETURN name;
