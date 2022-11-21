/*
    Информация о ближайшей встречи пациента
    (без информация о самом пациенте)
*/

DROP VIEW IF EXISTS VIEW_NEXT_PATIENT_APPOINTMENT;
CREATE OR REPLACE VIEW VIEW_NEXT_PATIENT_APPOINTMENT AS
(
SELECT p.last_name || ' ' || substring(p.first_name, 1, 1) || '.' patient_name
     , MAX(dttm_of_appointment)                                   next_appintment
FROM patient p
         JOIN appointment a on p.patient_id = a.patient_id
GROUP BY patient_name
    );


/*
    Информация о всех будущих встречах
    (без информация о пациенте и враче)
*/
DROP VIEW IF EXISTS VIEW_ALL_FUTURE_APPOINTMENTS;
CREATE OR REPLACE VIEW VIEW_ALL_FUTURE_APPOINTMENTS AS
(
SELECT s.last_name || ' ' || substring(s.first_name, 1, 1) || '.' staff_name,
       p.last_name || ' ' || substring(p.first_name, 1, 1) || '.' patient_name
        ,
       dttm_of_appointment                                        date
FROM appointment
         JOIN patient p on appointment.patient_id = p.patient_id
         JOIN staff s on appointment.staff_id = s.staff_id
WHERE dttm_of_appointment > now()
    );

/*
    Информация о количестве лекарств, выданное пациенту в ходе лечения
    (без информация о самом пациенте)
*/

DROP VIEW IF EXISTS VIEW_PATIENT_MEDICATION_AMOUNT;
CREATE OR REPLACE VIEW VIEW_PATIENT_MEDICATION_AMOUNT AS
(
SELECT p.last_name || ' ' || substring(p.first_name, 1, 1) || '.' patient_name
     , medication_name
     , COUNT(*)                                                   amount
FROM patient_medication
         JOIN medication m on m.medication_id = patient_medication.medication_id
         JOIN patient p on p.patient_id = patient_medication.patient_id
GROUP BY p.patient_id, patient_name, medication_name
);


/*
    Представление лекарств, продающихся в клинике, со всеми их характеристиками в порядке убывания цены
*/

DROP VIEW IF EXISTS VIEW_MEDICATION_INFO;
CREATE OR REPLACE VIEW VIEW_MEDICATION_INFO AS
(
SELECT medication_name        name,
       medication_type_name   type,
       medication_description desc_,
       medication_unit_cost   cost
FROM medication
         JOIN ref_medication_type rmt on rmt.medication_type_code = medication.medication_type_code
ORDER BY cost DESC
);


/*
    Представление работников клиники отсортированых по количеству проведенных встреч в порядке убывание
*/

DROP VIEW IF EXISTS VIEW_STAFF_EXPERIENCE;
CREATE OR REPLACE VIEW VIEW_STAFF_EXPERIENCE AS
(
SELECT first_name, last_name, qualification, COUNT(*) cnt FROM staff s
                                                    JOIN appointment a on s.staff_id = a.staff_id
GROUP BY a.staff_id, first_name, last_name, qualification
ORDER BY cnt DESC
);


