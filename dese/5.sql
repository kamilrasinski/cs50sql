SELECT "city", COUNT(*) AS "schools_in_city" FROM "schools"
WHERE "type" LIKE '%public%'
GROUP BY "city"
HAVING "schools_in_city" <= 3
ORDER BY "schools_in_city" DESC, "city";

