create or replace PROCEDURE mission_defaults(x_mission_number IN VARCHAR2)
IS
  v_id_num marine.id_number%TYPE;
  v_serial equipment.serial_number%TYPE;
  v_des equipment.designation%TYPE;
  v_vic VEHICLE.VEHICLE_NUMBER%TYPE;
  CURSOR c1 (miss_num VARCHAR2) IS
    SELECT id_number, vehicle_number FROM (mission_vehicle natural join master_roster)
    WHERE mission_number = miss_num;
  CURSOR c2 (miss_num VARCHAR2) IS
    SELECT id_number, designation, serial_number
    FROM (mission_vehicle natural join marine natural join equipment)
    WHERE mission_number = miss_num;
BEGIN
  OPEN c1(x_mission_number);
  LOOP
    FETCH c1 INTO v_id_num, v_vic;
    EXIT WHEN c1%NOTFOUND;
    --DBMS_OUTPUT.PUT_LINE(x_mission_number);
    --DBMS_OUTPUT.PUT_LINE(v_id_num);
    --DBMS_OUTPUT.PUT_LINE(v_vic);
    insert into mission_crew(mission_number, id_number, vehicle_number) 
      --values ('XM1001', 1000000001, 200001);
      --values (x_mission_number, v_id_num, (select vehicle_number from master_roster where id_number = v_id_num));
      values (x_mission_number, v_id_num, v_vic);
    commit;
  END LOOP;
  CLOSE c1;
  
  OPEN c2(x_mission_number);
  LOOP
    FETCH c2 INTO v_id_num, v_des, v_serial;
    EXIT WHEN c2%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(x_mission_number);
    DBMS_OUTPUT.PUT_LINE(v_id_num);
    DBMS_OUTPUT.PUT_LINE(v_des);
    DBMS_OUTPUT.PUT_LINE(v_serial);
    insert into loadout(mission_number, id_number, designation, serial_number)
        values (x_mission_number, 
            v_id_num,
            v_des,
            v_serial);
    commit;
  END LOOP;
  CLOSE c2;
END;


/*
create or replace PROCEDURE mission_defaults(x_mission_number IN VARCHAR2)
IS
  m_id_num NUMBER(10,0);
  CURSOR c1 (miss_num VARCHAR2) IS
    SELECT id_number FROM (mission_vehicle natural join master_roster)
    WHERE mission_number = miss_num;
BEGIN
  OPEN c1(x_mission_number);
  LOOP
    FETCH c1 INTO m_id_num;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(m_id_num);
    insert into mission_crew (mission_number, id_number, vehicle_number) 
      --values ('XM1001', 1000000001, 200001);
     values (x_mission_number, m_id_num, (select vehicle_number from master_roster where id_number = m_id_num));
    --insert into loadout values (x_mission_number, vehicle_number,
  END LOOP;
  CLOSE c1;
END;*/
