select * from emp;
--empno 사원
--ename 사원명
--job 업무
--mgr 매니저
--hiredate 입사일
--sal 월급
--comm 커미션
--deptno 부서코드
select * from dept;
--deptno 부서코드
--dname 부서명
--loc 회사위치


--01
-- case표현
select ename, 
    case when sal>2000
        then sal
        else 2000
    end revised_salary
from emp;

--문법
--case when 조건식
-- then 참일경우
-- else 거짓일경우
-- end 컬려명으로 처리

--emp test02
--부서정보에서 부서위치를 미국의 동부,중부,서부로 구분하라
--뉴욕 - east, 보스턴 -east, 시카고 -center, 달라스 - center
--컬렴명 -area

select dname,case when loc in( 'NEW YORK','BOSTON')
            then 'east'
            else 'center'
        end area_loc
from dept;        
        
            
-- EMP_TEST_03
-- 급여가 3000 이상이면 HIGH, 1000 이상이면 MID, 미만이면 LOW 
select * from emp;

select sal,case when sal>=3000  then 'HIGH'
                when sal>=1000 then 'MID'
                else 'LOW'
    end SalSAl
from emp;


-- EMP_TEST_04
-- 급여가 2000 이상이면 보너스 1000, 
-- 1000 이상이면 500,
-- 1000 미만이면 0으로 계산하시오
-- 컬럼명은 BONUS
select sal, case when sal>=2000 then sal+1000
                 when sal>=1000 then sal+500
                 else sal
            end BONUS
from emp;            

-- EMP_TEST_05
-- 매니저가 "BLAKE" 이면 NULL 표시, 같지 않으면 MGR 표시
SELECT ENAME, EMPNO, MGR,
    CASE WHEN MGR = (SELECT MGR 
                    FROM EMP 
                    WHERE EMPNO LIKE 7698)
         THEN NULL
         ELSE MGR
    END NUIF
FROM EMP; 
    
--EMP TEST_06
--개별 입사정보에서 월별 데이터를 추출하기
--extract 는 월만 뽑는것 
select ename, deptno, extract(month from hiredate) 입사월, sal
from emp;  

--EMP TEST_07
--추출된 MONTH 데이터를 12개의 월별 칼럼으로 구분하기
select ename, deptno,
    case month when 1 then sal end "1월",
    case month when 2 then sal end "2월",
    case month when 3 then sal end "3월",
    case month when 4 then sal end "4월",
    case month when 5 then sal end "5월",
    case month when 6 then sal end "6월",
    case month when 7 then sal end "7월",
    case month when 8 then sal end "8월",
    case month when 9 then sal end "9월",
    case month when 10 then sal end "10월",
    case month when 11 then sal end "11월",
    case month when 12 then sal end "12월"        
from (select ename, deptno, extract(month from hiredate) month, sal
    from emp);
--EMP TEST_08
--추출된 MONTH 데이터를 12개의 월별 칼럼으로 구분한 후
--부서별로 구분하기
select (select dname
        from dept d
        where d.DEPTNO like t.deptno) dname,
 deptno,
    avg(case month when 1 then sal end) "1월",
    avg(case month when 2 then sal end) "2월",
    avg(case month when 3 then sal end) "3월",
    avg(case month when 4 then sal end) "4월",
    avg(case month when 5 then sal end) "5월",
    avg(case month when 6 then sal end) "6월",
    avg(case month when 7 then sal end) "7월",
    avg(case month when 8 then sal end) "8월",
    avg(case month when 9 then sal end) "9월",
    avg(case month when 10 then sal end) "10월",
    avg(case month when 11 then sal end) "11월",
    avg(case month when 12 then sal end) "12월"        
from (select e.deptno, extract(month from hiredate) month, sal
    from emp e) t
    group by deptno;
    
--EMP TEST_09
--계층형 쿼리
--level: 루트데이터이면 1, 그하위 데이터이면 2이다
--리프(leaf) 데이터까지 1씩증가한다
--connect_by_isleaf 전개 과정에서 해당 데이터가 리프데이터이면
--1, 그렇지 않으면 0이다
--lpad : 결과 데이터를 들여쓰기 하기 위해사용함
select level, 
        lpad(' ',4*(level-1)) || empno 사원,
        mgr 관리자,
        connect_by_isleaf isleaf
from emp
start with mgr is null
connect by prior empno like mgr;

--EMP TEST_10
--셀프조인
select e1.EMPNO 사번, e1.MGR 관리자, e2.MGR "상위 관리자"
from emp e1
    join emp e2
        on e1.MGR like e2.EMPNO
order by e2.mgr desc,e1.mgr,e1.empno;
--자신과 자신의 직속관리자는 동일한 행에서 구할수 있으나
--차상위 관리자는 바로 구할 수 없다
-- 차상위 관리자를 구하기 위해서는 자신의 직속관리자를
--기준으로 셀프조인을 수행해야 된다.
--그러나 INNER JOIN 을 사용함으로써 자신의 관리자가
--존재하지 않는 경우에는 E2테이블에서 조인할 대상이
--존재하지 않기 때문에 해당 데이터는 결과에서 누락된다
--이를 방지하기 위해서는 아우터 조인을 사용한다.
--outer는 디폴트값으로 생략가능함

--EMP TEST_11
--group function 그룹함수
--일반적인 group by 함수

select e1.EMPNO 사번,
       e1.MGR 관리자,
       e2.MGR "상위 관리자"
from emp e1
    left join emp e2
        on e1.MGR like e2.EMPNO
order by e2.mgr desc,e1.mgr,e1.empno;
--EMP TEST_12

select  dname 부서명,
        job 업무,
        count(*) "전체 사원",
        sum(sal) "전체 급여"
from emp e, dept d
where e.DEPTNO like d.DEPTNO
group by rollup(dname,job);


--ansi 에서 정의한 함수 세가지
--aggregate function 집계함수 sum(),count(),min() 등등
--group function 그룹함수 
--특정항목에 대한 소계를 하는 함수
-- ROLLUP :소그룹간의 소계를 계산하는 함수
--CUBE : 다차원적인 소계를 계산하는 함수
--window function 윈도우 함수.. rank(),row_number() 

--EMP TEST_13
select  case grouping(dname)
            when 1 then 'ALL DEPTS'
            else dname 
        end as "부서명",
        case grouping(job)
            when 1 then 'ALL JOBS'
            else job 
        end "업무명",
        count(*) "전체 사원",
        sum(sal) "전체 급여"    
from emp e, dept d
where e.DEPTNO like d.DEPTNO
group by cube(dname,job);