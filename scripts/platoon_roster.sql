--This should populate a drop-down menu for platoons
select platoon_name from platoon;

--Personal equip table
--This should take in platoon_name as a variable, and be displayed on the platoon roster page
select vehicle_order as vic, mil_rank as rank, last_name as last, first_name as first, blood_type as BT,  rifle, pistol, nvg, optic
from master_roster
where platoon_name = '2ND'
order by vehicle_order;

--Extra equip table
--This should take in platoon_name as a variable, and be displayed on the platoon roster page
--Remember but do not display id_number (used for subsequent calls to edit the table)
select vehicle_order as vic, designation, serial_number, last_name, id_number
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

--Counts table
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


--Call to unassign a rifle, takes serial number as input variable
update equipment
  set id_number = null
  where serial_number = '4574774'
  and designation = 'M16';
  
--Populates a dropdown menu of unassigned rifles
select serial_number 
from equipment
where designation = 'M16'
and id_number is null;

--Call to assign a rilfe, (from clicking on that box in the personal equip table) 
--Takes (marine) id_number and serial_number as input variables
update equipment
  set id_number = 1000000001
  where serial_number = '5554532'
  and designation = 'M16';
  





------------------LATER ITERATION STUFF FROM HERE DOWN------------------------------------

--Call to remove extra equipment (option from clicking on that equip)
--Takes serial_number and designation as input variables
update equipment
  set id_number = null
  where serial_number = '747457'
  and designation = 'M120';
  
--Populates a dropdown menu of equipment types
select designation 
from EQUIPMENT_TYPE;

--Populates a dropdown menu of unassigned equipment
--Takes designation as variable
select serial_number 
from equipment
where designation = 'M120'
and id_number is null;


--Call to assign extra equipment, takes (marine) id_number, designation, and serial_number as input variables
update equipment
  set id_number = 1000000001
  where serial_number = '747457'
  and designation = 'M120';


