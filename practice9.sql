-- 1.

SELECT COUNT (*) AS "평균이하 연봉"
  FROM employees
 WHERE salary < (SELECT AVG (salary) FROM employees);

-- 2.

  SELECT employee_id AS "사번", last_name AS "성", salary AS "연봉"
    FROM employees
   WHERE (department_id, salary) IN (  SELECT department_id, MAX (salary)
                                         FROM employees
                                     GROUP BY department_id)
ORDER BY salary DESC;

-- 3.

  SELECT j.job_title AS "업무명", e.salary AS "연봉"
    FROM employees e, jobs j
   WHERE     e.job_id = j.job_id
         AND (e.job_id, e.salary) IN (  SELECT job_id, SUM (salary)
                                          FROM employees
                                      GROUP BY job_id)
ORDER BY e.salary DESC;

-- 4.

SELECT a.employee_id AS "사번", a.last_name AS "성", a.salary AS "연봉"
  FROM employees a,
       (  SELECT department_id, AVG (salary) AS avg_salary
            FROM employees
        GROUP BY department_id) b
 WHERE a.salary > b.avg_salary;

-- 1.

SELECT e.first_name || ' ' || e.last_name AS "이름",
       e.salary                           AS "연봉",
       d.department_name                  AS "부서명"
  FROM employees e, departments d
 WHERE     e.department_id = d.department_id
       AND e.hire_date = (SELECT MAX (hire_date) FROM employees);

-- 2.

SELECT a.employee_id AS "사번", a.last_name AS "성", a.salary AS "연봉"
  FROM employees a,
       (  SELECT department_id, AVG (salary) AS avg_salary
            FROM employees
        GROUP BY department_id) b
 WHERE a.salary > b.avg_salary;

-- 3.

SELECT a.employee_id AS "사번",
       a.first_name  AS "이름",
       a.last_name   AS "성",
       c.job_title   AS "업무명",
       a.salary      AS "연봉"
  FROM employees a,
       (  SELECT department_id, AVG (salary) AS ag
            FROM employees
        GROUP BY department_id) b,
       jobs      c
 WHERE     a.department_id = b.department_id
       AND b.ag = (  SELECT MAX (AVG (salary))
                       FROM employees
                   GROUP BY department_id)
       AND a.job_id = c.job_id;

-- 4.

SELECT a.department_name AS "부서명"
  FROM departments a,
       (  SELECT department_id, AVG (salary)
            FROM employees
        GROUP BY department_id
          HAVING AVG (salary) = (  SELECT MAX (AVG (salary))
                                     FROM employees
                                 GROUP BY department_id)) b
 WHERE a.DEPARTMENT_ID = b.department_id;

-- 5.

SELECT city AS "도시"
  FROM locations
 WHERE location_id =
          (  SELECT location_id
               FROM (SELECT b.location_id, a.salary
                       FROM employees a, departments b
                      WHERE a.department_id = b.department_id)
           GROUP BY location_id
             HAVING AVG (salary) =
                       (  SELECT MAX (AVG (salary))
                            FROM (SELECT b.location_id, a.salary
                                    FROM employees a, departments b
                                   WHERE a.department_id = b.department_id)
                        GROUP BY location_id));

-- 6.

SELECT a.job_title AS "업무명"
  FROM jobs a,
       (  SELECT job_id, AVG (salary)
            FROM employees
        GROUP BY job_id
          HAVING AVG (salary) = (  SELECT MAX (AVG (salary))
                                     FROM employees
                                 GROUP BY job_id)) b
 WHERE a.job_id = b.job_id;