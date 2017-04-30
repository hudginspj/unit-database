


insert into platoon (platoon_name) values ('HQ');
insert into platoon (platoon_name) values ('1ST');
insert into platoon (platoon_name) values ('2ND');


/*create table platoon(
  platoon_name VARCHAR2(10),
  commander_id NUMBER(10, 0),
  primary key (platoon_name),
  foreign key (commander_id) references marine
);*/

insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('100001', '1ST', 1);
insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('100002', '1ST', 2);
insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('100003', '1ST', 3);

insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('200001', '2ND', 1);
insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('200002', '2ND', 2);
insert into vehicle (vehicle_number, platoon_name, vehicle_order) 
    values ('200003', '2ND', 3);

/*create table vehicle(
  vehicle_number NUMBER(6,0),
  platoon_name VARCHAR2(10),
  vehicle_order NUMBER(2,0),
  vehicle_type VARCHAR2(10)
        constraint ckVicType check (vehicle_type in ('LOG', '35', 'AA', 'MORTAR', 'TRUCK')),
  primary key (vehicle_number),
  foreign key (platoon_name) references platoon
);*/

insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (2000000001, 'SCOUT', 'SCOUTY', 'LCPL', 'O+', 100001);

insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000008, 'WAGNER', 'JOE', 'PFC', 'O+', 200003);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000001, 'SMITH', 'BOB', 'SGT', 'O+', 200001);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000002, 'STEVENS', 'STEVEN', 'CPL', 'O+', 200001);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000003, 'WILSON', 'JOE', 'PFC', 'O+', 200001);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000004, 'TAYLOR', 'DAN', 'LT', 'O+', 200002);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000005, 'ANDERSON', 'MATT', 'CPL', 'O+', 200002);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000006, 'KENT', 'RICK', 'PVT', 'O+', 200002);
insert into marine (id_number, last_name, first_name, mil_rank, blood_type, vehicle_number)
  values (1000000007, 'RICHMOND', 'JOHN', 'CPL', 'O+', 200003);



/*create table marine (
  id_number NUMBER(10,0),
  first_name VARCHAR2(30),-- NOT NULL,
  last_name VARCHAR2(30),-- NOT NULL,
  mil_rank VARCHAR2(8),-- NOT NULL,
  mil_occupation NUMBER(4,0,--) NOT NULL,
  blood_type VARCHAR2(3),
  address_id NUMBER(10, 0),
  phone_number NUMBER(10,0),
  nok_phone_number NUMBER(10, 0),
  vehicle_number NUMBER(6,0),
  primary key(id_number)
  --foreign key (vehicle_number) references vehicle
);*/

insert into equipment_type (designation, description) values ('M16', 'Big Gun');
insert into equipment_type (designation, description) values ('M9', 'Gun');
insert into equipment_type (designation, description) values ('M120', 'Absurdly Big Gun');
insert into equipment_type (designation, description) values ('PAS-28', 'Night Vision');
insert into equipment_type (designation, description) values ('M2', 'Really Big Gun');
insert into equipment_type (designation, description) values ('MDO', 'Optic');
insert into equipment_type (designation, description) values ('PRC-160', 'Radio');
insert into equipment_type (designation, description) values ('COMPASS', 'Compass');

/*create table equipment_type(
  designation VARCHAR2(10),
  description VARCHAR2(100),
  primary key (designation)
);*/


insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('5554532', 'M16', null, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('4571514', 'M16', null, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('45798234', 'M16', null, 'UP');


insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('6363466', 'M9', 1000000001, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('8586568586', 'MDO', 1000000001, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('4574774', 'M16', 1000000001, 'UP');
--insert into equipment (serial_number, designation, id_number, maintenance_status)
-- values ('745775475', 'PAS-28', 1000000001, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('74747745', 'M9', 1000000002, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('36732662', 'MDO', 1000000002, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('36633646', 'M16', 1000000002, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('86556856', 'PAS-28', 1000000002, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('36364566', 'M9', 1000000003, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('68558856', 'MDO', 1000000003, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('3646364463', 'M16', 1000000003, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('9698697696', 'PAS-28', 1000000003, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('25266363646', 'M9', 1000000004, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('63434747', 'MDO', 1000000004, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('86558585865', 'M16', 1000000004, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('477476736', 'PAS-28', 1000000004, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('8576856865', 'M9', 1000000005, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('4745774747', 'MDO', 1000000005, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('658865568', 'M16', 1000000005, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('636436463', 'PAS-28', 1000000005, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('634634636', 'M9', 1000000006, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('85688585568', 'MDO', 1000000006, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('636636436', 'M16', 1000000006, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('8558568568', 'PAS-28', 1000000006, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('364636463', 'M9', 1000000007, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('85868568586', 'MDO', 1000000007, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('36366436363', 'M16', 1000000007, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('9669679696', 'PAS-28', 1000000007, 'UP');
 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('3466343643', 'M9', 1000000008, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('36346436334', 'MDO', 1000000008, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('7447557457', 'M16', 1000000008, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('96696966996', 'PAS-28', 1000000008, 'UP');

 
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('2552355', 'M120', 1000000002, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('747457', 'M120', 1000000001, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('757596', 'PRC-160', 1000000001, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('856856', 'PRC-160', 1000000004, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('9656856', 'PRC-160', 1000000007, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('3636434', 'M2', 1000000008, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('8564545', 'COMPASS', 1000000002, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('4753634', 'COMPASS', 1000000004, 'UP');
insert into equipment (serial_number, designation, id_number, maintenance_status)
 values ('9866898', 'COMPASS', 1000000007, 'UP');

/*create table equipment(
  serial_number VARCHAR2(30),
  designation VARCHAR2(10),
  marine_id NUMBER(10,0),
  maintenance_status VARCHAR2(5)
    constraint ckMaint check (maintenance_status in ('UP', 'DOWN', 'AWAY')),
  primary key (serial_number, designation),
  foreign key (designation) references equipment_type
);*/

