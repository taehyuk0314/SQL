select * from customers;
desc customers;
--현재 목록에서 ROWNUM 을 추가한다
SELECT ROWNUM "NO.",c.* FROM CUSTOMERS c;

--ROWNUM을 역순으로 정렬한다
SELECT ROWNUM RNUM,C.* 
FROM CUSTOMERS C
ORDER BY RNUM DESC;

--3. 페이지사이즈(5)만큼만 출력한다
SELECT *
FROM
(SELECT T.*,ROWNUM R1
    FROM(SELECT ROWNUM RNUM,C.* 
        FROM CUSTOMERS C
        ORDER BY RNUM DESC) T)
WHERE R1 BETWEEN 1 AND 6
;

SELECT COUNT(*) FROM CUSTOMERS;