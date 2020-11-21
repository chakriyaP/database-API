กรณีเข้ามาหน้า employee
SELECT * 
FROM employee;



กรณี ใส่แต่ eid
SELECT * 
FROM employee
WHERE eid LIKE '%E0000001%';

กรณี ใส่แต่ empname
SELECT * 
FROM employee
WHERE empname LIKE '%kuy%';

กรณี ใส่แต่ empphone
SELECT * 
FROM employee
WHERE empphone LIKE '%099555%';

กรณี ใส่ eid และ empname
SELECT * 
FROM employee
WHERE eid LIKE '%E0000001%' OR empname LIKE '%f%';

กรณี ใส่ eid และ empphone
SELECT * 
FROM employee
WHERE eid LIKE '%E0000001%' OR empphone LIKE '%f%';

กรณี ใส่ empname และ empphone
SELECT * 
FROM employee
WHERE empname LIKE '%f%' OR empphone LIKE '%f%';

กรณี 3 input
SELECT * 
FROM employee
WHERE eid LIKE '%E0000001%' OR empname LIKE '%f%' OR empphone LIKE '%f%';