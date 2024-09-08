SELECT "english_title" AS '10 most complex Hiroshige artworks' FROM "views"
WHERE "artist" = 'Hiroshige'
ORDER BY "entropy" DESC
LIMIT 10;
