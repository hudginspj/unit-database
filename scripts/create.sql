

drop table loadout;
drop table mission_crew;
drop table mission_vehicle;
drop table mission;

drop table equipment;
drop table equipment_type;
alter table marine drop column vehicle_number;
drop table vehicle;
drop table platoon;

drop table qualification;
drop table qualification_type;

drop table emergency_contact;
drop table marine;
drop table address;

create table address(
  address_id NUMBER(10,0),
  first_line VARCHAR2(50),
  second_line VARCHAR2(50),
  city VARCHAR2(20),
  state_code VARCHAR2(2),
  zip_code NUMBER(5,0),
  primary key (address_id)
);

create table marine (
  id_number NUMBER(10,0),
  first_name VARCHAR2(10),
  last_name VARCHAR2(15) NOT NULL,
  mil_rank VARCHAR2(8) NOT NULL,
  mil_occupation NUMBER(4,0),
  blood_type VARCHAR2(3),
  address_id NUMBER(10, 0),
  phone_number NUMBER(10,0),
  nok_phone_number NUMBER(10, 0),
  vehicle_number NUMBER(6,0),
  primary key(id_number)
  --foreign key (vehicle_number) references vehicle
);

create table emergency_contact(
  id_number NUMBER(10,0), 
  emergency_phone_number NUMBER(10,0),
  primary key (id_number, emergency_phone_number),
  foreign key (id_number) references marine
);

create table qualification_type(
  qualification_name VARCHAR2(30),
  validity_duration NUMBER(3, 0),
  primary key (qualification_name)
);

create table qualification (
  id_number NUMBER(10,0),
  qualification_name VARCHAR2(30),
  completion_date DATE,
  expiration_date DATE,
  primary key(id_number, qualification_name, completion_date),
  foreign key(qualification_name) references qualification_type,
  foreign key (id_number) references marine
);

create table platoon(
  platoon_name VARCHAR2(10),
  commander_id NUMBER(10, 0),
  primary key (platoon_name),
  foreign key (commander_id) references marine
);

create table vehicle(
  vehicle_number NUMBER(6,0),
  platoon_name VARCHAR2(10),
  vehicle_order NUMBER(2,0),
  vehicle_type VARCHAR2(10)
        constraint ckVicType check (vehicle_type in ('LOG', '35', 'AA', 'MORTAR', 'TRUCK')),
  primary key (vehicle_number),
  foreign key (platoon_name) references platoon
);

create table equipment_type(
  designation VARCHAR2(10),
  description VARCHAR2(100),
  primary key (designation)
);

create table equipment(
  serial_number VARCHAR2(15),
  designation VARCHAR2(10),
  id_number NUMBER(10,0),
  maintenance_status VARCHAR2(5)
    constraint ckMaint check (maintenance_status in ('UP', 'DOWN', 'AWAY')),
  primary key (serial_number, designation),
  foreign key (designation) references equipment_type,
  foreign key (id_number) references marine
);

create table mission(
  mission_number VARCHAR2(6),
  start_date DATE,
  end_date DATE,
  destination VARCHAR2(30),
  description VARCHAR2(500),
  primary key (mission_number)
);


create table mission_vehicle(
  mission_number VARCHAR2(6),
  vehicle_number NUMBER(6,0),
  primary key (mission_number, vehicle_number),
  foreign key (mission_number) references mission on delete cascade,
  foreign key (vehicle_number) references vehicle
);

create table mission_crew(
  mission_number VARCHAR2(6),
  id_number NUMBER(10, 0),
  vehicle_number NUMBER(6,0),
  primary key (mission_number, id_number),
  foreign key (mission_number, vehicle_number) references mission_vehicle on delete cascade,
  foreign key (id_number) references marine
);

create table loadout(
  serial_number VARCHAR2(15),
  designation VARCHAR2(10),
  mission_number VARCHAR2(6),
  id_number NUMBER(10,0),
  primary key (serial_number, mission_number),
  foreign key (serial_number, designation) references equipment on delete cascade,
  foreign key (mission_number, id_number) references mission_crew on delete cascade
);


alter table marine
  add foreign key (vehicle_number) references vehicle on delete set null;

commit;