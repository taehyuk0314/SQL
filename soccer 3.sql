-- SOCCER_SQL_021
-- 이현 선수 소속팀의 선수명단 출력
select  p.pname 선수명, 
        p.POSITION 포지션, 
        p.BACK 백넘버
from (select pname,position,back from pla where tid =(select tid
            from pla p
            where pname like '이현')) p 
order by pname;


    