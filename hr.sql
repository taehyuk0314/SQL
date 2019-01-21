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
--EMPLOYEES ���̺�
--[ employee_id = ��� ] [ first_name = �̸� ] 
--[ last_name = �� ] [ email = �̸��� ] 
--[ phone_number = ��ȭ��ȣ ] [ hire_date = ����� ]
--[ job_id = ����ID ] [ salary = �޿�]
--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = ���ID]
--[ department_id = �μ��ڵ�]

-- *******
-- ����001. 
-- HR ��Ű�� ���̺��� ��� ���?
-- *******
SELECT * FROM TAB;

-- *******
-- ����002. 
-- HR ��Ű�� ���̺� ���� �?
-- *******
SELECT COUNT(*) FROM TAB;
-- *******
-- ����003. 
-- ���, ��, �̸����?
-- *******
SELECT employee_id,first_name,last_name FROM EMPLOYEES;
-- *******
-- ����004. 
-- �̸��� s�� ������ ������ �̸� ���?
-- *******
SELECT first_name FROM EMPLOYEES WHERE first_name LIKE '%s';
-- *******
-- ����005. 
-- �̸��� s�� �����ϴ� ������ �̸� ���?
-- *******

SELECT first_name FROM EMPLOYEES WHERE first_name LIKE 'S%';

-- *******
-- ����006. 
-- �޿��� ���� ������ �̸�,�μ��ڵ�,�޿� ��ȸ 
-- *******
SELECT first_name,department_id,salary FROM EMPLOYEES ORDER BY salary DESC; 

-- *******
-- ����007.
-- �޿��� 12000 �̻��� ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES WHERE salary>12000;

-- *******
-- ����008.
-- �޿��� 1500�̻� 2500���ϸ� �޴� ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ 
-- ( AND ��� )
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES where salary>= 1500 and salary<=2500;

-- *******
-- ����009.
-- �޿��� 1500�̻� 2500���ϸ� �޴� 
-- ������ ���,�̸�,�μ��ڵ�, �޿� ��ȸ (BETWEEN ���) 
-- *******
SELECT employee_id,first_name,department_id,salary FROM EMPLOYEES WHERE salary BETWEEN 1500 and 2500;

-- *******
-- ����010.
-- 2005�⵵�� �Ի��� ������ �̸��� �μ��ڵ�, 
-- �Ի����ڸ� ��ȸ
-- *******

SELECT first_name,department_id,hire_date FROM EMPLOYEES WHERE hire_date BETWEEN '2005-01-01' and '2005-12-31';

-- *******
-- ����011. 
-- Ŀ�̼��� ���� ���ϴ� ������ �̸�,�����ڵ�,�޿�,Ŀ�̼Ǻ����� ��ȸ
-- *******

SELECT first_name,department_id,salary,commission_pct FROM EMPLOYEES;

-- *******
-- ����012. 
-- ����� 110,120,130�� ����� ���, ��, �̸� ��ȸ
-- *******

SELECT first_name,department_id,salary,commission_pct FROM EMPLOYEES WHERE employee_id in('110', '120', '130');

-- *******
-- ����013. 
-- �μ��ڵ�� ��������, �޿��� ������������ 
-- �μ��ڵ�, �޿�, ���, �̸�, �� ����
-- �������� 0,1,2 ... �������� 9,8,7...
-- ******
select department_id, salary, employee_id, first_name, last_name
from Employees
order by department_id , salary desc;

-- *******
-- ����014.
-- �̸��� am �̶� ���ڰ� ���Ե� ������ ���,�̸�, ��
-- *******
select employee_id, first_name, last_name from Employees
where first_name like '%am%';

-- *******
-- ����015.
-- �̸��Ͽ� 'GG' �� 'KK'�δܾ� �� �ϳ��� ���ԵǾ ��ȸ
-- ��, ��ҹ��� ������
-- *******
select email from Employees
where (email like '%GG%' or email like '%KK%');

-- *******
-- ����016. 
-- �̸����ּҰ� A �� �������� �ʴ� �̸��� ����
-- *******

select count(email) from Employees where email not like  'A%'; 

-- *******
-- ����017.
-- ���� �ι�°,����° ���ڰ� ���ÿ� e �� ������ �̸�, ��
-- *******
select first_name, last_name
from Employees
where last_name like '_ee%';

-- Employees ���̺�

--[ employee_id = ��� ] [ first_name = �̸� ] 

--[ last_name = �� ] [ email = �̸��� ] 

--[ phone_number = ��ȭ��ȣ ] [ hire_date = �Ի��� ]

--[ job_id = �����ڵ� ] [ salary = �޿�]

--[ commission_pct = Ŀ�̼Ǻ��� ] [ manager_id = �����̵�]

--[ department_id = �μ��ڵ�]

--  Jobs ���̺�

-- job_id �����ڵ�
-- job_title ����Ÿ��Ʋ
-- min_salary  �����޿�
-- max_salary �ְ�޿�
select * from Employees;
select * from Jobs ;
-- *******
-- ����018
 -- �����ӱ��� 10000�� �̻��� ���� �� �� ������ ǥ���Ѵ�
-- *******

select *
from Jobs
where min_salary>10000;

-- *******************
-- [����19]
-- 2002����� 2005����� 
-- ������ ������ �̸��� ���� ���ڸ� ǥ���Ѵ�.
-- *******************
select first_name,hire_date
from Employees 
where hire_date BETWEEN'2002-01-01' and '2005-12-31' ORDER BY hire_date;

-- *******************
-- [����020]
-- IT Programmer �Ǵ� Sales Man�� 
-- ������ �̸�, �Ի���, �����ڵ� ǥ��.
-- ******************* 

select first_name "�̸�",hire_date "�Ի���",JOB_ID "�����ڵ�"
from Employees e 
where job_id in('IT_PROG','SA_MAN');

-- [����021]
-- JOB_TITLE �� "Programmer" �Ǵ� "Sales Manager"�� 
-- ������ �̸�, �Ի���, ������ ǥ��.
-- ������ �̸��� ������������ �����Ͻÿ�
-- *******************
select
    e.first_name �̸�,
    e.hire_date �Ի���,
    j.job_id �����ڵ�,
    j.job_title ������
from Employees e 
inner join jobs j
on e.JOB_ID like j.JOB_ID
where job_title in('Programmer','Sales Manager')
order by e.first_name;

-- *******************
-- [����022]
-- �μ��� �� �������̸� ǥ��
-- (��, �÷����� ������ [����] �̸� �� �ǵ��� ...)
-- DEPARTMENTS ���� MANAGER_ID �� ������ �ڵ�
-- *******************      
select dname �μ��� , fname "�������̸�"
from depart d
    inner join emp e
    on d.MID like e.EID;
    
    -- *******************
-- [����023]
-- ������(Marketing) �μ����� �ٹ��ϴ� ����� 
-- ���, ��å, �̸�, �ټӱⰣ
-- (��, �ټӱⰣ�� JOB_HISTORY ���� END_DATE-START_DATE�� ���� ��)
-- EMPLOYEE_ID ���, JOB_TITLE ��å��
-- ******************* 
SELECT E.EID ���, J.jti ��å, E.FNAME �̸�, 
        H.EDATE - H.SDATE �ټ��ϼ� 
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
-- [����025]
-- �μ���, ������ �̸�, �μ���ġ ���� ǥ��
-- �μ��� ��������
-- *******************
select  
    dname �μ���, 
    fname||''||lname"������ �̸�", 
    city"�μ���ġ ����" 
from depart d
    join emp e
        on d.mid like e.EID
    join loc l
        on d.lid like l.llid
order by dname;        
        
-- *******************
-- [����026]
-- �μ��� ��� �޿��� ���Ͻÿ�
-- *******************    
select 
    d.DNAME �μ���,
    round(avg(e.SAL),2)"�μ��� ��� �޿�"
from emp e
    join depart d
        on e.DID like d.DID
    group by e.did, d.DNAME    
    having round(avg(e.SAL),2) >= 10000;
    
    -- *******************
-- [����028]
-- ���� �������� 10% �λ�� �޾��� ���� ��������
-- å���Ǿ����ϴ�. ���� ������� ����޿���
-- ����ϼ���.
-- ��, ���� = �޿� * 12 �Դϴ�
-- *********************

