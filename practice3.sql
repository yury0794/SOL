-- 1.
select (first_name || ' ' ||last_name) as "�̸�", email as "�̸���", phone_number as "��ȭ��ȣ" from EMPLOYEES order by hire_date asc;

-- 2.
select JOB_TITLE, max_salary from JOBS order by max_salary desc;

-- 3.
select count(*) as "�Ŵ��� ���� ����" from employees where manager_id is null;

-- 4.
select * from jobs order by JOB_TITLE desc, MAX_SALARY desc;

-- 5.
select count(department_id) as "�μ� �� ��"from DEPARTMENTS;

-- 6.
select department_name from DEPARTMENTS order by length(department_name) desc;

-- 7.
select count(*) as "�Ŵ��� ���� �μ�" from departments where MANAGER_ID is null;

-- 8. 
select upper(COUNTRY_NAME)  from COUNTRIES order by COUNTRY_NAME;

-- 9. 
select count(*) as "���� ��" from REGIONS;
select * from REGIONS order by length(region_name);

-- 10.
SELECT distinct(LOWER(city)) FROM locations;


