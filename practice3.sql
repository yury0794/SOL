-- 1.
select (first_name || ' ' ||last_name) as "이름", email as "이메일", phone_number as "전화번호" from EMPLOYEES order by hire_date asc;

-- 2.
select JOB_TITLE, max_salary from JOBS order by max_salary desc;

-- 3.
select count(*) as "매니저 없는 직원" from employees where manager_id is null;

-- 4.
select * from jobs order by JOB_TITLE desc, MAX_SALARY desc;

-- 5.
select count(department_id) as "부서 총 수"from DEPARTMENTS;

-- 6.
select department_name from DEPARTMENTS order by length(department_name) desc;

-- 7.
select count(*) as "매니저 없는 부서" from departments where MANAGER_ID is null;

-- 8. 
select upper(COUNTRY_NAME)  from COUNTRIES order by COUNTRY_NAME;

-- 9. 
select count(*) as "지역 수" from REGIONS;
select * from REGIONS order by length(region_name);

-- 10.
SELECT distinct(LOWER(city)) FROM locations;