drop view master_roster;
drop view mission_roster;

create view master_roster as 
select v1.platoon_name, v1.vehicle_order, 
        m1.vehicle_number, m1.id_number, m1.mil_rank, m1.last_name, m1.first_name, m1.blood_type, 
        e1.rifle, e2.pistol, e3.nvg, e4.optic
from (marine m1
    left outer join (select platoon_name, vehicle_order, vehicle_number from vehicle) v1 on m1.vehicle_number = v1.vehicle_number
    left outer join (select serial_number as rifle, id_number from equipment where designation = 'M16') e1 on m1.id_number = e1.id_number
    left outer join (select serial_number as pistol, id_number from equipment where designation = 'M9') e2 on m1.id_number = e2.id_number
    left outer join (select serial_number as nvg, id_number from equipment where designation = 'PAS-28') e3 on m1.id_number = e3.id_number
    left outer join (select serial_number as optic, id_number from equipment where designation = 'MDO') e4 on m1.id_number = e4.id_number
    )
;


create view mission_roster as 
select m1.mission_number, v1.platoon_name, v1.vehicle_order, 
        m1.vehicle_number, m1.id_number, m1.mil_rank, m1.last_name, m1.first_name, m1.blood_type, 
        e1.rifle--, e2.pistol, e3.nvg, e4.optic
from ((select * from mission_crew natural join marine) m1
    left outer join (select platoon_name, vehicle_order, vehicle_number from vehicle) v1 on m1.vehicle_number = v1.vehicle_number
    left outer join (select serial_number as rifle, id_number from loadout where designation = 'M16') e1 on m1.id_number = e1.id_number
    left outer join (select serial_number as pistol, id_number from loadout where designation = 'M9') e2 on m1.id_number = e2.id_number
    left outer join (select serial_number as nvg, id_number from loadout where designation = 'PAS-28') e3 on m1.id_number = e3.id_number
    left outer join (select serial_number as optic, id_number from loadout where designation = 'MDO') e4 on m1.id_number = e4.id_number
    )
;

commit;