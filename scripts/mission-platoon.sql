

/*create table mission(
  mission_number VARCHAR2(6),
  description VARCHAR2(500),
  start_date DATE,
  end_date DATE,
  destination VARCHAR2(30),
  primary key (mission_number)
);*/
insert into mission (mission_number, start_date, end_date, destination, description) 
values ('XM1001', to_date('20160323', 'YYYYMMDD'), to_date('20160324', 'YYYYMMDD'), 'SV 5794 3497', 'Kill everything that moves IVO Obj A');



insert into mission_vehicle (mission_number, vehicle_number) values ('XM1001', 200001);
insert into mission_vehicle (mission_number, vehicle_number) values ('XM1001', 200002);


exec mission_defaults('XM1001');

select * from mission where mission_number = 'XM1001';

select mission_number, start_date, end_date from mission order by start_date;
select vehicle_number, platoon_name, vehicle_number 
from (mission_vehicle natural join vehicle)
where mission_number = 'XM1001';

--insert into mission_crew(mission_number, id_number, vehicle_number) values ('XM1001', 1000000006, 200002);

select * from mission_crew;

--not api
insert into loadout(mission_number, id_number, designation, serial_number)
        values ('XM1001', 1000000006, 'PAS-28', '8558568568');

select * from loadout;

/*select m1.mission_number, v1.platoon_name, v1.vehicle_order, 
        m1.vehicle_number, m1.id_number, m1.mil_rank, m1.last_name, m1.first_name, m1.blood_type, 
        e1.rifle--, e2.pistol, e3.nvg, e4.optic
from ((select * from mission_crew natural join marine) m1
    left outer join (select platoon_name, vehicle_order, vehicle_number from vehicle) v1 on m1.vehicle_number = v1.vehicle_number
    left outer join (select serial_number as rifle, id_number from loadout where designation = 'M16') e1 on m1.id_number = e1.id_number
    left outer join (select serial_number as pistol, id_number from loadout where designation = 'M9') e2 on m1.id_number = e2.id_number
    left outer join (select serial_number as nvg, id_number from loadout where designation = 'PAS-28') e3 on m1.id_number = e3.id_number
    left outer join (select serial_number as optic, id_number from loadout where designation = 'MDO') e4 on m1.id_number = e4.id_number
    )*/
select * from mission_roster;