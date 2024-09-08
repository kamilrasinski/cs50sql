WITH "top_users" AS (
    SELECT "username", COUNT("to_user_id") FROM "messages"
    JOIN "users" ON "users"."id" = "to_user_id"
    GROUP BY "to_user_id"
    ORDER BY COUNT("to_user_id") DESC, "username" ASC
)
SELECT "username" FROM "top_users"
LIMIT 1;

