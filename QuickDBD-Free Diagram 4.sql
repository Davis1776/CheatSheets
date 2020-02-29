﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/t9Q7qU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Gym" (
    "id" INTEGER   NOT NULL,
    "Equipment_id" INTEGER   NOT NULL,
    "Gym_name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    "Zipcode" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Gym" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Trainers" (
    "id" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Trainers" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Members" (
    "id" INTEGER   NOT NULL,
    "Payment_id" INTEGAR   NOT NULL,
    "Gym_id" INTEGER   NOT NULL,
    "Trainers_id" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Address" VARCHAR   NOT NULL,
    "City" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Members" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Payments" (
    "id" INTEGER   NOT NULL,
    "Member_id" INTEGER   NOT NULL,
    "CreditCard_info" VARCHAR   NOT NULL,
    "Billing_Zip" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Payments" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Equipment" (
    "id" INTEGER   NOT NULL,
    "Machine" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Equipment" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Gym" ADD CONSTRAINT "fk_Gym_Equipment_id" FOREIGN KEY("Equipment_id")
REFERENCES "Equipment" ("id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Payment_id" FOREIGN KEY("Payment_id")
REFERENCES "Payments" ("id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Gym_id" FOREIGN KEY("Gym_id")
REFERENCES "Gym" ("id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_Trainers_id" FOREIGN KEY("Trainers_id")
REFERENCES "Trainers" ("id");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_Member_id" FOREIGN KEY("Member_id")
REFERENCES "Members" ("id");

