-- create table with primary key
CREATE TABLE public."order_item"(
    "id" INTEGER NOT NULL,
    "order_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE public."order_item" ADD PRIMARY KEY("id");
    
CREATE TABLE public."store_location"(
    "id" INTEGER NOT NULL,
    "store_id" INTEGER NOT NULL,
    "location" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE public."store_location" ADD PRIMARY KEY("id");

CREATE TABLE public."item"(
    "id" INTEGER NOT NULL,
    "Category" VARCHAR(255) NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "Description" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" INTEGER NOT NULL
);
ALTER TABLE public."item" ADD PRIMARY KEY("id");

CREATE TABLE "order"(
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "store_location_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE public."order" ADD PRIMARY KEY("id");

CREATE TABLE "store"(
    "id" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Address" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE public."store" ADD PRIMARY KEY("id");

CREATE TABLE "users"(
    "(id)" INTEGER NOT NULL,
    "Name" VARCHAR(255) NOT NULL,
    "Gender" VARCHAR(255) NULL,
    "Address" VARCHAR(255) NULL,
    "Phone Number" VARCHAR(255) NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE public."users" ADD PRIMARY KEY("(id)");

-- add foreign key
ALTER TABLE public."order_item" ADD CONSTRAINT "order_item_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "order"("id");
ALTER TABLE public."store_location" ADD CONSTRAINT "store_location_store_id_foreign" FOREIGN KEY("store_id") REFERENCES "store"("id");
ALTER TABLE public."order" ADD CONSTRAINT "order_store_location_id_foreign" FOREIGN KEY("store_location_id") REFERENCES "store_location"("id");
ALTER TABLE public."order_item" ADD CONSTRAINT "order_item_item_id_foreign" FOREIGN KEY("item_id") REFERENCES "item"("id");
ALTER TABLE public."order" ADD CONSTRAINT "order_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("(id)");