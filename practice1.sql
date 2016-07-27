SELECT EMPLOYEE_ID, SALARY, COMMISSION_PCT FROM employees;

SELECT first_name, last_name FROM employees;

SELECT first_name "이름" FROM employees;     -- 가능하면 ""를 붙인다. as(alias)가 생략되었다

SELECT (first_name || ' ' || last_name) AS "name"
  FROM employees; -- 문자열 합치기 ||

SELECT 2 + 3
  FROM DUAL;

SELECT (salary + salary * 0.5) AS "salary"
  FROM employees;

SELECT employee_id, commission_pct, NVL (salary + commission_pct, 0)
  FROM employees; -- nullvalue(가져오고 싶은 값이 null이면, 이 값으로 표시해라)

SELECT employee_id, 1000, SYSDATE FROM employees; -- 지금 날짜

SELECT '성은' || last_name || '이요, 이름은' || first_name || '이다'
  FROM employees;

SELECT first_name, salary
  FROM employees
 WHERE employee_id = 200; -- employees 테이블에서 employee_id가 200인 사람의 first_name, salary를 표시해라
