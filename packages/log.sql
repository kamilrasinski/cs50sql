
-- *** The Lost Letter ***
SELECT "address", "type" FROM "addresses" WHERE "id" = ( -- In this way, I checked what address is assigned to the address , where the package was received
    SELECT "address_id" FROM "scans" WHERE "action" = 'Drop' AND "package_id" = ( -- In this way, I obtained the ID of the address to which the package was sent
        SELECT "id" FROM "packages" WHERE "contents" = 'Congratulatory letter' AND "from_address_id" = ( -- This is how I got the package ID (there were 4 packages with same from_address_id, so i also checked the contents column)
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue' -- In this way, I received the id of the address from which the package was received
        )
   )
);
-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL; -- In this way, i received data on what packages were sent without the "from" address. There was only one.
SELECT "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = 5098 AND "action" = 'Drop'
); -- In this way, i received type of package drop localization, which i could do because i already knew "package_id" from "packages" table.
-- *** The Forgotten Gift ***
SELECT "contents" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
); -- In this way, i received data on the contents of our package.
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = 9873
);-- In this way, i got data on what has happened to our package, including the id of the driver who last had the package.
SELECT "name" FROM "drivers" WHERE "id" = 17;
