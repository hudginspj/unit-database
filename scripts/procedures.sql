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
  END LOOP;
  CLOSE c1;
END;

/*create or replace PROCEDURE mission_defaults(mission_number IN VARCHAR2)
IS
  m_vic_num NUMBER(6,0);
  m_id_num NUMBER(10,0);
  CURSOR c1 (miss_num VARCHAR2) IS
    SELECT vehicle_number FROM mission_vehicle
    WHERE mission_number = miss_num;
  CURSOR c2 (vic_num NUMBER) IS
    SELECT id_number FROM master_roster
    WHERE vehicle_number = vic_num;
BEGIN
  OPEN c1(mission_number);
  LOOP
    FETCH c1 INTO m_vic_num;
    EXIT WHEN c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(m_vic_num);
    OPEN c2(
    LOOP
      FETCH c2 into 
    END LOOP;
    CLOSE c2;
  END LOOP;
  CLOSE c1;
END;*/