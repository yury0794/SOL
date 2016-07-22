select * from jobs;

select * from departments;

select * from locations;

select * from job_history;

select first_name, last_name from employees where employee_id = 101;

select * from job_history where employee_id = 101;

select (first_name || ' ' || last_name) AS "full name" from employees where salary > 20000;

select job_id from jobs where job_title = 'President';

select first_name, job_id from employees where job_id <> 'AD PRES'; /* 'AD PRES'�� �����ϰ� ��� */

select * from locations where city = 'Roma';

select * from departments where location_id = 1000;

select * from departments;

select * from departments where location_id in(1700, 1800);

select * from departments where location_id = 1700 or location_id = 1800; /* ���� ���� */

select * from departments where location_id not in(1700, 1800);

select * from departments where location_id <> 1700 And location_id <> 1800; /* ���� ���� */

select * from employees where salary between 1000 and 10000;

select * from employees where 1000 <= salary and salary <= 10000;

select first_name from employees where first_name like 'A%'; /* A�� �����ϴ� �̸� */

select first_name from employees where first_name like '%s'; /* s�� ������ �̸� */

select first_name from employees where first_name like '%li%';

select first_name from employees where first_name like 'A___'; /* _�� ���ڼ� ���� */

select employee_id, commission_pct from employees where commission_pct is not null;

select first_name, last_name, salary from employees order by salary desc; /* �⺻�� ���� ���� asc, desc�� ���� ���� */

select first_name, last_name, salary from employees order by salary desc, first_name asc;














