desc stadium;
create view sta as
select
 STADIUM_ID sid,
 STADIUM_NAME sname,
HOMETEAM_ID hid,
SEAT_COUNT scount,
ADDRESS addr,
DDD,
TEL
from stadium;

desc schedule;
create view sch as
select
STADIUM_ID sid,
SCHE_DATE sdate,
GUBUN,
HOMETEAM_ID hid,
AWAYTEAM_ID aid,
HOME_SCORE hscore,
AWAY_SCORE ascore
from schedule;

-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력
select t.tname,s.sname
from tea t
    join sta s
        on s.SID = t.SID
order by t.tname;        

-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의 
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오
select t.tname 팀명, s.sname 스타디움, c.AID 원정팀ID, c.SDATE 스케줄날짜
from (select c.SID, c.SDATE, c.AID from sch c where c.sdate like '20120317') c
    join sta s
        on c.SID = s.SID
    join tea t
        on c.SID = t.SID
order by t.tname;

-- SOCCER_SQL_013
-- 2012년 3월 17일 경기에 
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함), 
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오

select p.pname 선수명, p.position 포지션, t.RNAME 팀명, s.SNAME 스타디움, c.SDATE 스케줄날짜
from(select c.SDATE ,c.SID from sch c where c.sdate like '20120317') c
    join sta s
        on s.SID = c.SID
    join tea t
        on t.SID = s.SID
    join pla p
        on p.TID = t.TID
where p.POSITION like 'GK' AND s.SNAME like '포항스틸야드'
order by p.PNAME;

-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
