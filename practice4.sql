desc employees;

select lower('database system') from dual;
select upper('database system') from dual;
select initcap('database system') from dual; -- �ܾ� �� ���� ���ڸ� �빮�ڷ�

select concat('data', 'base') from dual; -- 'data'|| 'base'�� ���� *

select substr('database', 2, 5) from dual;

select length('database') from dual; -- *

select instr('database', 'ba') from dual; -- ba�� ���°�� �����°�

select first_name, lpad(salary,10,'*') from employees; 
select first_name, Rpad(salary,10,'*') from employees; -- �� 10ĭ, *���� ���� ä���

select trim('#' from'###database###') from dual;
select trim(' ' from'   data base   ') from dual; -- ���� ����� ���� ����

select abs(-20000) from dual; -- ����
select floor(2.65) from dual; -- ���� ������ ������ �� ������ ������ ���� ū ����
select ceil(2.65) from dual; -- ���� ������ ������ �� ������ ũ�� ���� ���� ����
select power(2,10) from dual; -- ������
select trunc(3.145677, 2) from dual; -- �Ҽ��� �� �ڸ��� ǥ��

select first_name, hire_date from employees;
select first_name, to_char(hire_date, 'yyyy-mm-dd pm hh:mi:ss') from employees; -- *
select FIRST_NAME, to_char(HIRE_DATE, 'yyyy-mm-dd')as "hd" from employees where '2007'<='hd';
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual; -- * ���� �ð��� ��Ʈ������ �ٲ���
select to_date('2007-12-10', 'yyyy-mm-dd') from dual; -- * ��Ʈ���� ��¥�� �ٲ���

select first_name, to_char(salary, '999,999') from employees; -- ���� ���� , ���
select first_name, to_char(salary, 'L999,999') from employees; -- L�� ��ȭ
select to_char(-100, '99999MI') from dual;
select to_char(-100, '99999PR') from dual;

select to_char(10, 'RN') from dual;
select to_char(10, 'rn') from dual;

select to_char(-100, '$999999') from dual;
select to_char(100, '$999999') from dual;

select to_char(1024, 'xxxx') from dual;

select first_name, salary + salary*nvl(COMMISSION_PCT, 0) from employees;
select first_name, salary + salary*nvl2(COMMISSION_PCT, COMMISSION_PCT, 0) from employees;

select first_name, job_id, salary,
  case job_id
    when 'AD_VP' then salary*1.1
    when 'FI_MGI' then salary*1.5
    else salary
  end as "�̹��� ����"
from employees; -- if�� case

select first_name, job_id, salary,
  decode(job_id, 'AD_VP',  salary*1.1,
                 'FI_MGR', salary*1.5,
                           salary)
  as "�̹��� ����"
from employees; -- if�� decode