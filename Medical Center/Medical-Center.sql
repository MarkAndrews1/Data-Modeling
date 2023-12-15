-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4DUfhn
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "DOCTORS" (
    "id" SERIAL   NOT NULL,
    "doctor_name" text   NOT NULL,
    CONSTRAINT "pk_DOCTORS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "PATIENTS" (
    "id" SERIAL   NOT NULL,
    "patient_name" text   NOT NULL,
    "reason_for_visit" text   NOT NULL,
    CONSTRAINT "pk_PATIENTS" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "APPOINTMENT" (
    "id" SERIAL   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_APPOINTMENT" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "DIAGNOSES" (
    "id" SERIAL   NOT NULL,
    "appointment_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_DIAGNOSES" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "DISEASE" (
    "id" SERIAL   NOT NULL,
    "name" text   NOT NULL,
    "symptoms" text   NOT NULL,
    "treatment" text   NOT NULL,
    CONSTRAINT "pk_DISEASE" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "APPOINTMENT" ADD CONSTRAINT "fk_APPOINTMENT_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "DOCTORS" ("id");

ALTER TABLE "APPOINTMENT" ADD CONSTRAINT "fk_APPOINTMENT_patient_id" FOREIGN KEY("patient_id")
REFERENCES "PATIENTS" ("id");

ALTER TABLE "DIAGNOSES" ADD CONSTRAINT "fk_DIAGNOSES_appointment_id" FOREIGN KEY("appointment_id")
REFERENCES "APPOINTMENT" ("id");

ALTER TABLE "DIAGNOSES" ADD CONSTRAINT "fk_DIAGNOSES_disease_id" FOREIGN KEY("disease_id")
REFERENCES "DISEASE" ("id");

