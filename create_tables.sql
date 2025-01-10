BEGIN;
--
-- Create model Doctor
--
CREATE TABLE "mainApp_doctor" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "name" varchar(100) NOT NULL, "address" varchar(100) NULL, "phoneNumber" varchar(20) NULL, "email" varchar(254) NULL, "department" varchar(20) NOT NULL, "officeNumber" varchar(10) NOT NULL);
--
-- Create model Patient
--
CREATE TABLE "mainApp_patient" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "name" varchar(100) NOT NULL, "dob" date NULL, "gender" varchar(10) NULL, "address" varchar(100) NULL, "phoneNumber" varchar(20) NULL, "email" varchar(254) NULL);
--
-- Create model Room
--
CREATE TABLE "mainApp_room" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "type" varchar(10) NOT NULL, "available" boolean NOT NULL);
--
-- Create model Test
--
CREATE TABLE "mainApp_test" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "testName" varchar(50) NOT NULL, "scheduledTime" timestamp with time zone NOT NULL, "testReport" varchar(100) NOT NULL, "reportGenerationTime" timestamp with time zone NOT NULL, "patientID_id" bigint NOT NULL);
--
-- Create model Operation
--
CREATE TABLE "mainApp_operation" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "opName" varchar(50) NOT NULL, "startTime" timestamp with time zone NOT NULL, "endTime" timestamp with time zone NOT NULL, "operationReport" varchar(100) NOT NULL, "reportGenerationTime" timestamp with time zone NOT NULL, "opTheatre_id" bigint NOT NULL, "patientID_id" bigint NOT NULL);
CREATE TABLE "mainApp_operation_doctorID" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "operation_id" bigint NOT NULL, "doctor_id" bigint NOT NULL);
--
-- Create model Appointment
--
CREATE TABLE "mainApp_appointment" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "startTime" timestamp with time zone NOT NULL, "endTime" timestamp with time zone NOT NULL, "priority" integer NOT NULL, "appReport" varchar(100) NOT NULL, "reportGenerationTime" timestamp with time zone NOT NULL, "doctorID_id" bigint NOT NULL, "patientID_id" bigint NOT NULL);
--
-- Create model Admission
--
CREATE TABLE "mainApp_admission" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "startTime" timestamp with time zone NOT NULL, "endTime" timestamp with time zone NULL, "patientID_id" bigint NOT NULL, "roomID_id" bigint NOT NULL);
ALTER TABLE "mainApp_test" ADD CONSTRAINT "mainApp_test_patientID_id_a64055ae_fk_mainApp_patient_id" FOREIGN KEY ("patientID_id") REFERENCES "mainApp_patient" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "mainApp_test_patientID_id_a64055ae" ON "mainApp_test" ("patientID_id");
ALTER TABLE "mainApp_operation" ADD CONSTRAINT "mainApp_operation_opTheatre_id_b2b93fc4_fk_mainApp_room_id" FOREIGN KEY ("opTheatre_id") REFERENCES "mainApp_room" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "mainApp_operation" ADD CONSTRAINT "mainApp_operation_patientID_id_a60babcb_fk_mainApp_patient_id" FOREIGN KEY ("patientID_id") REFERENCES "mainApp_patient" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "mainApp_operation_opTheatre_id_b2b93fc4" ON "mainApp_operation" ("opTheatre_id");
CREATE INDEX "mainApp_operation_patientID_id_a60babcb" ON "mainApp_operation" ("patientID_id");
ALTER TABLE "mainApp_operation_doctorID" ADD CONSTRAINT "mainApp_operation_doctorID_operation_id_doctor_id_d86f8d21_uniq" UNIQUE ("operation_id", "doctor_id");
ALTER TABLE "mainApp_operation_doctorID" ADD CONSTRAINT "mainApp_operation_do_operation_id_ce84d9da_fk_mainApp_o" FOREIGN KEY ("operation_id") REFERENCES "mainApp_operation" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "mainApp_operation_doctorID" ADD CONSTRAINT "mainApp_operation_do_doctor_id_e35569d9_fk_mainApp_d" FOREIGN KEY ("doctor_id") REFERENCES "mainApp_doctor" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "mainApp_operation_doctorID_operation_id_ce84d9da" ON "mainApp_operation_doctorID" ("operation_id");
CREATE INDEX "mainApp_operation_doctorID_doctor_id_e35569d9" ON "mainApp_operation_doctorID" ("doctor_id");
ALTER TABLE "mainApp_appointment" ADD CONSTRAINT "mainApp_appointment_doctorID_id_dcc2a67e_fk_mainApp_doctor_id" FOREIGN KEY ("doctorID_id") REFERENCES "mainApp_doctor" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "mainApp_appointment" ADD CONSTRAINT "mainApp_appointment_patientID_id_31169b75_fk_mainApp_patient_id" FOREIGN KEY ("patientID_id") REFERENCES "mainApp_patient" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "mainApp_appointment_doctorID_id_dcc2a67e" ON "mainApp_appointment" ("doctorID_id");
CREATE INDEX "mainApp_appointment_patientID_id_31169b75" ON "mainApp_appointment" ("patientID_id");
ALTER TABLE "mainApp_admission" ADD CONSTRAINT "mainApp_admission_patientID_id_455f4889_fk_mainApp_patient_id" FOREIGN KEY ("patientID_id") REFERENCES "mainApp_patient" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "mainApp_admission" ADD CONSTRAINT "mainApp_admission_roomID_id_d0b81904_fk_mainApp_room_id" FOREIGN KEY ("roomID_id") REFERENCES "mainApp_room" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "mainApp_admission_patientID_id_455f4889" ON "mainApp_admission" ("patientID_id");
CREATE INDEX "mainApp_admission_roomID_id_d0b81904" ON "mainApp_admission" ("roomID_id");
COMMIT;