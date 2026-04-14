--Case Statements

--Categorize patients: Cost < 50K ? Low ,50K–100K ? Medium ,100K ? High
select *, case 
when treatment_cost <50000 then 'Low'
when treatment_cost  between 50000 and 100000 then 'Medium'
else 'High'
end sal
from patients

--Categorize satisfaction: 8–10 ? Good,5–7 ? Average ,<5 ? Poor
select *, case 
when satisfaction_Score between 8 and 10  then 'Good'
when satisfaction_Score between 5 and 7then 'Average'
else 'poor'
end Rating 
from patients