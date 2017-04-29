/*select e1.first_name || ' ' || e1.last_name as full_name, d1.department_name, l1.city
from (employees e1 
  left outer join departments d1 ON e1.department_id = d1.department_id) 
  left outer join locations l1 ON l1.location_id = d1.LOCATION_ID
  left outer join jobs j1 ON j1.job_id = e1.job_id
where j1.job_title LIKE '%Manager%'
  AND j1.job_title NOT LIKE '%Sales%'*/
  
/*select first_name, count(*) as repetitions
from employees
group by first_name
order by (0 - count(*));*/

/*select department_id, department_name, avg_salary, num_employees
from departments natural join
(select department_id, AVG(salary) as avg_salary, COUNT(*) as num_employees
from employees
group by department_id
having AVG(salary) > 5500
  and COUNT (*) >= 2); */

select * 
from (marine natural join 
    (select * from mission loadout where mission = 
join
(select