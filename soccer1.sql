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
-- ��ü �౸�� ���. �̸� ��������
select tname "��ü �౸�� ���"
from tea
order by tname;

-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����)

select distinct position from pla;

-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()���
select distinct nvl2(position,position,'����') ������
from pla;

-- SQL_TEST_004
-- ������(ID: K02)��Ű��

select p.pname 
from pla p
where (tid like 'K02' AND p.position like 'GK')
order by pname;

-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����

select p.position ������,p.pname �̸�
from pla p
where tid like 'K02' AND p.HEIGHT>=170 AND pname like '��%';

-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������

select concat(pname,'����') �̸�,
to_char (nvl2(height,height,0)||'cm') Ű,
to_char (nvl2(weight,weight,0)||'kg')  ������  
from pla
where tid like 'K02'
order by height desc;

-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������
select concat(pname,'����') �̸�,
to_char (nvl2(height,height,0)||'cm') Ű,
to_char (nvl2(weight,weight,0)||'cm')  ������,
round(weight/(height*height)*10000,2) "bmi ����"
from (select pname,height,weight 
    from pla
    where tid like 'K02')
order by height desc;

-- SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ �� 
--  �������� GK ��  ����
-- ����, ����� ��������

select t.tname,p.position,p.pname 
from pla p
    join tea t
        on t.TID = p.TID 
where t.tid in('K02','K10')AND p.position like'GK'
order by t.tname;

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������
select p.height Ű,t.tname ����, p.pname �̸�
from (select t.tid ,t.tname from tea t       
    where t.tid in ('K02','K10')) t
    join pla p
    on  t.TID = p.TID
where p.HEIGHT between 180 and 183
order by p.HEIGHT,t.TNAME,p.PNAME;

-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������    

select t.Tname ��, p.PNAME
from (
select p.tid,p.pname from pla p where p.position is null) p
join tea t
    on t.TID = p.TID
order by t.TNAME,p.PNAME;
    

