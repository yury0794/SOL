desc employees;

select lower('database system') from dual;
select upper('database system') from dual;
select initcap('database system') from dual; -- 단어 맨 앞의 글자를 대문자로

select concat('data', 'base') from dual; -- 'data'|| 'base'와 같다 *

select substr('database', 2, 5) from dual;

select length('database') from dual; -- *

select instr('database', 'ba') from dual; -- ba가 몇번째에 나오는가

select first_name, lpad(salary,10,'*') from employees; 
select first_name, Rpad(salary,10,'*') from employees; -- 총 10칸, *으로 공백 채우기

select trim('#' from'###database###') from dual;
select trim(' ' from'   data base   ') from dual; -- 글자 가운데는 제거 안함

select abs(-20000) from dual; -- 절댓값
select floor(2.65) from dual; -- 가장 근접한 수에서 이 수보다 작지만 가장 큰 정수
select ceil(2.65) from dual; -- 가장 근접한 수에서 이 수보다 크고 가장 작은 정수
select power(2,10) from dual; -- 제곱근
select trunc(3.145677, 2) from dual; -- 소수점 밑 자릿수 표시

select first_name, hire_date from employees;
select first_name, to_char(hire_date, 'yyyy-mm-dd pm hh:mi:ss') from employees; -- *
select FIRST_NAME, to_char(HIRE_DATE, 'yyyy-mm-dd')as "hd" from employees where '2007'<='hd';
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual; -- * 지금 시간을 스트링으로 바꿔줌
select to_date('2007-12-10', 'yyyy-mm-dd') from dual; -- * 스트링을 날짜로 바꿔줌

select first_name, to_char(salary, '999,999') from employees; -- 숫자 사이 , 찍기
select first_name, to_char(salary, 'L999,999') from employees; -- L은 원화
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
  end as "이번달 월급"
from employees; -- java의 if문과 같은 case

select first_name, job_id, salary,
  decode(job_id, 'AD_VP',  salary*1.1,
                 'FI_MGR', salary*1.5,
                           salary)
  as "이번달 월급"
from employees; -- java의 if문과 같은 decode