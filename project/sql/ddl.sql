DROP TABLE IF EXISTS STAFF CASCADE;
DROP TABLE IF EXISTS MEDICATION CASCADE;
DROP TABLE IF EXISTS APPOINTMENT CASCADE;
DROP TABLE IF EXISTS PATIENT CASCADE;
DROP TABLE IF EXISTS PATIENT_MEDICATION CASCADE;
DROP TABLE IF EXISTS REF_MEDICATION_TYPE CASCADE;


CREATE TABLE IF NOT EXISTS STAFF
(
    staff_id      serial PRIMARY KEY,
    first_name    varchar(30) NOT NULL,
    middle_name   varchar(30),
    last_name     varchar(30) NOT NULL,
    date_of_birth date        NOT NULL,
    gender_mfu    varchar(1)  NOT NULL,
    qualification varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS PATIENT
(
    patient_id      serial PRIMARY KEY,
    first_name      varchar(30) NOT NULL,
    middle_name     varchar(30),
    last_name       varchar(30) NOT NULL,
    date_of_birth   date        NOT NULL,
    gender_mfu      varchar(1)  NOT NULL,
    address         varchar(50) NOT NULL,
    valid_from_dttm timestamp   NOT NULL,
    valid_to_dttm   timestamp   NOT NULL DEFAULT '9999-12-31'
);

CREATE TABLE IF NOT EXISTS APPOINTMENT
(
    appointment_id      serial PRIMARY KEY,
    patient_id          int REFERENCES PATIENT (patient_id) NOT NULL,
    staff_id            int REFERENCES STAFF (staff_id)     NOT NULL,
    dttm_of_appointment timestamp                           NOT NULL,
    other_details       xml
);

CREATE TABLE IF NOT EXISTS REF_MEDICATION_TYPE
(
    medication_type_code        serial PRIMARY KEY,
    medication_type_name        varchar(30) NOT NULL,
    medication_type_description text        NOT NULL
);

CREATE TABLE IF NOT EXISTS MEDICATION
(
    medication_id          serial PRIMARY KEY,
    medication_type_code   int REFERENCES REF_MEDICATION_TYPE (medication_type_code) NOT NULL,
    medication_unit_cost   real CHECK (medication_unit_cost >= 0 )                   NOT NULL,
    medication_name        varchar(30)                                               NOT NULL,
    medication_description text                                                      NOT NULL,
    other_details          xml
);

CREATE TABLE IF NOT EXISTS PATIENT_MEDICATION
(
    patient_medication_id serial PRIMARY KEY,
    medication_id         int REFERENCES MEDICATION (medication_id) NOT NULL,
    patient_id            int REFERENCES PATIENT (patient_id)       NOT NULL,
    date_of_administered  date                                      NOT NULL,
    dosage                varchar(20)                               NOT NULL,
    comments              text,
    other_details         xml
);