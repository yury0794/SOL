-- join
select e.first_name, d.department_id, d.department_name from employees e, departments d
  where e.department_id = d.department_id and e.salary > 5000; -- 조건 두개 (table 수 -1개의 조건이 반드시 필요함)
  
-- inner join
-- equi join
select a.first_name, b.department_name from employees a, departments b where a.department_id = b.department_id;

-- theta join
select * from employees a, jobs b where a.salary between b.min_salary and b. max_salary;

-- self join
select a.first_name, b.first_name from employees a, employees b where b.employee_id = a.manager_id; -- 더 나오게 하고 싶은 쪽에 +

-- outer join
select a.first_name as "사원", nvl(b.first_name, '없음') as "매니저" from employees a, employees b where b.employee_id (+) = a.manager_id; -- 더 나오게 하고 싶은 쪽에 +
select a.first_name, b.department_name from employees a, departments b where b.department_id (+)= a.department_id;

-- natural join
-- 두개의 조인 조건이 의도하지 않았는데 걸림
-- department_id, manager_id
select a.first_name, b.department_name from employees a natural join departments b; -- 조건이 없어도 join 가능, 두 테이블의 칼럼이름이 같을때

-- join ~ using
select a.first_name, b.department_name from employees a join departments b using(department_id);

-- join ~ on
select a.first_name, b.department_name from employees a join departments b on a.department_id = b.department_id;
-- select a.first_name, b.department_name from employees a, departments b where b.department_id = a.department_id;와 같음

-- left outer
select a.first_name, b.department_name from employees a left outer join departments b on a.department_id = b.department_id;
-- select a.first_name, b.department_name from employees a, departments b where b.department_id (+)= a.department_id;

select a.first_name, b.department_name from employees a right outer join departments b on  b.department_id= a.department_id;