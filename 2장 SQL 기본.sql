/*
    ��¥ : 2024/03/04
    �̸� : ������
    ���� : 2�� SQL �⺻ �ǽ�
*/
--�ǽ��ϱ� 1.1 ���̺� ����
create table USER1(
    ID      varchar2(20),
    Name    varchar2(20),
    HP      char(13),
    AGE     number
    );
    
    
--�ǽ��ϱ� 1.2 ������ �߰�
insert into user1 values ('A101', '������', '010-1234-1111', 25);
insert into user1 values ('A102', '������', '010-1234-2222', 23);
insert into user1 values ('A103', '�庸��', '010-1234-3333', 32);
insert into user1 (id, name, age) values ('A104', '������', 45);
insert into user1 (id, name, hp) values ('A105', '�̼���', '010-1234-5555');

--�ǽ��ϱ� 1.3 ������ ��ȸ
select * from user1;
select * from user1 where id='A101';
select * from user1 where name='������';
select * from user1 where age > 30;
select id, name, age from user1;

--�ǽ��ϱ� 1.4 ������ ����
update user1 set hp='010-1234-4444' where id='A104';
update user1 set age=51 where id='A105';
update user1 set hp='010-1234-1001', age=27 where id='A101';

--�ǽ��ϱ� 1.5 ������ ����
delete from user1 where id='A101';
delete from user1 where id='A102' and age=25;
delete from user1 where age >= 30;

--�ǽ��ϱ� 2.1
create table user2(
id  varchar2(20) primary key,
name varchar2(20),
hp char(20),
age number(20)
);

--�ǽ��ϱ� 2.2
create table user3(
id      varchar2(20) primary key,
name    varchar2(20),
hp      char(13) unique,
age     number(3)
);

--�ǽ��ϱ� 2.3
create table parent(
pid     varchar2(20) primary key,
name    varchar2(20),
hp      char(13) unique
);

create table child(
cid     varchar2(20) primary key,
name    varchar2(20),
hp      char(13) unique,
parent  varchar(20),
foreign key (parent) references parent (pid)
);

insert into parent values ('P101', '�輭��', '010-1234-1001');
insert into parent values ('P102', '�̼���', '010-1234-1002');
insert into parent values ('P103', '�Ż��Ӵ�', '010-1234-1003');

insert into child values ('C101','������','010-1234-2001','P101');
insert into child values ('C102','�̹��','010-1234-2002','P102');
insert into child values ('C103','�̹��','010-1234-2003','P102');
insert into child values ('C104','����','010-1234-2004','P103');

--�ǽ��ϱ� 2-4
create table user4(
name    varchar2(20) not null,
gender  char(1) not null,
age     int default 1,
addr    varchar2(255)
);

insert into user4 values ('������','M',23,'���ؽ�');
insert into user4 values ('������','M',21,'���ֽ�');
insert into user4 (name, gender, addr) values ('�Ż��Ӵ�','F','������');
insert into user4 (name, gender) values ('�̼���', 'M');
insert into user4 (name, age) values ('�����', 33);

create table user5(
name    varchar2(20) not null,
gender  char(1) not null check(gender in('M', 'F')),
age     int default 1 check(age > 0 and age <100),
addr    varchar2(255)
);

insert into user5 values ('������','M',23,'���ؽ�');
insert into user5 values ('������','M',21,'���ֽ�');
insert into user5 (name, gender, addr) values ('�Ż��Ӵ�','F','������');
insert into user5 (name, gender) values ('�̼���', 'M');
insert into user5 (name, age) values ('�����', 33);

--�ǽ� 3.1 �����ͻ��� ���� ��ȸ
select * from DIC;

select table_name from user_tables;

select owner, table_name from ALL_TABLES;

select * from DBA_TABLES;

select * from DBA_USERS;

--�ǽ� 3.2 �ε��� ��ȸ/����/����

select * from USER_INDEXES;
select * from USER_IND_COLUMNS;

create INDEX IDX_USER1_UID on User1(`uid`);
select * from USER_IND_COLUMNS;

drop INDEX IDX_USER1_UID;
select * from user_ind_columns;

--�ǽ� 3.4 �� ����/��ȸ/����
create view vw_user1 as (select name, hp, age from user1);
create view vw_user2_age_under30 as (select * from user2 where age <30);
select * from user_views;

select * from vw_user1;
select * from vw_user2_age_under30;

drop view vw_user1;
drop view vw_user2_age_under30;

--�ǽ� 3.5 ������ ���� ���̺� ����
create table user6(
    SEQ number primary key,
    NAME varchar2(20),
    GENDER char(1),
    AGE number,
    ADDR varchar2(255)
    );
    
    create sequence seq_user6 increment by 1 start with 1;
    
    insert into user6 values (seq_user6.nextval, '������', 'M', 25, '���ؽ�');
    insert into user6 values (seq_user6.nextval, '������', 'M', 23, '���ֽ�');
    insert into user6 values (seq_user6.nextval, '�Ż��Ӵ�', 'F', 27, '������');
    select * from user6;
    
    --�ǽ��ϱ� 4.1 ����ڻ���
    alter session set "_oracle_script"=true;
    create user rhdyeji12 identified by 1234;
    
    --�ǽ��ϱ� 4.2 �������ȸ
    select * from all_users;
    
    select * from all_users where username='RHDYEJI12';
    
    --�ǽ��ϱ� 4.4 Role �ο�
    grant connect, resource to rhdyeji12;
    grant unlimited tablespace to rhdyeji12;
    
    
    















    