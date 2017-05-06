--This should populate a drop-down menu for platoons
select * from marine where vehicle_number is not null;

select * from marine where vehicle_number is null;

-- use /vehicles

update marine set vehicle_number = null where id_number = 1000000001;

update marine set vehicle_number = 100001 where id_number = 1000000001;

insert into marine (id_number, first_name, last_name, mil_rank, blood_type)
values ( , , , , )
/*id_number NUMBER(10,0),
  first_name VARCHAR2(10),
  last_name VARCHAR2(15) NOT NULL,
  mil_rank VARCHAR2(8) NOT NULL,
  mil_occupation NUMBER(4,0),
  blood_type VARCHAR2(3),*/

update marine
  set mil_rank = 'blah', mil_occupation = 0341, phone_number =:, nok_phone_number =:
  where id_number = 1000000001;
  
  
--select * from equipment where id_number = 1000000001;
--select * from equipment where designation = 'M16';
--update equipment set id_number = 1000000001 where serial_number = 36633646; 
--select * from equipment where designation = 'M16';

