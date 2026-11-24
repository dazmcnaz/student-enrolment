-- Enrolment count and average grade for one course
CREATE OR REPLACE PROCEDURE get_course_stats (
    p_code IN course.courseCode%TYPE,
    p_count OUT NUMBER,
    p_avg OUT NUMBER
) IS
  v_course course.courseCode%TYPE;

BEGIN
    SELECT courseCode INTO v_course
    FROM course
    WHERE courseCode = p_code;

    SELECT COUNT(studentId), ROUND(AVG(grade), 1)
    INTO p_count, p_avg
    FROM enrolment
    WHERE courseCode = p_code;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Course ' || p_code || ' not found.');
END;
/

-- Example call
SET SERVEROUTPUT ON;

DECLARE
  v_total NUMBER;
  v_average NUMBER;

BEGIN
  get_course_stats('INSY7213', v_total, v_average);
  DBMS_OUTPUT.PUT_LINE('Enrolled: ' || v_total || ', Avg: ' || NVL(TO_CHAR(v_average), 'N/A'));
END;
/
