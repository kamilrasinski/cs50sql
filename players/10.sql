SELECT DISTINCT "birth_country" AS "Foreign countries" FROM "players"
WHERE NOT "birth_country" = 'USA'
ORDER BY "birth_country" ASC;
