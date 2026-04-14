--Window Functions

--Rank patients based on treatment cost.
select 
patient_id,rank() over (partition by patient_id order by treatment_cost ) as RANK_ 
from patients 
--Use ROW_NUMBER() to assign unique rank per department.
with cte_rownumber 
as 
(
select patient_id,department,row_number() over (partition by department order by treatment_cost) as rn
from patients
)
select * from cte_rownumber 


--Find top 3 highest cost patients in each department.
with cte_top3
as 
(
select patient_id, department ,rank() over (partition by department order by treatment_cost desc ) as rnk
from patients
)
select * from cte_top3
where rnk < 4


--Calculate running total of treatment cost.

SELECT patient_id,treatment_cost,SUM(treatment_cost) 
OVER ( ORDER BY admission_date) AS running_total
FROM patients


--Find second highest treatment cost.
with sec_high
as 
(
select *,rank() over (order by treatment_cost desc ) as sec_highest
from patients
)
select * from sec_high
where sec_highest = 2


--Joins

--Join patient data with doctor table.
select p.*,d.* 
from patients  as p
join 
doctors as d
on p.Doctor_ID=d.Doctor_ID


--Find doctor-wise patient count.
select count(p.patient_id) as cnt,d.doctor_id 
from patients as p
join 
Doctors as d
on p.Doctor_ID=d.Doctor_ID
group by d.Doctor_ID


--Find highest revenue-generating doctor.
SELECT TOP 1 d.doctor_id, d.doctor_name,
SUM(p.treatment_cost) AS total_revenue
FROM doctors as  d
JOIN patients as p
    ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.doctor_name
ORDER BY total_revenue DESC
