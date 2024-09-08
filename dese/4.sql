SELECT "city", COUNT(*) AS "schools_in_city" FROM "schools"
WHERE "type" LIKE '%public%'
GROUP BY "city"
ORDER BY "schools_in_city" DESC, "city"
LIMIT 10;
