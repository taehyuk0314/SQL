select * from customers;
desc customers;
--���� ��Ͽ��� ROWNUM �� �߰��Ѵ�
SELECT ROWNUM "NO.",c.* FROM CUSTOMERS c;

--ROWNUM�� �������� �����Ѵ�
SELECT ROWNUM RNUM,C.* 
FROM CUSTOMERS C
ORDER BY RNUM DESC;

--3. ������������(5)��ŭ�� ����Ѵ�
SELECT *
FROM
(SELECT T.*,ROWNUM R1
    FROM(SELECT ROWNUM RNUM,C.* 
        FROM CUSTOMERS C
        ORDER BY RNUM DESC) T)
WHERE R1 BETWEEN 1 AND 6
;

SELECT COUNT(*) FROM CUSTOMERS;