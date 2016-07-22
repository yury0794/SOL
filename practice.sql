SELECT EMPLOYEE_ID, SALARY, COMMISSION_PCT FROM employees;

select first_name, last_name from employees;

select first_name "이름" from employees; -- 가능하면 ""를 붙인다. as(alias)가 생략되었다

select (first_name || ' ' || last_name) as "name" from employees; -- 문자열 합치기 ||

select 2+3 from dual;

select (salary + salary*0.5) as "salary" from employees;

select employee_id, commission_pct, nvl(salary+commission_pct, 0)from employees; -- nullvalue(가져오고 싶은 값이 null이면, 이 값으로 표시해라)

select employee_id, 1000, sysdate from employees; -- 지금 날짜

select '성은' || last_name || '이요, 이름은' || first_name || '이다' from employees;

select first_name, salary from employees where employee_id = 200; -- employees 테이블에서 employee_id가 200인 사람의 first_name, salary를 표시해라