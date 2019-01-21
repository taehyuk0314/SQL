create view emp as
select employee_id eid,
first_name fname,
last_name lname,
email email,
phone_number phone,
hire_date hdate,
job_id jid,
salary sal,
commission_pct comm,
manager_id mid,
department_id did
 from EMPLOYEES;
 
desc jobs;
create view job as
select
JOB_ID jid,
JOB_TITLE jti,
MIN_SALARY nsal,
MAX_SALARY xsal
from jobs;
desc DEPARTMENTS;
create view DEPART as
select
    DEPARTMENT_ID did,
    DEPARTMENT_NAME dname,
    MANAGER_ID mid,
    LOCATION_ID lid
from DEPARTMENTS;

desc LOCATIONS;
create view loc as
select
LOCATION_ID llid,
STREET_ADDRESS addr,
POSTAL_CODE zip,
CITY,
STATE_PROVINCE prov,
COUNTRY_ID cid
from LOCATIONS;

desc JOB_history;
create view his as
select
EMPLOYEE_ID eid,
START_DATE sdate,
END_DATE edate,
JOB_ID jid,
DEPARTMENT_ID did
from JOB_history;
--EMPLOYEES 테이블
--[ employee_id = 사번 ] [ first_name = 이름 ] 
--[ last_name = 성 ] [ email = 이메일 ] 
--[ phone_number = 전화번호 ] [ hire_date = 고용일 ]
--[ job_id = 업무ID ] [ salary = 급여]
--[ commission_pct = 커미션비율 ] [ manager_id = 상사ID]
--[ department_id = 부서코드]

-- *******
-- 문제001. 
-- HR 스키마 테이블을 모두 출력?
-- *******
SELECT * FROM TAB;

-- *******
-- 문제002. 
-- HR 스키마 테이블 수는 몇개?
-- *******
SELECT COUNT(*) FROM TAB;
-- *******
-- 문제003. 
-- 사번, 성, 이름출력?
-- *******
SELECT employee_id,first_name,last_name FROM EMPLOYEES;
-- *******
-- 문제004. 
-- 이름이 s로 끝나는 직원의 이름 출력?
-- *******
SELECT first_name FROM EMPLOYEES WHERE first_name LIKE '%s';
-- *******
-- 문제005. 
-- 이름이 s로 시작하는 직원의 이름 출력?
-- *******

SELECT first_name FROM EMPLOYEES WHERE first_name LIKE 'S%';

-- *******
-- 문제006. 
-- 급여가 많은 순으로 이름,부서코드,급여 조회 
-- *******
SELECT first_name,department_id,salary FROM EMPLOYEES ORDER BY salary DESC; 

-- *******
-- 문제007.
-- 급여가 12000 이상인 사번,이름,부서코드, 급여 조회 
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES WHERE salary>12000;

-- *******
-- 문제008.
-- 급여가 1500이상 2500이하를 받는 직원의 사번,이름,부서코드, 급여 조회 
-- ( AND 사용 )
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES where salary>= 1500 and salary<=2500;

-- *******
-- 문제009.
-- 급여가 1500이상 2500이하를 받는 
-- 직원의 사번,이름,부서코드, 급여 조회 (BETWEEN 사용) 
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES WHERE salary BETWEEN 1500 and 2500;

-- *******
-- 문제010.
-- 2005년도에 입사한 직원의 이름과 부서코드, 
-- 입사일자를 조회
-- *******

SELECT first_name,department_id,hire_date FROM EMPLOYEES WHERE hire_date BETWEEN '2005-01-01' and '2005-12-31';

-- *******
-- 문제011. 
-- 커미션을 받지 못하는 직원의 이름,업무코드,급여,커미션비율을 조회
-- *******

SELECT first_name,department_id,salary,commission_pct FROM EMPLOYEES;

-- *******
-- 문제012. 
-- 사번이 110,120,130인 사원의 사번, 성, 이름 조회
-- *******

SELECT first_name,department_id,salary,commission_pct FROM EMPLOYEES WHERE employee_id in('110', '120', '130');

-- *******
-- 문제013. 
-- 부서코드는 오름차순, 급여는 내림차순으로 
-- 부서코드, 급여, 사번, 이름, 성 정렬
-- 오름차순 0,1,2 ... 내림차순 9,8,7...
-- ******
select department_id, salary, employee_id, first_name, last_name
from Employees
order by department_id , salary desc;

-- *******
-- 문제014.
-- 이름에 am 이란 글자가 포함된 직원의 사번,이름, 성
-- *******
select employee_id, first_name, last_name from Employees
where first_name like '%am%';

-- *******
-- 문제015.
-- 이메일에 'GG' 와 'KK'두단어 중 하나만 포함되어도 조회
-- 단, 대소문자 구분함
-- *******
select email from Employees
where (email like '%GG%' or email like '%KK%');

-- *******
-- 문제016. 
-- 이메일주소가 A 로 시작하지 않는 이메일 갯수
-- *******

select count(email) from Employees where email not like  'A%'; 

-- *******
-- 문제017.
-- 성의 두번째,세번째 글자가 동시에 e 인 직원의 이름, 성
-- *******
select first_name, last_name
from Employees
where last_name like '_ee%';

-- Employees 테이블

--[ employee_id = 사번 ] [ first_name = 이름 ] 

--[ last_name = 성 ] [ email = 이메일 ] 

--[ phone_number = 전화번호 ] [ hire_date = 입사일 ]

--[ job_id = 업무코드 ] [ salary = 급여]

--[ commission_pct = 커미션비율 ] [ manager_id = 상사아이디]

--[ department_id = 부서코드]

--  Jobs 테이블

-- job_id 업무코드
-- job_title 업무타이틀
-- min_salary  최저급여
-- max_salary 최고급여
select * from Employees;
select * from Jobs ;
-- *******
-- 문제018
 -- 최저임금이 10000불 이상인 업무 의 상세 내역을 표시한다
-- *******

select *
from Jobs
where min_salary>10000;

-- *******************
-- [문제19]
-- 2002년부터 2005년까지 
-- 가입한 직원의 이름과 가입 일자를 표시한다.
-- *******************
select first_name,hire_date
from Employees 
where hire_date BETWEEN'2002-01-01' and '2005-12-31' ORDER BY hire_date;

-- *******************
-- [문제020]
-- IT Programmer 또는 Sales Man인 
-- 직원의 이름, 입사일, 업무코드 표시.
-- ******************* 

select first_name "이름",hire_date "입사일",JOB_ID "업무코드"
from Employees e 
where job_id in('IT_PROG','SA_MAN');

-- [문제021]
-- JOB_TITLE 가 "Programmer" 또는 "Sales Manager"인 
-- 직원의 이름, 입사일, 업무명 표시.
-- 직원의 이름을 오름차순으로 정렬하시오
-- *******************
select
    e.first_name 이름,
    e.hire_date 입사일,
    j.job_id 업무코드,
    j.job_title 업무명
from Employees e 
inner join jobs j
on e.JOB_ID like j.JOB_ID
where job_title in('Programmer','Sales Manager')
order by e.first_name;

-- *******************
-- [문제022]
-- 부서명 및 관리자이름 표시
-- (단, 컬럼명은 관리자 [공백] 이름 이 되도록 ...)
-- DEPARTMENTS 에서 MANAGER_ID 가 관리자 코드
-- *******************      
select dname 부서명 , fname "관리자이름"
from depart d
    inner join emp e
    on d.MID like e.EID;
    
    -- *******************
-- [문제023]
-- 마케팅(Marketing) 부서에서 근무하는 사원의 
-- 사번, 직책, 이름, 근속기간
-- (단, 근속기간은 JOB_HISTORY 에서 END_DATE-START_DATE로 구할 것)
-- EMPLOYEE_ID 사번, JOB_TITLE 직책임
-- ******************* 
SELECT E.EID 사번, J.jti 직책, E.FNAME 이름, 
        H.EDATE - H.SDATE 근속일수 
FROM HIS H
    JOIN JOB J 
        ON H.JID LIKE J.JID
    JOIN EMP E
        ON E.EID LIKE H.EID
WHERE E.DID LIKE (SELECT D.DID 
                  FROM Depart D
                  WHERE D.DNAME LIKE 'Marketing');
    
    
SELECT * FROM JOB_history;
-- *******************
-- [문제025]
-- 부서명, 관리자 이름, 부서위치 도시 표시
-- 부서명 오름차순
-- *******************
select  
    dname 부서명, 
    fname||''||lname"관리자 이름", 
    city"부서위치 도시" 
from depart d
    join emp e
        on d.mid like e.EID
    join loc l
        on d.lid like l.llid
order by dname;        
        
-- *******************
-- [문제026]
-- 부서별 평균 급여를 구하시오
-- *******************    
select 
    d.DNAME 부서명,
    round(avg(e.SAL),2)"부서별 평균 급여"
from emp e
    join depart d
        on e.DID like d.DID
    group by e.did, d.DNAME    
    having round(avg(e.SAL),2) >= 10000;
    
    -- *******************
-- [문제028]
-- 올해 연봉에서 10% 인상된 급액이 내년 연봉으로
-- 책정되었습니다. 내년 전사원의 내년급여를
-- 출력하세요.
-- 단, 연봉 = 급여 * 12 입니다
-- *********************

