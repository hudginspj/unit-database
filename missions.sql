

/*create table mission(
  mission_number VARCHAR2(6),
  description VARCHAR2(500),
  start_date DATE,
  end_date DATE,
  destination VARCHAR2(30),
  primary key (mission_number)
);*/
insert into mission (mission_number, description) values ('XM1001', 'Kill everything that moves IVO Obj A');

insert into mission_vehicle (mission_number, vehicle_number) values ('XM1001', 200001);
insert into mission_vehicle (mission_number, vehicle_number) values ('XM1001', 200002);



exec mission_defaults('XM1001');


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
