SELECT * FROM TAB;
desc player;
create view pla as
select
PLAYER_ID pid,
PLAYER_NAME pname,
TEAM_ID tid,
E_PLAYER_NAME ename,
NICKNAME nname,
JOIN_YYYY yy,
POSITION,
BACK_NO back,
NATION,
BIRTH_DATE bdate,
SOLAR,
HEIGHT,
WEIGHT
from player;

desc team;
create view tea as
select 
TEAM_ID tid,
REGION_NAME rname,
TEAM_NAME tname,
E_TEAM_NAME ename,
ORIG_YYYY yy,
STADIUM_ID sid,
ZIP_CODE1 code1,
ZIP_CODE2 code2,
ADDRESS addr,
DDD,
TEL,
FAX,
HOMEPAGE home,
OWNER
from team;
-- SQL_TEST_001
-- 전체 축구팀 목록. 이름 오름차순
select tname "전체 축구팀 목록"
from tea
order by tname;

-- SQL_TEST_002
-- 포지션 종류(중복제거,없으면 빈공간)

select distinct position from pla;

-- SQL_TEST_003
-- 포지션 종류(중복제거,없으면 신입으로 기재)
-- nvl2()사용
select distinct nvl2(position,position,'신입') 포지션
from pla;

-- SQL_TEST_004
-- 수원팀(ID: K02)골키퍼

select p.pname 
from pla p
where (tid like 'K02' AND p.position like 'GK')
order by pname;

-- SQL_TEST_005
-- 수원팀(ID: K02)키가 170 이상 선수
-- 이면서 성이 고씨인 선수

select p.position 포지션,p.pname 이름
from pla p
where tid like 'K02' AND p.HEIGHT>=170 AND pname like '고%';

-- SQL_TEST_006
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- 키 내림차순

select concat(pname,'선수') 이름,
to_char (nvl2(height,height,0)||'cm') 키,
to_char (nvl2(weight,weight,0)||'kg')  몸무게  
from pla
where tid like 'K02'
order by height desc;

-- SQL_TEST_007
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- BMI지수 
-- 키 내림차순
select concat(pname,'선수') 이름,
to_char (nvl2(height,height,0)||'cm') 키,
to_char (nvl2(weight,weight,0)||'cm')  몸무게,
round(weight/(height*height)*10000,2) "bmi 지수"
from (select pname,height,weight 
    from pla
    where tid like 'K02')
order by height desc;

-- SQL_TEST_008
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 
--  포지션이 GK 인  선수
-- 팀명, 사람명 오름차순

select t.tname,p.position,p.pname 
from pla p
    join tea t
        on t.TID = p.TID 
where t.tid in('K02','K10')AND p.position like'GK'
order by t.tname;

-- SQL_TEST_009
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순
select p.height 키,t.tname 팀명, p.pname 이름
from (select t.tid ,t.tname from tea t       
    where t.tid in ('K02','K10')) t
    join pla p
    on  t.TID = p.TID
where p.HEIGHT between 180 and 183
order by p.HEIGHT,t.TNAME,p.PNAME;

-- SOCCER_SQL_010
-- 모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순    

select t.Tname 팀, p.PNAME
from (
select p.tid,p.pname from pla p where p.position is null) p
join tea t
    on t.TID = p.TID
order by t.TNAME,p.PNAME;
    

