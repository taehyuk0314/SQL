--1
select p.BDATE �������, p.PNAME ���� 
from pla p
where p.BDATE is not null
order by p.BDATE desc;

--2
select p.BDATE �������, p.PNAME ���� 
from pla p
where p.BDATE is not null and
      rownum between 1 and 5
order by p.BDATE desc;

--3
select p.BDATE �������, p.PNAME ���� 
from (select p.BDATE,p.PNAME 
    from pla p 
    where p.BDATE is not null 
    order by p.BDATE desc) p
where rownum between 1 and 5;

--4
select p.rnum "NO.",p.BDATE �������, p.PNAME ���� 
from (select t.BDATE,t.PNAME, rownum rnum
        from (select t.BDATE,t.PNAME 
              from pla t 
              where BDATE is not null 
              order by t.BDATE desc) t 
    ) p
where p.rnum between 6 and 10;


--5
select p.BDATE �������, p.PNAME ���� 
from pla p
where p.BDATE is not null and
    rownum between 1 and 5
order by p.BDATE desc;

SELECT T2.SEQ "No.",T2.�������, T2.����
  FROM (SELECT ROWNUM SEQ, T1.* FROM(
        SELECT 
            P.BIRTH_DATE �������, 
            P.PLAYER_NAME ���� 
        FROM PLAYER P
        WHERE P.BIRTH_DATE IS NOT NULL
        ORDER BY P.BIRTH_DATE DESC
            )T1)T2
   WHERE T2.SEQ BETWEEN 6 AND 10;