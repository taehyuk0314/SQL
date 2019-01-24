select * from emp;
--empno ���
--ename �����
--job ����
--mgr �Ŵ���
--hiredate �Ի���
--sal ����
--comm Ŀ�̼�
--deptno �μ��ڵ�
select * from dept;
--deptno �μ��ڵ�
--dname �μ���
--loc ȸ����ġ


--01
-- caseǥ��
select ename, 
    case when sal>2000
        then sal
        else 2000
    end revised_salary
from emp;

--����
--case when ���ǽ�
-- then ���ϰ��
-- else �����ϰ��
-- end �÷������� ó��

--emp test02
--�μ��������� �μ���ġ�� �̱��� ����,�ߺ�,���η� �����϶�
--���� - east, ������ -east, ��ī�� -center, �޶� - center
--�÷Ÿ� -area

select dname,case when loc in( 'NEW YORK','BOSTON')
            then 'east'
            else 'center'
        end area_loc
from dept;        
        
            
-- EMP_TEST_03
-- �޿��� 3000 �̻��̸� HIGH, 1000 �̻��̸� MID, �̸��̸� LOW 
select * from emp;

select sal,case when sal>=3000  then 'HIGH'
                when sal>=1000 then 'MID'
                else 'LOW'
    end SalSAl
from emp;


-- EMP_TEST_04
-- �޿��� 2000 �̻��̸� ���ʽ� 1000, 
-- 1000 �̻��̸� 500,
-- 1000 �̸��̸� 0���� ����Ͻÿ�
-- �÷����� BONUS
select sal, case when sal>=2000 then sal+1000
                 when sal>=1000 then sal+500
                 else sal
            end BONUS
from emp;            

-- EMP_TEST_05
-- �Ŵ����� "BLAKE" �̸� NULL ǥ��, ���� ������ MGR ǥ��
SELECT ENAME, EMPNO, MGR,
    CASE WHEN MGR = (SELECT MGR 
                    FROM EMP 
                    WHERE EMPNO LIKE 7698)
         THEN NULL
         ELSE MGR
    END NUIF
FROM EMP; 
    
--EMP TEST_06
--���� �Ի��������� ���� �����͸� �����ϱ�
--extract �� ���� �̴°� 
select ename, deptno, extract(month from hiredate) �Ի��, sal
from emp;  

--EMP TEST_07
--����� MONTH �����͸� 12���� ���� Į������ �����ϱ�
select ename, deptno,
    case month when 1 then sal end "1��",
    case month when 2 then sal end "2��",
    case month when 3 then sal end "3��",
    case month when 4 then sal end "4��",
    case month when 5 then sal end "5��",
    case month when 6 then sal end "6��",
    case month when 7 then sal end "7��",
    case month when 8 then sal end "8��",
    case month when 9 then sal end "9��",
    case month when 10 then sal end "10��",
    case month when 11 then sal end "11��",
    case month when 12 then sal end "12��"        
from (select ename, deptno, extract(month from hiredate) month, sal
    from emp);
--EMP TEST_08
--����� MONTH �����͸� 12���� ���� Į������ ������ ��
--�μ����� �����ϱ�
select (select dname
        from dept d
        where d.DEPTNO like t.deptno) dname,
 deptno,
    avg(case month when 1 then sal end) "1��",
    avg(case month when 2 then sal end) "2��",
    avg(case month when 3 then sal end) "3��",
    avg(case month when 4 then sal end) "4��",
    avg(case month when 5 then sal end) "5��",
    avg(case month when 6 then sal end) "6��",
    avg(case month when 7 then sal end) "7��",
    avg(case month when 8 then sal end) "8��",
    avg(case month when 9 then sal end) "9��",
    avg(case month when 10 then sal end) "10��",
    avg(case month when 11 then sal end) "11��",
    avg(case month when 12 then sal end) "12��"        
from (select e.deptno, extract(month from hiredate) month, sal
    from emp e) t
    group by deptno;
    
--EMP TEST_09
--������ ����
--level: ��Ʈ�������̸� 1, ������ �������̸� 2�̴�
--����(leaf) �����ͱ��� 1�������Ѵ�
--connect_by_isleaf ���� �������� �ش� �����Ͱ� �����������̸�
--1, �׷��� ������ 0�̴�
--lpad : ��� �����͸� �鿩���� �ϱ� ���ػ����
select level, 
        lpad(' ',4*(level-1)) || empno ���,
        mgr ������,
        connect_by_isleaf isleaf
from emp
start with mgr is null
connect by prior empno like mgr;

--EMP TEST_10
--��������
select e1.EMPNO ���, e1.MGR ������, e2.MGR "���� ������"
from emp e1
    join emp e2
        on e1.MGR like e2.EMPNO
order by e2.mgr desc,e1.mgr,e1.empno;
--�ڽŰ� �ڽ��� ���Ӱ����ڴ� ������ �࿡�� ���Ҽ� ������
--������ �����ڴ� �ٷ� ���� �� ����
-- ������ �����ڸ� ���ϱ� ���ؼ��� �ڽ��� ���Ӱ����ڸ�
--�������� ���������� �����ؾ� �ȴ�.
--�׷��� INNER JOIN �� ��������ν� �ڽ��� �����ڰ�
--�������� �ʴ� ��쿡�� E2���̺��� ������ �����
--�������� �ʱ� ������ �ش� �����ʹ� ������� �����ȴ�
--�̸� �����ϱ� ���ؼ��� �ƿ��� ������ ����Ѵ�.
--outer�� ����Ʈ������ ����������

--EMP TEST_11
--group function �׷��Լ�
--�Ϲ����� group by �Լ�

select e1.EMPNO ���,
       e1.MGR ������,
       e2.MGR "���� ������"
from emp e1
    left join emp e2
        on e1.MGR like e2.EMPNO
order by e2.mgr desc,e1.mgr,e1.empno;
--EMP TEST_12

select  dname �μ���,
        job ����,
        count(*) "��ü ���",
        sum(sal) "��ü �޿�"
from emp e, dept d
where e.DEPTNO like d.DEPTNO
group by rollup(dname,job);


--ansi ���� ������ �Լ� ������
--aggregate function �����Լ� sum(),count(),min() ���
--group function �׷��Լ� 
--Ư���׸� ���� �Ұ踦 �ϴ� �Լ�
-- ROLLUP :�ұ׷찣�� �Ұ踦 ����ϴ� �Լ�
--CUBE : ���������� �Ұ踦 ����ϴ� �Լ�
--window function ������ �Լ�.. rank(),row_number() 

--EMP TEST_13
select  case grouping(dname)
            when 1 then 'ALL DEPTS'
            else dname 
        end as "�μ���",
        case grouping(job)
            when 1 then 'ALL JOBS'
            else job 
        end "������",
        count(*) "��ü ���",
        sum(sal) "��ü �޿�"    
from emp e, dept d
where e.DEPTNO like d.DEPTNO
group by cube(dname,job);