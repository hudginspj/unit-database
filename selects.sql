--This should populate a drop-down menu for platoons
select platoon_name from platoon;

--This should take in platoon_name as a variable, and be displayed on the platoon roster page
select vehicle_order as vic, mil_rank as rank, last_name as last, first_name as first, blood_type as BT,  rifle, pistol, nvg, optic
from master_roster
where platoon_name = '2ND'
order by vehicle_order;

--This should take in platoon_name as a variable, and be displayed on the platoon roster page
select vehicle_order as vic, designation, serial_number, last_name
from (master_roster
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

--This should take in platoon_name as a variable, and be displayed on the platoon roster page
((select 'Personnel' as item, count(*) as count 
  from master_roster
  where platoon_name = '2ND'
  )
union
(select designation as item, count(*) as count
from (equipment natural join master_roster)
where platoon_name = '2ND'
group by designation
))
order by item desc
;


