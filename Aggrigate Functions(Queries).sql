--Aggregation Functions

--Find the total number of patients.
select count(Patient_ID) as no_of_Patients 
from patients


--Calculate the average treatment cost.
select avg(treatment_cost) as Average 
from Patients


--Find the maximum and minimum treatment cost.
select max(treatment_cost) as Maximun_cost,
min(treatment_cost)as Minimum_cost 
from patients


--Count number of patients in each department.
select Department,count(patient_id) as total_count 
from patients 
group by Department

--Find average satisfaction score per department.
select Department,avg(Satisfaction_Score) as Average 
from patients 
group by Department

--Show departments having more than 10 patients.
select department,count(patient_id) as counts 
from patients 
group by Department
having count(patient_id)>10


--Find departments where average cost is above 70,000.
select department ,avg(treatment_cost) as average 
from patients
group by department
having avg(treatment_cost)>70000


--Find departments with average satisfaction score below 6.
select department,avg(satisfaction_score) as Average 
from patients 
group by department
having avg(satisfaction_score)<6


--Get total treatment cost per department.
select department,sum(treatment_cost) as total_cost  
from patients 
group by department
