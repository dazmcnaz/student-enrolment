-- Which courses average above 60 and the lecturer
SELECT c.courseTitle, l.lecturerName, COUNT(e.studentId) AS num_students, ROUND(AVG(e.grade), 1) AS average
FROM course c
JOIN enrolment e ON e.courseCode = c.courseCode
JOIN lecturer l ON l.lecturerId = c.lecturerId
GROUP BY c.courseCode, c.courseTitle, l.lecturerName
HAVING AVG(e.grade) > 60
ORDER BY average DESC;

-- How many students are enrolled and graded in every course
SELECT c.courseCode, c.courseTitle, COUNT(e.studentId) AS total_students, COUNT(e.grade) AS students_with_grade
FROM course c
LEFT JOIN enrolment e ON e.courseCode = c.courseCode
GROUP BY c.courseCode, c.courseTitle
ORDER BY c.courseCode;

-- Students who are not enrolled in anything
SELECT s.studentName, s.studentEmail
FROM student s
WHERE NOT EXISTS (SELECT 1 FROM enrolment e WHERE e.studentId = s.studentId);

-- Students who scored above their course's average (correlated subquery)
SELECT s.studentName, e.courseCode, e.grade
FROM enrolment e
JOIN student s ON s.studentId = e.studentId
WHERE e.grade > (SELECT AVG(e2.grade)
                 FROM   enrolment e2
                 WHERE  e2.courseCode = e.courseCode);

-- Students who scored above their course's average (inline view/derived table)
SELECT s.studentName, e.courseCode, e.grade
FROM enrolment e
JOIN student s ON s.studentId = e.studentId
JOIN (SELECT courseCode, AVG(grade) AS avg_grade
      FROM enrolment
      GROUP BY courseCode) a ON a.courseCode = e.courseCode
WHERE e.grade > a.avg_grade;
