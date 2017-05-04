

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

--SELECT id_number, designation, serial_number
--    FROM (mission_vehicle natural join marine natural join equipment)
--    WHERE mission_number = 'XM1001';




--SELECT id_number, designation, serial_number  FROM (mission_vehicle natural join marine natural join equipment);

/*create table mission_crew(
  mission_number VARCHAR2(6),
  id_number NUMBER(10, 0),
  vehicle_number NUMBER(6,0),
  primary key (mission_number, id_number),
  foreign key (mission_number) references mission,
  foreign key (id_number) references marine,
  foreign key (vehicle_number) references vehicle
);*/

/*create table loadout(
  serial_number VARCHAR2(30),
  designation VARCHAR2(10),
  mission_number VARCHAR2(6),
  id_number NUMBER(10,0),
  primary key (serial_number, mission_number),
  foreign key (serial_number, designation) references equipment,
  foreign key (mission_number, id_number) references mission_crew
);
*/
