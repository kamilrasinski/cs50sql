SELECT * FROM "schools"
NATURAL JOIN "graduation_rates"
ORDER BY "graduation_rates"."excluded" DESC
LIMIT 3;
