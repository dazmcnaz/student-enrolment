-- Print each student and how many courses they take (explicit cursor)
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_students IS
        SELECT s.studentId, s.studentName, COUNT(e.courseCode) AS courses
        FROM student s
        LEFT JOIN enrolment e ON e.studentId = s.studentId
        GROUP BY s.studentId, s.studentName
        ORDER BY s.studentId;
    v_id student.studentId%TYPE;
    v_name student.studentName%TYPE;
    v_courses NUMBER;

BEGIN
    OPEN c_students;

    LOOP
        FETCH c_students INTO v_id, v_name, v_courses;
        EXIT WHEN c_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_courses || ' course(s)');
    END LOOP;

    CLOSE c_students;
END;
/
