-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4DUfhn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "USERS" (
    "id" SERIAL   NOT NULL,
    "username" text   NOT NULL,
    "password" text   NOT NULL,
    "preferred_region" text   NOT NULL,
    CONSTRAINT "pk_USERS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "REGION" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_REGION" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "CATEGORY" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_CATEGORY" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "POST" (
    "id" SERIAL   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    "title" text   NOT NULL,
    "text_content" text   NOT NULL,
    "location" text   NOT NULL,
    CONSTRAINT "pk_POST" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "REGION" ADD CONSTRAINT "fk_REGION_id" FOREIGN KEY("id")
REFERENCES "POST" ("region_id");

ALTER TABLE "CATEGORY" ADD CONSTRAINT "fk_CATEGORY_id" FOREIGN KEY("id")
REFERENCES "POST" ("category_id");

ALTER TABLE "POST" ADD CONSTRAINT "fk_POST_user_id" FOREIGN KEY("user_id")
REFERENCES "USERS" ("id");

