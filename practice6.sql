-- 1.

SELECT e1.employee_id    AS "사번",
       e1.first_name     AS "이름",
       d.department_name AS "부서명",
       e2.first_name     AS "매니저"
  FROM employees e1, employees e2, departments d
 WHERE e1.department_id = d.department_id AND e1.employee_id = e2.manager_id;

-- 2.

  SELECT r.region_name AS "지역 이름", c.country_name AS "나라 이름"
    FROM countries c JOIN regions r ON r.region_id = c.region_id
ORDER BY r.region_name, c.country_name;

-- 3.

SELECT d.department_id   AS "부서 번호",
       d.department_name AS "이름",
       e.first_name      AS "매니저",
       l.city            AS "도시",
       c.COUNTRY_NAME    AS "나라",
       r.REGION_NAME     AS "지역"
  FROM departments d,
       employees   e,
       locations   l,
       countries   c,
       regions     r
 WHERE     d.manager_id = e.employee_id
       AND d.location_id = l.location_id
       AND l.country_id = c.country_id
       AND c.REGION_ID = r.REGION_ID;

-- 4.

SELECT e.employee_id                        AS "사번",
       (e.first_name || ' ' || e.last_name) AS "풀네임"
  FROM job_history jh, jobs j, employees e
 WHERE     e.employee_id = jh.employee_id
       AND j.job_id = jh.job_id
       AND j.job_title = 'Public Accountant';

-- 5.

  SELECT e.employee_id   AS "사번",
         e.first_name    AS "이름",
         e.last_name     AS "성",
         d.department_name AS "부서"
    FROM employees e JOIN departments d ON e.department_id = d.department_id
ORDER BY e.last_name;

-- 6.

SELECT e1.employee_id AS "나의 사번",
       e1.last_name   AS "나의 이름",
       e1.hire_date   AS "나의 고용일",
       e2.last_name   AS "매니저 이름",
       e2.hire_date   AS "매니저 고용일"
  FROM EMPLOYEES e1
       JOIN EMPLOYEES e2
          ON e1.EMPLOYEE_ID = e2.manager_id AND e1.HIRE_DATE < e2.HIRE_DATE;