SELECT EMPLOYEE_ID, SALARY, COMMISSION_PCT FROM employees;

select first_name, last_name from employees;

select first_name "�̸�" from employees; -- �����ϸ� ""�� ���δ�. as(alias)�� �����Ǿ���

select (first_name || ' ' || last_name) as "name" from employees; -- ���ڿ� ��ġ�� ||

select 2+3 from dual;

select (salary + salary*0.5) as "salary" from employees;

select employee_id, commission_pct, nvl(salary+commission_pct, 0)from employees; -- nullvalue(�������� ���� ���� null�̸�, �� ������ ǥ���ض�)

select employee_id, 1000, sysdate from employees; -- ���� ��¥

select '����' || last_name || '�̿�, �̸���' || first_name || '�̴�' from employees;

select first_name, salary from employees where employee_id = 200; -- employees ���̺��� employee_id�� 200�� ����� first_name, salary�� ǥ���ض�