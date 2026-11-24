INSERT INTO lecturer VALUES (1, 'Temba Bavuma', 'L03');
INSERT INTO lecturer VALUES (2, 'Marques Ackerman', 'L07');
INSERT INTO lecturer VALUES (3, 'Aiden Markram', 'L12');

INSERT INTO course VALUES ('PROG6212', 'Programming 2B', 1);
INSERT INTO course VALUES ('INSY7213', 'Database Programming', 2);
INSERT INTO course VALUES ('CLDV6211', 'Cloud Development A', 3);
INSERT INTO course VALUES ('PROG7312', 'Advanced Programming', 1);

INSERT INTO student VALUES (1, 'Pat Cummins', 'pat@example.com');
INSERT INTO student VALUES (2, 'David Warner', 'david@example.com');
INSERT INTO student VALUES (3, 'Steve Smith', 'steve@example.com');
INSERT INTO student VALUES (4, 'Bryan Mbuemo', 'bryan@example.com');
INSERT INTO student VALUES (5, 'Bruno Fernandes', 'bruno@example.com');
INSERT INTO student VALUES (6, 'Cameron Bancroft', 'nadia@example.com');

INSERT INTO student_phone VALUES (1, '0821112222');
INSERT INTO student_phone VALUES (1, '0713334444');
INSERT INTO student_phone VALUES (3, '0835556666');

INSERT INTO enrolment VALUES (1, 'PROG6212', 72);
INSERT INTO enrolment VALUES (2, 'PROG6212', 58);
INSERT INTO enrolment VALUES (3, 'PROG6212', 81);
INSERT INTO enrolment VALUES (4, 'PROG6212', NULL);
INSERT INTO enrolment VALUES (1, 'INSY7213', 65);
INSERT INTO enrolment VALUES (2, 'INSY7213', 49);
INSERT INTO enrolment VALUES (5, 'INSY7213', 55);
INSERT INTO enrolment VALUES (3, 'CLDV6211', 90);
INSERT INTO enrolment VALUES (5, 'CLDV6211', 77);
INSERT INTO enrolment VALUES (1, 'CLDV6211', NULL);

COMMIT;
