CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "date" TEXT NOT NULL,
    "flight_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlanes" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airlane_id" INTEGER NOT NULL,
    "departure_airport" TEXT NOT NULL UNIQUE,
    "arrival_airport" TEXT NOT NULL UNIQUE,
    "expected_departure_time" TEXT NOT NULL,
    "expected_arrival_time" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airlane_id") REFERENCES "airlanes" ("id")
);
