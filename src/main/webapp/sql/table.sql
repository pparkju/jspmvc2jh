create table notices(
seq varchar2(10),
title varchar2(100),
writer varchar2(30),
content varchar2(300),
regdate date,
hit number);

desc notices;

insert into notices(seq,title,writer,content,regdate,hit) values ('1','test1','park','content',sysdate,0);
insert into notices(seq,title,writer,content,regdate,hit) values ('2','test1','park','content',sysdate,0);
insert into notices(seq,title,writer,content,regdate,hit) 
values ((select max(to_number(seq))+1 from notices),'test1','park','content',sysdate,0);
commit;

select * from notices where seq='6';
select * from notices order by to_number(seq) desc;

select seq+3 from notices;

--drop table notice;

select max(seq) from notices;
select max(to_number(seq))+1 from notices; --글번호중에 제일 큰값은 ? 
select * from notices;

update notices set title='haha',content='수정' where seq='6';
commit;

delete from notices where seq='6';
--=============================================
--mission 테이블 
create table board(
bno varchar2(10),
bsubj varchar2(200),
bwriter varchar2(50),
bmemo varchar2(500),
bdate date,
bcnt number);

insert into board (bno,bsubj,bwriter,bmemo,bdate,bcnt) values ('0','bsubject','park','bmemo',sysdate,0);
insert into board (bno,bsubj,bwriter,bmemo,bdate,bcnt) values ('1','bsubject','park','bmemo',sysdate,0);
insert into board (bno,bsubj,bwriter,bmemo,bdate,bcnt) values ('2','bsubject','park','bmemo',sysdate,0);

insert into board(bno,bsubj,bwriter,bmemo,bdate,bcnt) 
values ((select max(to_number(bno))+1 from board),'bsubject','park','bmemo',sysdate,0);
commit;

select * from board;
commit;

select max(bno) from board;
select max(to_number(bno))+1 from board; --글번호중에 제일 큰값은 ?

select bno from board;

delete from board where bno='0000';
commit;

drop table board;

select * from board;
delete from board where bsubj is null;

update board set bsubj='hhh',bmemo='수정' where bno='9';
commit;

delete from board where bno='9';

---------------------------------------------
create table nmember(
id varchar2(50),
pwd varchar2(50),
name varchar2(50),
gender varchar2(10),
birth varchar2(10),
is_lunar varchar2(10),
cphone varchar2(15),
email varchar2(50),
habit varchar2(200),
regdate date);

select * from nmember;

insert into nmember(id,pwd,name,gender,birth,is_lunar,cphone,email,habit,regdate)
values('blue','111','hong','남성','2000-05-05','solar','010-1111-3333','a@b.com','movie',sysdate);
commit;

select * from nmember;
-----------------------------------------------
create table nmember2(
tid varchar2(50),
tpwd varchar2(50),
tname varchar2(50),
tgender varchar2(10),
tbirth varchar2(10),
tis_lunar varchar2(10),
tcphone varchar2(15),
temail varchar2(50),
thabit varchar2(200),
tregdate date);

insert into nmember2(tid,tpwd,tname,tgender,tbirth,tis_lunar,tcphone,temail,thabit,tregdate)
values('blue','111','hong','남성','2000-05-05','solar','010-1111-3333','a@b.com','movie',sysdate);

commit;

select * from nmember2;
