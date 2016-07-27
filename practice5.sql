-- join

SELECT e.first_name, d.department_id, d.department_name
  FROM employees e, departments d
 WHERE e.department_id = d.department_id AND e.salary > 5000; -- 조건 두개 (table 수 -1개의 조건이 반드시 필요함)

-- inner join
-- equi join

SELECT a.first_name, b.department_name
  FROM employees a, departments b
 WHERE a.department_id = b.department_id;

-- theta join

SELECT *
  FROM employees a, jobs b
 WHERE a.salary BETWEEN b.min_salary AND b.max_salary;

-- self join

SELECT a.first_name, b.first_name
  FROM employees a, employees b
 WHERE b.employee_id = a.manager_id; -- 더 나오게 하고 싶은 쪽에 +

-- outer join

SELECT a.first_name AS "사원", NVL (b.first_name, '없음') AS "매니저"
  FROM employees a, employees b
 WHERE b.employee_id(+) = a.manager_id;               -- 더 나오게 하고 싶은 쪽에 +

SELECT a.first_name, b.department_name
  FROM employees a, departments b
 WHERE b.department_id(+) = a.department_id;

-- natural join
-- 두개의 조인 조건이 의도하지 않았는데 걸림
-- department_id, manager_id

SELECT a.first_name, b.department_name
  FROM employees a NATURAL JOIN departments b; -- 조건이 없어도 join 가능, 두 테이블의 칼럼이름이 같을때

-- join ~ using

SELECT a.first_name, b.department_name
  FROM employees a JOIN departments b USING (department_id);

-- join ~ on

SELECT a.first_name, b.department_name
  FROM employees a JOIN departments b ON a.department_id = b.department_id;

-- select a.first_name, b.department_name from employees a, departments b where b.department_id = a.department_id;와 같음

-- left outer

SELECT a.first_name, b.department_name
  FROM employees a
       LEFT OUTER JOIN departments b ON a.department_id = b.department_id;

-- select a.first_name, b.department_name from employees a, departments b where b.department_id (+)= a.department_id;

SELECT a.first_name, b.department_name
  FROM employees a
       RIGHT OUTER JOIN departments b ON b.department_id = a.department_id;