-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���
select  p.pname ������, 
        p.POSITION ������, 
        p.BACK ��ѹ�
from (select pname,position,back from pla where tid =(select tid
            from pla p
            where pname like '����')) p 
order by pname;


    