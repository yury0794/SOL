-- 1.

  SELECT (first_name || ' ' || last_name) AS "이름",
         email                          AS "이메일",
         phone_number                   AS "전화번호"
    FROM EMPLOYEES
ORDER BY hire_date ASC;

-- 2.

  SELECT JOB_TITLE, max_salary
    FROM JOBS
ORDER BY max_salary DESC;

-- 3.

SELECT COUNT (*) AS "매니저 없는 직원"
  FROM employees
 WHERE manager_id IS NULL;

-- 4.

  SELECT *
    FROM jobs
ORDER BY JOB_TITLE DESC, MAX_SALARY DESC;

-- 5.

SELECT COUNT (department_id) AS "부서 총 수" FROM DEPARTMENTS;

-- 6.

  SELECT department_name
    FROM DEPARTMENTS
ORDER BY LENGTH (department_name) DESC;

-- 7.

SELECT COUNT (*) AS "매니저 없는 부서"
  FROM departments
 WHERE MANAGER_ID IS NULL;

-- 8.

  SELECT UPPER (COUNTRY_NAME)
    FROM COUNTRIES
ORDER BY COUNTRY_NAME;

-- 9.

SELECT COUNT (*) AS "지역 수" FROM REGIONS;

  SELECT *
    FROM REGIONS
ORDER BY LENGTH (region_name);

-- 10.

SELECT DISTINCT (LOWER (city))
  FROM locations;