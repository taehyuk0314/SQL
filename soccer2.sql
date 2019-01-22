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
select t.tname 팀명,
   s.sname 스타디움,
   (select  t.TNAME from tea t where t.TID like c.aid) 원정팀ID,
   c.SDATE 스케줄날짜
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
from sta s 
    join(select c.SDATE ,c.SID from sch c where c.sdate like '20120317') c
        on s.SID = c.SID
    join (select t.rname, t.tname,t.sid, t.tid from tea t where t.tid like 'K03') t
        on t.SID = s.SID
    join (select p.tid, p.position, p.pname  from pla p where p.position like 'GK') p
        on p.TID = t.TID
order by p.PNAME;

-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오

select hscore,ascore
from sch c 
where hscore > ascore;


select s.SNAME 스타디움,
c.SDATE 경기날짜, 
concat(t.rname||' ',(select t.tname from tea t where t.tid like c.hid)) 홈팀,
concat(t.rname||' ',(select t.tname from tea t where t.tid like c.aid)) 원정팀,
c.HSCORE "홈팀 점수",
c.ASCORE "원정팀 점수"
from sta s
    join (select c.HSCORE,c.ASCORE,c.SID,c.sdate,c.aid,c.hid from sch c where c.HSCORE>=c.ASCORE +3) c
        on c.SID = s.SID
    join tea t
        on t.SID = s.SID
        
;    

-- SOCCER_SQL_015
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20   
select s.sname 스타디움,
       s.sid "스타디움 ID",
       s.SCOUNT 좌석수,
       s.HID "홈팀 아이디",
       (select t.ENAME from tea t  where t.sID like s.sID) "영문 팀이름"
 from sta s;

    