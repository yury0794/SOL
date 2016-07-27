-- count

SELECT COUNT (*) FROM employees; -- 전체 칼럼 세기

SELECT COUNT (manager_id) FROM employees; -- null값은 세지 않음

-- avg

SELECT AVG (salary) FROM employees;

  SELECT department_id, TO_CHAR (AVG (salary), '99999')
    FROM employees
GROUP BY department_id;

  SELECT department_id,
         TO_CHAR (AVG (salary), '99,999'),
         TO_CHAR (SUM (salary), '999,999'),
         TO_CHAR (MAX (salary), '99,999'),
         TO_CHAR (MIN (salary), '99,999')
    FROM employees
GROUP BY department_id
ORDER BY AVG (salary);

  SELECT department_id, AVG (salary)
    FROM employees
GROUP BY department_id
  HAVING AVG (salary) > 5000; -- group by전에는 where 대신에 having을 쓴다
-- 사장님을 뺀 사원들의 부서별 평균 연봉이 5000이상인 부서와 평균 연봉을 평균 연봉이 높은 순으로 출력

  SELECT department_id, AVG (salary)
    FROM employees
   WHERE department_id IS NOT NULL
GROUP BY department_id
  HAVING AVG (salary) > 5000
ORDER BY AVG (salary);

-- subquery

SELECT salary
  FROM employees
 WHERE first_name = 'Jack';

SELECT first_name, salary
  FROM employees
 WHERE salary > 8400;

SELECT first_name, salary
  FROM employees
 WHERE salary > (SELECT salary
                   FROM employees
                  WHERE first_name = 'Jack');

-- 문제점

SELECT first_name, salary
  FROM employees
 WHERE salary > (SELECT salary
                   FROM employees
                  WHERE first_name = 'Karen'); -- 에러

SELECT salary
  FROM employees
 WHERE first_name = 'Karen'; -- 한개의 값과만 비교해야 하는데 값이 두개 나오기 때문이다

-- 연습

SELECT MIN (salary) FROM employees;

SELECT first_name, salary
  FROM employees
 WHERE salary = (SELECT MIN (salary) FROM employees);

SELECT first_name, salary
  FROM employees
 WHERE salary < (SELECT AVG (salary) FROM employees);

-- subquery의 결과가 one row

SELECT first_name, department_id
  FROM employees
 WHERE department_id = (SELECT department_id
                          FROM departments
                         WHERE department_name = 'Purchasing'); -- subquery

SELECT a.first_name, a.department_id
  FROM employees a, departments b
 WHERE a.department_id = b.department_id AND b.department_name = 'Purchasing'; -- join

-- subquery의 결과가 multi row

SELECT first_name, salary
  FROM employees
 WHERE salary IN (  SELECT MIN (salary)
                      FROM employees
                  GROUP BY department_id);

SELECT first_name, salary
  FROM employees
 WHERE salary = ANY (  SELECT MIN (salary)
                         FROM employees
                     GROUP BY department_id);

--multi row & multi colum

SELECT first_name, salary
  FROM employees
 WHERE (department_id, salary) IN (  SELECT department_id, MIN (salary)
                                       FROM employees
                                   GROUP BY department_id);

-- correlated query

SELECT first_name, salary
  FROM employees a
 WHERE salary = (SELECT MIN (salary)
                   FROM employees
                  WHERE department_id = a.department_id);

-- from 절에 select(select 결과를 테이블로 사용한다)*

  SELECT department_id, MIN (salary) AS min_salary
    FROM employees
GROUP BY department_id;

SELECT * FROM employees;

SELECT a.first_name, a.salary
  FROM employees a,
       (  SELECT department_id, MIN (salary) AS min_salary
            FROM employees
        GROUP BY department_id) b
 WHERE a.department_id = b.department_id AND a.salary = b.min_salary;