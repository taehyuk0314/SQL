select * from tab;
select e.LAST_NAME �̸�, d.DEPARTMENT_NAME �μ���
from employees e
inner join departments d
on e.DEPARTMENT_ID like 
d.DEPARTMENT_ID;


select department_name "���� �μ�"
from departments
where department_id like 
(select department_id 
from employees 
where last_name like 'Fay'
);