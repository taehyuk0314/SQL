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
select t.tname ����,
   s.sname ��Ÿ���,
   (select  t.TNAME from tea t where t.TID like c.aid) ������ID,
   c.SDATE �����ٳ�¥
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
from sta s 
    join(select c.SDATE ,c.SID from sch c where c.sdate like '20120317') c
        on s.SID = c.SID
    join (select t.rname, t.tname,t.sid, t.tid from tea t where t.tid like 'K03') t
        on t.SID = s.SID
    join (select p.tid, p.position, p.pname  from pla p where p.position like 'GK') p
        on p.TID = t.TID
order by p.PNAME;

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�

select hscore,ascore
from sch c 
where hscore > ascore;


select s.SNAME ��Ÿ���,
c.SDATE ��⳯¥, 
concat(t.rname||' ',(select t.tname from tea t where t.tid like c.hid)) Ȩ��,
concat(t.rname||' ',(select t.tname from tea t where t.tid like c.aid)) ������,
c.HSCORE "Ȩ�� ����",
c.ASCORE "������ ����"
from sta s
    join (select c.HSCORE,c.ASCORE,c.SID,c.sdate,c.aid,c.hid from sch c where c.HSCORE>=c.ASCORE +3) c
        on c.SID = s.SID
    join tea t
        on t.SID = s.SID
        
;    

-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20   
select s.sname ��Ÿ���,
       s.sid "��Ÿ��� ID",
       s.SCOUNT �¼���,
       s.HID "Ȩ�� ���̵�",
       (select t.ENAME from tea t  where t.sID like s.sID) "���� ���̸�"
 from sta s;

-- SOCCER_SQL_016
-- ���Ű�� ��õ ������Ƽ������ ���Ű ���� ���� ���� 
-- ��ID, ����, ���Ű ����

select p.Tid "��id" ,t.TNAME ����,avg(p.HEIGHT) ���Ű
from tea t
    join pla p
        on t.TID = p.TID 
group by p.tid,t.TNAME
having avg(p.HEIGHT)<(select avg(p.HEIGHT)
                      from tea t
                        join pla p
                            on p.tid like t.tid
                            where t.tname like '������Ƽ��')
order by avg(p.HEIGHT) 
; 
    
-- SOCCER_SQL_017
-- �������� MF �� ��������  �Ҽ����� �� ������, ��ѹ� ���
select t.TNAME �Ҽ���,p.PNAME ������,p.BACK ��ѹ�
from (select p.POSITION, p.PNAME,p.BACK,p.TID from pla p where p.POSITION like 'MF') p
    join tea t
        on t.TID = p.TID
order by p.PNAME        
;
-- SOCCER_SQL_018
-- ���� Űū ���� 5 ����, ����Ŭ, �� Ű ���� ������ ����

select  rnum,������, ��ѹ�, ������,Ű
from (select PNAME ������,BACK ��ѹ�,POSITION ������,HEIGHT Ű,rownum rnum 
      from (select PNAME,BACK,POSITION,HEIGHT 
            from pla 
            where HEIGHT is not null
            order by HEIGHT desc)) 
where rnum <=5    
;

-- SOCCER_SQL_019
-- ���� �ڽ��� ���� ���� ���Ű���� ���� ���� ���� ���
select t.TNAME ����,p.PNAME ������,p.POSITION ������, p.BACK ��ѹ�, p.HEIGHT Ű 
from tea t
    join pla p
        on t.TID = p.TID
where p.HEIGHT<(select avg(p2.HEIGHT)from pla p2 where p2.tid like p.tid)
order by p.PNAME;

-- SOCCER_SQL_020
-- 2012�� 5�� �Ѵް� ��Ⱑ �ִ� ����� ��ȸ
-- EXISTS ������ �׻� ���������� ����Ѵ�.
-- ���� �ƹ��� ������ �����ϴ� ���� ���� ���̶�
-- ������ �����ϴ� 1�Ǹ� ã���� �߰����� �˻��� �������� �ʴ´�

select *
from sch c
where c.SDATE between '20120501' and '20120531';

select *
from sch s
where exists(select 1
            from sch c
            where c.SID like s.SID and 
            c.SDATE between '20120501' and '20120531') 