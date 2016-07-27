DESC employees;

SELECT LOWER ('database system') FROM DUAL;

SELECT UPPER ('database system') FROM DUAL;

SELECT INITCAP ('database system') FROM DUAL; -- 단어 맨 앞의 글자를 대문자로

SELECT CONCAT ('data', 'base') FROM DUAL; -- 'data'|| 'base'와 같다 *

SELECT SUBSTR ('database', 2, 5) FROM DUAL;

SELECT LENGTH ('database') FROM DUAL; -- *

SELECT INSTR ('database', 'ba') FROM DUAL; -- ba가 몇번째에 나오는가

SELECT first_name, LPAD (salary, 10, '*') FROM employees;

SELECT first_name, RPAD (salary, 10, '*') FROM employees; -- 총 10칸, *으로 공백 채우기

SELECT TRIM ('#' FROM '###database###') FROM DUAL;

SELECT TRIM (' ' FROM '   data base   ') FROM DUAL; -- 글자 가운데는 제거 안함

SELECT ABS (-20000) FROM DUAL; -- 절댓값

SELECT FLOOR (2.65) FROM DUAL; -- 가장 근접한 수에서 이 수보다 작지만 가장 큰 정수

SELECT CEIL (2.65) FROM DUAL; -- 가장 근접한 수에서 이 수보다 크고 가장 작은 정수

SELECT POWER (2, 10) FROM DUAL; -- 제곱근

SELECT TRUNC (3.145677, 2) FROM DUAL; -- 소수점 밑 자릿수 표시

SELECT first_name, hire_date FROM employees;

SELECT first_name, TO_CHAR (hire_date, 'yyyy-mm-dd pm hh:mi:ss')
  FROM employees; -- *

SELECT FIRST_NAME, TO_CHAR (HIRE_DATE, 'yyyy-mm-dd') AS "hd"
  FROM employees
 WHERE '2007' <= 'hd';

SELECT TO_CHAR (SYSDATE, 'yyyy-mm-dd hh:mi:ss') FROM DUAL; -- * 지금 시간을 스트링으로 바꿔줌

SELECT TO_DATE ('2007-12-10', 'yyyy-mm-dd') FROM DUAL; -- * 스트링을 날짜로 바꿔줌

SELECT first_name, TO_CHAR (salary, '999,999') FROM employees; -- 숫자 사이 , 찍기

SELECT first_name, TO_CHAR (salary, 'L999,999') FROM employees; -- L은 원화

SELECT TO_CHAR (-100, '99999MI') FROM DUAL;

SELECT TO_CHAR (-100, '99999PR') FROM DUAL;

SELECT TO_CHAR (10, 'RN') FROM DUAL;

SELECT TO_CHAR (10, 'rn') FROM DUAL;

SELECT TO_CHAR (-100, '$999999') FROM DUAL;

SELECT TO_CHAR (100, '$999999') FROM DUAL;

SELECT TO_CHAR (1024, 'xxxx') FROM DUAL;

SELECT first_name, salary + salary * NVL (COMMISSION_PCT, 0)
  FROM employees;

SELECT first_name, salary + salary * NVL2 (COMMISSION_PCT, COMMISSION_PCT, 0)
  FROM employees;

SELECT first_name,
       job_id,
       salary,
       CASE job_id
          WHEN 'AD_VP' THEN salary * 1.1
          WHEN 'FI_MGI' THEN salary * 1.5
          ELSE salary
       END
          AS "이번달 월급"
  FROM employees; -- java의 if문과 같은 case

SELECT first_name,
       job_id,
       salary,
       DECODE (job_id,
               'AD_VP', salary * 1.1,
               'FI_MGR', salary * 1.5,
               salary)
          AS "이번달 월급"
  FROM employees; -- java의 if문과 같은 decode
