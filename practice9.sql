-- 1.
select count(*) as "평균이하 연봉" from employees where salary < (select avg(salary) from employees);

-- 2.
select employee_id as "사번", last_name as "성", salary as "연봉" from employees
  where (department_id, salary) in (select department_id, max(salary) from employees group by department_id) order by salary desc;

-- 3.
select j.job_title as "업무명", e.salary as "연봉" from employees e, jobs j
  where e.job_id = j.job_id and (e.job_id, e.salary) in (select job_id, sum(salary) from employees group by job_id) order by e.salary desc;
  
-- 4.
select a.employee_id  as "사번", a.last_name as "성", a.salary as "연봉" from employees a , (select department_id, avg(salary) as avg_salary from employees group by department_id) b
where a.salary > b.avg_salary;

-- 1.
select e.first_name || ' ' || e.last_name as "이름", e.salary as "연봉", d.department_name as "부서명" from employees e, departments d
  where e.department_id = d.department_id and e.hire_date = (select max(hire_date) from employees);
  
-- 2.
select a.employee_id as "사번", a.last_name as "성", a.salary as "연봉" from employees a , (select department_id, avg(salary) as avg_salary from employees group by department_id) b
where a.salary > b.avg_salary;

-- 3.
select a.employee_id  as "사번", a.first_name as "이름", a.last_name as "성", c.job_title as "업무명", a.salary as "연봉"
  from employees a, (select department_id, avg(salary) as ag from employees group by department_id) b, jobs c
  where a.department_id = b.department_id and b.ag = (select max(avg(salary)) from employees group by department_id)
  and a.job_id=c.job_id;

-- 4.
select a.department_name  as "부서명" from departments a, (select department_id, avg(salary) from employees group by department_id
having avg(salary) = (select max(avg(salary)) from employees group by department_id)) b where a.DEPARTMENT_ID = b.department_id;

-- 5.
select a.city as "도시" from locations a, (select a.department_name, a.location_id from departments a, (select department_id, avg(salary) from employees group by department_id
having avg(salary) = (select max(avg(salary)) from employees group by department_id)) b where a.DEPARTMENT_ID = b.department_id) b
where a.location_id = b.location_id;

-- 6.
select a.job_title as "업무명" from jobs a, (select job_id, avg(salary) from employees group by job_id
having avg(salary) = (select max(avg(salary)) from employees group by job_id)) b where a.job_id = b.job_id;