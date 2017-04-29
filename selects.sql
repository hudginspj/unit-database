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

select vehicle_order as vic, mil_rank as rank, last_name as last, first_name as first, blood_type as BT,  rifle, pistol, nvg, optic
from (marine m1
    left outer join (select platoon_name, vehicle_order, vehicle_number from vehicle) v1 on m1.vehicle_number = v1.vehicle_number
    left outer join (select serial_number as rifle, id_number from equipment where designation = 'M16') e1 on m1.id_number = e1.id_number
    left outer join (select serial_number as pistol, id_number from equipment where designation = 'M9') e2 on m1.id_number = e2.id_number
    left outer join (select serial_number as nvg, id_number from equipment where designation = 'PAS-28') e3 on m1.id_number = e3.id_number
    left outer join (select serial_number as optic, id_number from equipment where designation = 'MDO') e4 on m1.id_number = e4.id_number
    )
where v1.platoon_name = '2ND'
order by v1.vehicle_order
;

select vehicle_order as vic, designation, serial_number, last_name
from (marine m1
    natural join (select platoon_name, vehicle_order, vehicle_number from vehicle)-- v1 on m1.vehicle_number = v1.vehicle_number
    natural join (select serial_number, designation, id_number from equipment 
           where designation != 'M16'
           and designation != 'M9'
           and designation != 'PAS-28'
           and designation != 'MDO'
       ) --e1 on m1.id_number = e1.id_number
    )
where platoon_name = '2ND'
order by vehicle_order
;

((select 'PERSONNEL' as item, count(*) as count 
  from (marine natural join vehicle)
  where platoon_name = '2ND'
  )
union
(select designation as item, count(*) as count
from (equipment natural join marine natural join vehicle)
where platoon_name = '2ND'
group by designation
))
order by item desc
;

