SELECT * FROM jobs;

SELECT * FROM departments;

SELECT * FROM locations;

SELECT * FROM job_history;

SELECT first_name, last_name
  FROM employees
 WHERE employee_id = 101;

SELECT *
  FROM job_history
 WHERE employee_id = 101;

SELECT (first_name || ' ' || last_name) AS "full name"
  FROM employees
 WHERE salary > 20000;

SELECT job_id
  FROM jobs
 WHERE job_title = 'President';

SELECT first_name, job_id
  FROM employees
 WHERE job_id <> 'AD PRES';

                                                                    /* 'AD PRES'를 제외하고 출력 */

SELECT *
  FROM locations
 WHERE city = 'Roma';

SELECT *
  FROM departments
 WHERE location_id = 1000;

SELECT * FROM departments;

SELECT *
  FROM departments
 WHERE location_id IN (1700, 1800);

SELECT *
  FROM departments
 WHERE location_id = 1700 OR location_id = 1800;

                                                                          /* 위랑 같음 */

SELECT *
  FROM departments
 WHERE location_id NOT IN (1700, 1800);

SELECT *
  FROM departments
 WHERE location_id <> 1700 AND location_id <> 1800;

                                                                             /* 위랑 같음 */

SELECT *
  FROM employees
 WHERE salary BETWEEN 1000 AND 10000;

SELECT *
  FROM employees
 WHERE 1000 <= salary AND salary <= 10000;

SELECT first_name
  FROM employees
 WHERE first_name LIKE 'A%';

                                                             /* A로 시작하는 이름 */

SELECT first_name
  FROM employees
 WHERE first_name LIKE '%s';

                                                             /* s로 끝나는 이름 */

SELECT first_name
  FROM employees
 WHERE first_name LIKE '%li%';

SELECT first_name
  FROM employees
 WHERE first_name LIKE 'A___';

                                                               /* _는 글자수 제한 */

SELECT employee_id, commission_pct
  FROM employees
 WHERE commission_pct IS NOT NULL;

  SELECT first_name, last_name, salary
    FROM employees
ORDER BY salary DESC;

                                                                          /* 기본이 내림 차순 asc, desc는 오름 차순 */

  SELECT first_name, last_name, salary
    FROM employees
ORDER BY salary DESC, first_name ASC;