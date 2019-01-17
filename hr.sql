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
order by department_id asc, salary desc;

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