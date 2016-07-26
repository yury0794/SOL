-- 1.
select max(salary) "최고임금", min(salary) "최저임금", (max(salary)-min(salary)) "최고임금 – 최저임금" from employees;

-- 2.
select to_char(max(hire_date),'yyyy"년" mm"월" dd"일"') "최근 신입사원" from employees;

-- 3.
select department_id "부서", to_char(avg(salary), '99,999') "평균연봉", to_char(max(salary), '99,999') "최고연봉", to_char(min(salary), '99,999') "최저연봉"
  from employees group by department_id order by avg(salary) desc, max(salary) desc, min(salary) desc;
  
-- 4.
select job_id "업무", to_char(avg(salary), '99,999') "평균연봉", to_char(max(salary), '99,999') "최고연봉", to_char(min(salary), '99,999') "최저연봉"
  from employees group by job_id order by avg(salary) desc, max(salary) desc, min(salary) desc;
  
-- 5.
select to_char(min(hire_date),'yyyy"년" mm"월" dd"일"') "가장 오래 일한 사원" from employees;

-- 6.
select department_id "부서", to_char(avg(salary), '99,999') "평균연봉", to_char(min(salary), '99,999') "최저연봉", to_char((avg(salary)-min(salary)), '99,999') "평균연봉-최저연봉"
  from employees where department_id is not null group by department_id
    having avg(salary)-min(salary) < 2000 order by "평균연봉-최저연봉" desc;
    
-- 7.
select job_id "업무", max(salary)-min(salary) "최고연봉-최저연봉" from employees group by job_id order by "최고연봉-최저연봉" desc;
select max(max(salary)-min(salary)) "가장 큰 연봉 차이" from employees group by job_id;
select max("최고연봉-최저연봉") "가장 큰 연봉 차이" from (select job_id "업무", max(salary)-min(salary) "최고연봉-최저연봉" from employees group by job_id);