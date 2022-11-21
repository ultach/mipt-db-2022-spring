/*
  gender_mfu:
  f - female
  m - male
  u - unknown
 */

INSERT INTO staff (first_name,
                   middle_name,
                   last_name,
                   date_of_birth,
                   gender_mfu,
                   qualification)
VALUES ('Pavel', null, 'Kartavenko', '1977-01-18', 'm', 'CBT Therapist'),
       ('Ruzbih', null, 'Anand', '1978-07-04', 'm', 'CBT Therapist'),
       ('Maya', null, 'Masimova', '1979-09-18', 'f', 'Recreational Therapist'),
       ('Dina', null, 'Diaa', '1993-03-16', 'f', 'Child Therapist'),
       ('Berry', null, 'Pon', '1994-11-22', 'm', 'CBT Therapist'),
       ('Sai', null, 'Kishore', '1998-04-16', 'm', 'Family Therapist'),
       ('Roshan', 'Nur Anand', 'Ananthan', '1999-04-23', 'm', 'Family Therapist'),
       ('Dmitriev', null, 'Dmitrii', '2000-04-14', 'm', 'Occupational Therapist'),
       ('Aina', null, 'Ndengu', '2000-06-21', 'm', 'Child Therapist'),
       ('Heikki', null, 'Tshilongo', '2000-09-20', 'm', 'Child Therapist');


INSERT INTO patient (first_name,
                     middle_name,
                     last_name,
                     date_of_birth,
                     gender_mfu,
                     address,
                     valid_from_dttm)
VALUES ('Maximilian', null, 'Cade', '1991-04-18', 'm', '9193 East St Margarets St. Everett, MA 02149', now()),
       ('Bristol', null, 'Mae', '1993-01-06', 'f', '7136 Henry Dr. Hempstead, NY 11550', now()),
       ('Summer', null, 'Laila', '1993-12-17', 'f', '880 South North Ave. Allentown, PA 18102', now()),
       ('Fiona', null, 'Mckinley', '1994-03-16', 'f', '9151 Fairground St. Melbourne, FL 32904', now()),
       ('Quentin', null, 'Kolton', '1994-05-12', 'm', '57 Summerhouse St. Greensburg, PA 15601', now()),
       ('King', null, 'Archie', '1996-09-17', 'm', '681 Wild Rose Street Reynoldsburg, OH 43068', now()),
       ('Ellis', 'Nur Anand', 'Devin', '1998-05-21', 'm', '72 Coffee Lane Milford, MA 01757', now()),
       ('Chance', null, 'Oliver', '2003-09-17', 'm', '400 Southampton St. Southaven, MS 38671', now()),
       ('Katelyn', null, 'Selena', '2004-12-23', 'f', '9 Riverside Street Los Angeles, CA 90008', now()),
       ('Caroline', null, 'Paisley', '2006-06-27', 'f', '96 Philmont Dr. Fort Dodge, IA 50501', now());


INSERT INTO appointment (patient_id,
                         staff_id,
                         dttm_of_appointment,
                         other_details)

VALUES (1, 3, '2020-03-10 14:00:00'::TIMESTAMP, null),
       (1, 3, '2020-04-10 14:00:00'::TIMESTAMP, null),
       (5, 3, '2020-02-10 14:00:00'::TIMESTAMP, null),
       (5, 3, '2020-03-10 15:00:00'::TIMESTAMP, null),
       (3, 3, '2020-03-10 16:00:00'::TIMESTAMP, null),
       (4, 3, '2020-03-10 12:00:00'::TIMESTAMP, null),
       (6, 2, '2020-03-10 14:00:00'::TIMESTAMP, null),
       (2, 3, '2020-03-10 17:00:00'::TIMESTAMP, null),
       (8, 4, '2020-03-10 12:00:00'::TIMESTAMP, null),
       (9, 8, '2020-03-10 10:00:00'::TIMESTAMP, null),
       (10, 5, '2020-03-10 09:00:00'::TIMESTAMP, null),
       (5, 3, '2022-06-10 15:00:00'::TIMESTAMP, null),
       (3, 3, '2022-06-10 16:00:00'::TIMESTAMP, null),
       (4, 3, '2022-06-10 12:00:00'::TIMESTAMP, null),
       (6, 2, '2022-06-10 14:00:00'::TIMESTAMP, null),
       (2, 3, '2022-06-10 17:00:00'::TIMESTAMP, null),
       (8, 4, '2022-06-10 12:00:00'::TIMESTAMP, null),
       (9, 8, '2022-06-10 10:00:00'::TIMESTAMP, null),
       (10, 5, '2022-06-10 09:00:00'::TIMESTAMP, null);


INSERT INTO ref_medication_type (medication_type_name,
                                 medication_type_description)

VALUES ('Celexa', 'Selective Serotonin Reuptake Inhibitors (SSRIs)'),
       ('Lexapro', 'Selective Serotonin Reuptake Inhibitors (SSRIs)'),
       ('Cymbalta', 'Serotonin and Norepinephrine Reuptake Inhibitors (SNRIs)'),
       ('Effexor', 'Serotonin and Norepinephrine Reuptake Inhibitors (SNRIs)'),
       ('Anafranil', 'Tricyclic Antidepressants (TCAs)'),
       ('Sinequan', 'Tricyclic Antidepressants (TCAs)'),
       ('Emsam', 'Monoamine Oxidase Inhibitors (MAOIs)'),
       ('Marplan', 'Monoamine Oxidase Inhibitors (MAOIs)'),
       ('Oleptro', 'Atypical Antidepressant'),
       ('Symbax', 'Atypical Antidepressant');

INSERT INTO medication (medication_type_code, medication_unit_cost, medication_name, medication_description)
VALUES (1, 100, 'Celexa', 'Antidepressant'),
       (2, 140, 'Lexapro', 'Antidepressant'),
       (3, 150, 'Cymbalta', 'Antidepressant'),
       (4, 122, 'Effexor', 'Antidepressant'),
       (5, 130, 'Anafranil', 'Antidepressant'),
       (6, 88, 'Sinequan', 'Antidepressant'),
       (7, 99, 'Emsam', 'Antidepressant'),
       (8, 111, 'Marplan', 'Antidepressant'),
       (9, 50, 'Oleptro', 'Antidepressant'),
       (10, 40, 'Symbax', 'Antidepressant');



INSERT INTO patient_medication (medication_id,
                                patient_id,
                                date_of_administered,
                                dosage)
VALUES (1, 2, '2020-03-01', '150 mg'),
       (1, 1, '2020-03-05', '100 mg'),
       (5, 3, '2020-03-01', '150 mg'),
       (4, 5, '2020-03-05', '110 mg'),
       (4, 6, '2020-03-05', '100 mg'),
       (4, 7, '2020-03-05', '100 mg'),
       (3, 9, '2020-03-05', '100 mg'),
       (3, 1, '2020-05-05', '100 mg'),
       (5, 8, '2020-03-05', '100 mg');

