-- join
select e.first_name, d.department_id, d.department_name from employees e, departments d
  where e.department_id = d.department_id and e.salary > 5000; -- ���� �ΰ� (table �� -1���� ������ �ݵ�� �ʿ���)
  
-- inner join
-- equi join
select a.first_name, b.department_name from employees a, departments b where a.department_id = b.department_id;

-- theta join
select * from employees a, jobs b where a.salary between b.min_salary and b. max_salary;

-- self join
select a.first_name, b.first_name from employees a, employees b where b.employee_id = a.manager_id; -- �� ������ �ϰ� ���� �ʿ� +

-- outer join
select a.first_name as "���", nvl(b.first_name, '����') as "�Ŵ���" from employees a, employees b where b.employee_id (+) = a.manager_id; -- �� ������ �ϰ� ���� �ʿ� +
select a.first_name, b.department_name from employees a, departments b where b.department_id (+)= a.department_id;

-- natural join
-- �ΰ��� ���� ������ �ǵ����� �ʾҴµ� �ɸ�
-- department_id, manager_id
select a.first_name, b.department_name from employees a natural join departments b; -- ������ ��� join ����, �� ���̺��� Į���̸��� ������

-- join ~ using
select a.first_name, b.department_name from employees a join departments b using(department_id);

-- join ~ on
select a.first_name, b.department_name from employees a join departments b on a.department_id = b.department_id;
-- select a.first_name, b.department_name from employees a, departments b where b.department_id = a.department_id;�� ����

-- left outer
select a.first_name, b.department_name from employees a left outer join departments b on a.department_id = b.department_id;
-- select a.first_name, b.department_name from employees a, departments b where b.department_id (+)= a.department_id;

select a.first_name, b.department_name from employees a right outer join departments b on  b.department_id= a.department_id;