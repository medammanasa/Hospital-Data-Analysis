--Subqueries

--Find patients whose treatment cost is above average.
select * 
from patients
where treatment_cost>( select avg(treatment_cost)
                                           from patients )


--Get patients with the highest treatment cost.
select * 
from patients
where treatment_cost=( select max(treatment_cost) from patients )


--Retrieve patients treated by doctors who treated more than 5 patients.
SELECT *
FROM patients
WHERE doctor_id IN (
    SELECT doctor_id
    FROM patients
    GROUP BY doctor_id
    HAVING COUNT(patient_id) > 5
)


--Find patients with satisfaction score equal to maximum score.
select *
from patients
where Satisfaction_Score = (select max(Satisfaction_Score) as max_score from patients)