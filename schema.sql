DROP TABLE IF EXISTS grade_audit;
DROP TABLE IF EXISTS enrolment;
DROP TABLE IF EXISTS student_phone;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS lecturer;
DROP TABLE IF EXISTS student;

CREATE TABLE student (
    studentId NUMBER PRIMARY KEY,
    studentName  VARCHAR2(100) NOT NULL,
    studentEmail VARCHAR2(100) UNIQUE NOT NULL
);

CREATE TABLE student_phone (
    studentId NUMBER,
    phone VARCHAR2(15),
    CONSTRAINT pk_student_phone PRIMARY KEY (studentId, phone),
    CONSTRAINT fk_phone_student FOREIGN KEY (studentId) REFERENCES student(studentId)
);

CREATE TABLE lecturer (
    lecturerId NUMBER PRIMARY KEY,
    lecturerName VARCHAR2(100) NOT NULL,
    lecturerOffice VARCHAR2(10) NOT NULL
);

CREATE TABLE course (
    courseCode VARCHAR2(10) PRIMARY KEY,
    courseTitle VARCHAR2(100) NOT NULL,
    lecturerId NUMBER NOT NULL,
    CONSTRAINT fk_course_lecturer FOREIGN KEY (lecturerId) REFERENCES lecturer(lecturerId)
);

CREATE TABLE enrolment (
  studentId NUMBER,
  courseCode VARCHAR2(10),
  grade NUMBER(5,2) CHECK (grade BETWEEN 0 AND 100),
  CONSTRAINT pk_enrolment PRIMARY KEY (studentId, courseCode),
  CONSTRAINT fk_enrol_student FOREIGN KEY (studentId)  REFERENCES student(studentId),
  CONSTRAINT fk_enrol_course FOREIGN KEY (courseCode) REFERENCES course(courseCode)
);

CREATE INDEX idx_enrolment_course ON enrolment(courseCode);

CREATE TABLE grade_audit (
  audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  studentId NUMBER,
  courseCode VARCHAR2(10),
  old_grade NUMBER(5,2),
  new_grade NUMBER(5,2),
  changed_by VARCHAR2(128) DEFAULT USER,
  changed_at TIMESTAMP DEFAULT SYSTIMESTAMP
);
