CREATE TABLE meteorites_temp (
    "name" TEXT NOT NULL UNIQUE,
    "id" INTEGER UNIQUE NOT NULL,
    "nametype" TEXT,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = '';

UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = '';

UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = '';

UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = '';

UPDATE "meteorites_temp"
SET "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND ("long", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

CREATE TABLE meteorites_temp2 (
    "id" INTEGER UNIQUE NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    "nametype" TEXT,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL CHECK ("discovery" = 'Fell' OR "discovery" = 'Found'),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);


INSERT INTO "meteorites_temp2" ("id", "name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "id", "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp"
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "meteorites_temp";

CREATE TABLE meteorites (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL CHECK ("discovery" = 'Fell' OR "discovery" = 'Found'),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp2"
ORDER BY "year" ASC, "name" ASC;

DROP TABLE "meteorites_temp2"; --COMMENT



/*
create view v_meteorites
as
select * from meteorites
order by 1,2;

begin transaction

update asdanabnb;

end transaction;

commit;

rollback;

drop table; - usuniecie tabeli - trzeba potwierdzic commmitem
truncate table; - wyczyszczneie tabeli  i to od razu commituje ZMIANYU

*/
