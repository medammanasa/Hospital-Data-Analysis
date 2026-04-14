--Date Functions

--Calculate length of stay (Discharge_Date - Admission_Date).
select Patient_ID,DATEDIFF(day,Admission_Date,Discharge_Date) as length 
from patients


--Find patients who stayed more than 7 days.
select patient_id, DATEDIFF(day,Admission_Date,Discharge_Date) as count_stay 
from patients
where  DATEDIFF(day,Admission_Date,Discharge_Date)>7


--Get patients admitted in a specific month.(January)
select * from patients
where DATEPART(month,Admission_Date)=1


--Find average stay duration per department.
select Department,avg( DATEDIFF(day,Admission_Date,Discharge_Date)) as count_stay 
from patients
group by Department


--Get patients discharged in the last 30 days.
select * from patients 
where Discharge_Date>= dateadd(day,-30,getdate()) 


 