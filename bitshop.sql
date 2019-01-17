select * from tab;
drop table member;
create table member(
id varchar2(12) primary key,
name varchar2(10),
pass varchar2(10),
ssn varchar2(14) 
);

create table account(
account_num varchar2(9) primary key,
created_date date default sysdate,
money number default 0,
id varchar2(10) not null,
constraint account_fk_member foreign key(id)
 references member(id)
);

alter table member
add primary key(id);
select * from member;

create table admin(
admin_num varchar2(10) not null,
name varchar2(10) not null,
pass varchar2(10) not null,
auth varchar2(10) default '사원'
);

create sequence art_seq
start with 1000
increment by 1;


create table article(
art_seq number primary key,
title varchar2(20) default '제목없음',
content varchar2(50),
regdate date default sysdate,
id varchar2(10) not null,
constraint article_fk_member foreign key(id)
references member(id)
);