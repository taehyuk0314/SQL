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

-- SOCCER_SQL_016
-- 평균키가 인천 유나이티스팀의 평균키 보다 작은 팀의 
-- 팀ID, 팀명, 평균키 추출

select p.Tid "팀id" ,t.TNAME 팀명,avg(p.HEIGHT) 평균키
from tea t
    join pla p
        on t.TID = p.TID 
group by p.tid,t.TNAME
having avg(p.HEIGHT)<(select avg(p.HEIGHT)
                      from tea t
                        join pla p
                            on p.tid like t.tid
                            where t.tname like '유나이티드')
order by avg(p.HEIGHT) 
; 
    
-- SOCCER_SQL_017
-- 포지션이 MF 인 선수들의  소속팀명 및 선수명, 백넘버 출력
select t.TNAME 소속팀,p.PNAME 선수명,p.BACK 백넘버
from (select p.POSITION, p.PNAME,p.BACK,p.TID from pla p where p.POSITION like 'MF') p
    join tea t
        on t.TID = p.TID
order by p.PNAME        
;
-- SOCCER_SQL_018
-- 가장 키큰 선수 5 추출, 오라클, 단 키 값이 없으면 제외

select  rnum,선수명, 백넘버, 포지션,키
from (select PNAME 선수명,BACK 백넘버,POSITION 포지션,HEIGHT 키,rownum rnum 
      from (select PNAME,BACK,POSITION,HEIGHT 
            from pla 
            where HEIGHT is not null
            order by HEIGHT desc)) 
where rnum <=5    
;

-- SOCCER_SQL_019
-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력
select t.TNAME 팀명,p.PNAME 선수명,p.POSITION 포지션, p.BACK 백넘버, p.HEIGHT 키 
from tea t
    join pla p
        on t.TID = p.TID
where p.HEIGHT<(select avg(p2.HEIGHT)from pla p2 where p2.tid like p.tid)
order by p.PNAME;

-- SOCCER_SQL_020
-- 2012년 5월 한달간 경기가 있는 경기장 조회
-- EXISTS 쿼리는 항상 연관쿼리로 상요한다.
-- 또한 아무리 조건을 만족하는 건이 여러 건이라도
-- 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다

select *
from sch c
where c.SDATE between '20120501' and '20120531';

select *
from sch s
where exists(select 1
            from sch c
            where c.SID like s.SID and 
            c.SDATE between '20120501' and '20120531') 