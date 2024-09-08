CREATE TABLE "ingredients" (
    "id" INTEGER NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    "price" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK ("type" IN ('gluten', 'gluten-free')),
    "price" REAL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER NOT NULL UNIQUE,
    "donut_id" INTEGER NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);
