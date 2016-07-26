-- count
select count(*) from employees; -- 전체 칼럼 세기
select count(manager_id) from employees; -- null값은 세지 않음

-- avg
select avg(salary) from employees;
select department_id, to_char(avg(salary), '99999') from employees group by department_id;
select department_id, to_char(avg(salary), '99,999'), to_char(sum(salary), '999,999'), to_char(max(salary), '99,999'), to_char(min(salary), '99,999')
  from employees group by department_id order by avg(salary);

select department_id, avg(salary) from employees group by department_id having avg(salary)>5000; -- group by전에는 where 대신에 having을 쓴다
-- 사장님을 뺀 사원들의 부서별 평균 연봉이 5000이상인 부서와 평균 연봉을 평균 연봉이 높은 순으로 출력
select department_id, avg(salary) from employees where department_id is not null
  group by department_id having avg(salary)>5000 order by avg(salary);
  
-- subquery
select salary from employees where first_name='Jack';
select first_name, salary from employees where salary>8400;
select first_name, salary from employees where salary>(select salary from employees where first_name='Jack');

-- 문제점
select first_name, salary from employees where salary>(select salary from employees where first_name='Karen'); -- 에러
select salary from employees where first_name='Karen'; -- 한개의 값과만 비교해야 하는데 값이 두개 나오기 때문이다

-- 연습
select min(salary) from employees;
select first_name, salary from employees where salary = (select min(salary) from employees);
select first_name, salary from employees where salary < (select avg(salary) from employees);

-- subquery의 결과가 one row
select first_name, department_id from employees
  where department_id = (select department_id from departments where department_name='Purchasing'); -- subquery
select a.first_name, a.department_id from employees a, departments b
  where a.department_id=b.department_id and b.department_name='Purchasing'; -- join

-- subquery의 결과가 multi row
select first_name, salary from employees where salary in (select min(salary) from employees group by department_id);
select first_name, salary from employees where salary = any (select min(salary) from employees group by department_id);

--multi row & multi colum
select first_name, salary from employees
  where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);

-- correlated query
select first_name, salary from employees a where salary = (select min(salary) from employees where department_id = a.department_id);

-- from 절에 select(select 결과를 테이블로 사용한다)*
select department_id, min(salary) as min_salary from employees group by department_id;
select * from employees;
select a.first_name, a.salary from employees a, (select department_id, min(salary) as min_salary from employees group by department_id) b
  where a.department_id = b.department_id and a.salary = b.min_salary;