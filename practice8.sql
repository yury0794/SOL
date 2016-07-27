-- 1.

SELECT MAX (salary)                  "최고임금",
       MIN (salary)                  "최저임금",
       (MAX (salary) - MIN (salary)) "최고임금 – 최저임금"
  FROM employees;

-- 2.

SELECT TO_CHAR (MAX (hire_date), 'yyyy"년" mm"월" dd"일"')
          "최근 신입사원"
  FROM employees;

-- 3.

  SELECT department_id                  "부서",
         TO_CHAR (AVG (salary), '99,999')"평균연봉",
         TO_CHAR (MAX (salary), '99,999')"최고연봉",
         TO_CHAR (MIN (salary), '99,999')"최저연봉"
    FROM employees
GROUP BY department_id
ORDER BY AVG (salary) DESC, MAX (salary) DESC, MIN (salary) DESC;

-- 4.

  SELECT job_id                         "업무",
         TO_CHAR (AVG (salary), '99,999')"평균연봉",
         TO_CHAR (MAX (salary), '99,999')"최고연봉",
         TO_CHAR (MIN (salary), '99,999')"최저연봉"
    FROM employees
GROUP BY job_id
ORDER BY AVG (salary) DESC, MAX (salary) DESC, MIN (salary) DESC;

-- 5.

SELECT TO_CHAR (MIN (hire_date), 'yyyy"년" mm"월" dd"일"')
          "가장 오래 일한 사원"
  FROM employees;

-- 6.

  SELECT department_id                  "부서",
         TO_CHAR (AVG (salary), '99,999')"평균연봉",
         TO_CHAR (MIN (salary), '99,999')"최저연봉",
         TO_CHAR ( (AVG (salary) - MIN (salary)), '99,999')
            "평균연봉-최저연봉"
    FROM employees
   WHERE department_id IS NOT NULL
GROUP BY department_id
  HAVING AVG (salary) - MIN (salary) < 2000
ORDER BY "평균연봉-최저연봉" DESC;

-- 7.

  SELECT job_id                    "업무",
         MAX (salary) - MIN (salary)"최고연봉-최저연봉"
    FROM employees
GROUP BY job_id
ORDER BY "최고연봉-최저연봉" DESC;

  SELECT MAX (MAX (salary) - MIN (salary))"가장 큰 연봉 차이"
    FROM employees
GROUP BY job_id;

SELECT MAX ("최고연봉-최저연봉")"가장 큰 연봉 차이"
  FROM (  SELECT job_id                    "업무",
                 MAX (salary) - MIN (salary)"최고연봉-최저연봉"
            FROM employees
        GROUP BY job_id);