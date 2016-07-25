-- 1.
select e1.employee_id as "���", e1.first_name as "�̸�", d.department_name as "�μ���", e2.first_name as "�Ŵ���"
  from employees e1, employees e2, departments d
    where e1.department_id = d.department_id and e1.employee_id = e2.manager_id;

-- 2.
select r.region_name as "���� �̸�", c.country_name as "���� �̸�" from countries c join regions r on r.region_id = c.region_id order by r.region_name, c.country_name;

-- 3.
select d.department_id as "�μ� ��ȣ", d.department_name as "�̸�", e.first_name as "�Ŵ���", l.city as "����", c.COUNTRY_NAME as "����", r.REGION_NAME as "����"
  from departments d, employees e, locations l, countries c, regions r
    where d.manager_id = e.employee_id and d.location_id = l.location_id and l.country_id = c.country_id and c.REGION_ID = r.REGION_ID;
    
-- 4.
select e.employee_id as "���", (e.first_name || ' ' || e.last_name) as "Ǯ����"
  from job_history jh , jobs j, employees e
    where e.employee_id = jh.employee_id and j.job_id = jh.job_id and j.job_title = 'Public Accountant';
    
-- 5.
select e.employee_id as "���", e.first_name as "�̸�", e.last_name as "��", d.department_name as "�μ�"
  from employees e join departments d on e.department_id = d.department_id order by e.last_name;
  
-- 6.
select e1.employee_id as "���� ���", e1.last_name as "���� �̸�", e1.hire_date as "���� �����", e2.last_name as "�Ŵ��� �̸�", e2.hire_date as "�Ŵ��� �����"
  from EMPLOYEES e1 join EMPLOYEES e2 on e1.EMPLOYEE_ID = e2.manager_id and e1.HIRE_DATE < e2.HIRE_DATE;







