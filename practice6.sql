-- 1.
select e1.employee_id as "사번", e1.first_name as "이름", d.department_name as "부서명", e2.first_name as "매니저"
  from employees e1, employees e2, departments d
    where e1.department_id = d.department_id and e1.employee_id = e2.manager_id;

-- 2.
select r.region_name as "지역 이름", c.country_name as "나라 이름" from countries c join regions r on r.region_id = c.region_id order by r.region_name, c.country_name;

-- 3.
select d.department_id as "부서 번호", d.department_name as "이름", e.first_name as "매니저", l.city as "도시", c.COUNTRY_NAME as "나라", r.REGION_NAME as "지역"
  from departments d, employees e, locations l, countries c, regions r
    where d.manager_id = e.employee_id and d.location_id = l.location_id and l.country_id = c.country_id and c.REGION_ID = r.REGION_ID;
    
-- 4.
select e.employee_id as "사번", (e.first_name || ' ' || e.last_name) as "풀네임"
  from job_history jh , jobs j, employees e
    where e.employee_id = jh.employee_id and j.job_id = jh.job_id and j.job_title = 'Public Accountant';
    
-- 5.
select e.employee_id as "사번", e.first_name as "이름", e.last_name as "성", d.department_name as "부서"
  from employees e join departments d on e.department_id = d.department_id order by e.last_name;
  
-- 6.
select e1.employee_id as "나의 사번", e1.last_name as "나의 이름", e1.hire_date as "나의 고용일", e2.last_name as "매니저 이름", e2.hire_date as "매니저 고용일"
  from EMPLOYEES e1 join EMPLOYEES e2 on e1.EMPLOYEE_ID = e2.manager_id and e1.HIRE_DATE < e2.HIRE_DATE;







