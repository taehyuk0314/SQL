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
order by department_id asc, salary desc;

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