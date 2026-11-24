-- Log every grade change
CREATE OR REPLACE TRIGGER trg_grade_audit
AFTER UPDATE OF grade ON enrolment

FOR EACH ROW
BEGIN
    IF (:OLD.grade != :NEW.grade)
        OR (:OLD.grade IS NULL AND :NEW.grade IS NOT NULL)
        OR (:OLD.grade IS NOT NULL AND :NEW.grade IS NULL) THEN
            INSERT INTO grade_audit (studentId, courseCode, old_grade, new_grade)
            VALUES (:NEW.studentId, :NEW.courseCode, :OLD.grade, :NEW.grade);
    END IF;
END;
/

-- Test
UPDATE enrolment SET grade = 64 WHERE courseCode = 'PROG6212' AND grade IS NULL;
UPDATE enrolment SET grade = LEAST(100, grade + 5) WHERE courseCode = 'INSY7213';
SELECT * FROM grade_audit;
