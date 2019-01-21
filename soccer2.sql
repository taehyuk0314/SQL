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
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���
select t.tname,s.sname
from tea t
    join sta s
        on s.SID = t.SID
order by t.tname;        

-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�
select t.tname ����, s.sname ��Ÿ���, c.AID ������ID, c.SDATE �����ٳ�¥
from (select c.SID, c.SDATE, c.AID from sch c where c.sdate like '20120317') c
    join sta s
        on c.SID = s.SID
    join tea t
        on c.SID = t.SID
order by t.tname;

-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�

select p.pname ������, p.position ������, t.RNAME ����, s.SNAME ��Ÿ���, c.SDATE �����ٳ�¥
from(select c.SDATE ,c.SID from sch c where c.sdate like '20120317') c
    join sta s
        on s.SID = c.SID
    join tea t
        on t.SID = s.SID
    join pla p
        on p.TID = t.TID
where p.POSITION like 'GK' AND s.SNAME like '���׽�ƿ�ߵ�'
order by p.PNAME;

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
