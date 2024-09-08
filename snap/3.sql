WITH "creative_friends" AS(
    SELECT "to_user_id", COUNT (*) FROM "messages"
    WHERE "from_user_id" = (
        SELECT "users"."id" FROM "users"
        WHERE "username" = 'creativewisdom377'
    )
    GROUP BY "to_user_id"
    ORDER BY COUNT(*) DESC
)
SELECT "to_user_id" FROM "creative_friends"
LIMIT 3;
