--Retrieve all patient records.
select * from Patients


--Show only Name, Age, and Department.
select Name,Age,Department from Patients


--Find all patients whose age is greater than 50.
select * from patients
where age > 50


--List all female patients.
select * from patients
where gender = 'F'


--Get patients admitted after 2023-01-01.
select * from patients 
where Admission_Date>'2023-01-01'


-- Filtering and Sorting 

--Find patients from the Cardiology department.
select * from patients 
where department='Cardiology'


--Get patients whose treatment cost is greater than 50,000.
select * from patients 
where Treatment_cost >50000


--Display patients sorted by Treatment_Cost (highest first).
select * from patients 
order by Treatment_cost desc


--Find patients with satisfaction score less than 5.
select * from patients 
where Satisfaction_Score<5


--Retrieve patients whose name starts with 'A'.
select * from patients 
where name like'a%'