drop table customer;
create table customer(
customer_id varchar2(15) primary key,
customer_name varchar2(15) not null,
password varchar2(15) not null,
ssn varchar2(15) not null,
phone varchar2(15) not null,
postal_code varchar2(15) not null,
address varchar2(50) not null,
city varchar2(50) not null,
photo varchar2(30) not null
); 
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('hong','ȫ�浿','1234','900101-1','010-1212-1212','03121','����Ư���� ����','�̷���');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('tah123','������','1234','960314-1','010-4360-7560','03450','����Ư���� ���� �Ż�1��','�����449 û��401ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('dae','�����','1234','920914-2','010-5012-7557','03506','����Ư���� ���� ���굿',' 220-1 ����@201ȣ');
insert into customers(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('utf1212','������','1234','901025-1','010-4500-7743','03500','����Ư���� ���� ���굿','177-5');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('kiuk901','����ǥ','1234','850110-1','010-7911-8509','03499','����Ư���� ���� ���굿','169-3 û�Ͼ���Ʈ101ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('usd0209','������','1234','990920-2','010-4417-9811','04023','����Ư���� ������ ������','�����ŷ� 29');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('foscal99','������','1234','981009-1','010-4009-7474','04023','����Ư���� ������ ������','426-10 �׸����� ������');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('iffy12','������','1234','940309-2','010-1108-8494','07214','����Ư���� �������� ��굿','4��� �Ｚ ���̾�903ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('yung312','�̴ٿ�','1234','970312-2','010-7742-4911','03982','����Ư���� ������ ������','������ 38�� 8');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('kimyu134','������','1234','961231-2','010-1488-8182','04047','����Ư���� ������ ������','412-27 k���� 803ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('jee4311','������','1234','890511-2','010-0119-8441','04074','����Ư���� ������ �����','335-10 ��� �׸���ũ�� 102ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('kugi4119','���⿵','1234','910111-1','010-9133-8991','04075','����Ư���� ������ �����','396 ����λ��������Ʈ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('dong4343','������','1234','920817-1','010-7899-4219','04067','����Ư���� ������ �����','88-18 ���������');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('chii12','�迵õ','1234','850301-1','010-4377-4919','04381','����Ư���� ��걸 ���̵�','193-5 �����Ǽ�101ȣ');
insert into customer(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
values('namme1233','����ö','1234','891213-1','010-9411-9881','07718','����Ư���� ������ ȭ�','377-42');
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Gameing','������','1234','901220-1','010-8452-6312','07728','����Ư���� ������ ������ 142','��ȭ������102ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Tomas','������','1234','900830-1','010-5245-8453','07727','����Ư���� ������ ȭ��� 176-21','�����101ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Rupi','��â��','1234','940234-1','010-3254-4512','07677','����Ư���� ������ �ʷϸ�����11�� 27','������������');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Ourusa','��â��','1234','950425-1','010-5491-4425','07677','����Ư���� ������ ��ġ���12�� 57','���̾ؿ��̺�����');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Smoker','�迵��','1234','940201-2','010-5598-7812','07679','����Ư���� ������ ��ġ��� 63','�����������ٷμ���');                   
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('Oarora','������','1234','951112-2','010-8265-4455','07726','����Ư���� ������ ������26�� 35-27','��ξ�Ʈ��120ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('ting','������','1234','900512-2','010-7751-1513','07676','����Ư���� ������ �ʷϸ�����21�� 6','�������202ȣ');                   
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('skrad','��켮','1234','970118-1','010-5098-5412','07730','����Ư���� ������ ��ġ���4�� 98-10','�޺�������302ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('monga','����','1234','961211-1','010-5611-6312','07727','����Ư���� ������ ȭ��� 176-19','���缾Ʈ�������Ʈ102ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('rion','������','1234','960422-2','010-5131-1123','07721','����Ư���� ������ ȭ���34�� 22','�������Ͽ콺102ȣ');                    
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('tail','������','1234','940220-2','010-6151-8488','07730','����Ư���� ������ ��ġ���4�ٱ� 21','�Ƹ���Ʈ��102ȣ');
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('chun34','õ����','1234','950903-2','010-4911-7720','02579','����Ư���� ���빮�� �ż���','42');
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('asa1234','����ǥ','1234','830817-1','010-6491-0811','03067','����Ư���� ���α� ��ȭ��','5-37 �߾ӱ׸����� 203ȣ');
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,PASSWORD,SSN,PHONE,POSTALCODE,CITY,ADDRESS)
VALUES('groop','���ϳ�','1234','851219-1','010-4598-8941','03077','����Ư���� ���α� ��ȭ��','166-4');

select * from employees;
