/*CREATE OR REPLACE TRIGGER assign_equip
BEFORE UPDATE OF id_number ON equipment
FOR EACH ROW
DECLARE
  sn EQUIPMENT.SERIAL_NUMBER%TYPE;
BEGIN
  SELECT serial_number INTO sn 
  FROM equipment  
  WHERE designation = :new.designation
  AND id_number = :new.id_number;
    IF :new.designation IN ('M16', 'M9','PAS-28','MDO') 
    AND sn IS NOT NULL
    THEN
       RAISE_APPLICATION_ERROR(-20101, 'Duplicate equipment.');
        ROLLBACK;
    END IF;
END;*/



