UPDATE medication
SET medication_unit_cost = medication_unit_cost + 10
WHERE medication_name = 'Celexa';

UPDATE staff
SET last_name = 'Christophe'
WHERE staff_id = 3;


INSERT INTO medication (medication_type_code, medication_unit_cost, medication_name, medication_description)
VALUES (2, 100, 'Celexa', 'Antidepressant');


INSERT INTO patient_medication (medication_id,
                                patient_id,
                                date_of_administered,
                                dosage)
VALUES (1, 2, '2020-03-01', '150 mg');

INSERT INTO ref_medication_type (medication_type_name,
                                 medication_type_description)
VALUES ('Celexa', 'Selective Serotonin Reuptake Inhibitors (SSRIs)');

-- Все терапевты работающие в ДБТ походе.
SELECT *
FROM staff
WHERE qualification = 'CBT Therapist';

-- Все препараты выписанные клиникой.
SELECT p.first_name, p.last_name, medication_name, date_of_administered
FROM patient p
         JOIN patient_medication ON p.patient_id = patient_medication.patient_id
         JOIN medication m on patient_medication.medication_id = m.medication_id
;

-- Самый популярный препарат.
SELECT medication_name
FROM patient_medication
         JOIN medication m on m.medication_id = patient_medication.medication_id
GROUP BY medication_name
ORDER BY count(*) DESC
LIMIT 1;

-- Удаляем пациента из базы.
DELETE
FROM patient
WHERE patient.patient_id = 3;

DELETE
FROM medication
WHERE medication_id IN (SELECT patient_medication.medication_id
                        FROM patient_medication
                        WHERE patient_id = 3);

DELETE
FROM appointment
WHERE patient_id = 3;