/*
    날짜 : 2024/03/04
    이름 : 공예지
    내용 : 2장 SQL 기본 실습
*/
--실습하기 1.1 테이블 생성
create table USER1(
    ID      varchar2(20),
    Name    varchar2(20),
    HP      char(13),
    AGE     number
    );
    
    
--실습하기 1.2 데이터 추가
insert into user1 values ('A101', '김유신', '010-1234-1111', 25);
insert into user1 values ('A102', '김춘추', '010-1234-2222', 23);
insert into user1 values ('A103', '장보고', '010-1234-3333', 32);
insert into user1 (id, name, age) values ('A104', '강감찬', 45);
insert into user1 (id, name, hp) values ('A105', '이순신', '010-1234-5555');

--실습하기 1.3 데이터 조회
select * from user1;
select * from user1 where id='A101';
select * from user1 where name='김춘추';
select * from user1 where age > 30;
select id, name, age from user1;

--실습하기 1.4 데이터 수정
update user1 set hp='010-1234-4444' where id='A104';
update user1 set age=51 where id='A105';
update user1 set hp='010-1234-1001', age=27 where id='A101';

--실습하기 1.5 데이터 삭제
delete from user1 where id='A101';
delete from user1 where id='A102' and age=25;
delete from user1 where age >= 30;

--실습하기 2.1
create table user2(
id  varchar2(20) primary key,
name varchar2(20),
hp char(20),
age number(20)
);

--실습하기 2.2
create table user3(
id      varchar2(20) primary key,
name    varchar2(20),
hp      char(13) unique,
age     number(3)
);

--실습하기 2.3
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

insert into parent values ('P101', '김서현', '010-1234-1001');
insert into parent values ('P102', '이성계', '010-1234-1002');
insert into parent values ('P103', '신사임당', '010-1234-1003');

insert into child values ('C101','김유신','010-1234-2001','P101');
insert into child values ('C102','이방우','010-1234-2002','P102');
insert into child values ('C103','이방원','010-1234-2003','P102');
insert into child values ('C104','이이','010-1234-2004','P103');

--실습하기 2-4
create table user4(
name    varchar2(20) not null,
gender  char(1) not null,
age     int default 1,
addr    varchar2(255)
);

insert into user4 values ('김유신','M',23,'김해시');
insert into user4 values ('김춘추','M',21,'경주시');
insert into user4 (name, gender, addr) values ('신사임당','F','강릉시');
insert into user4 (name, gender) values ('이순신', 'M');
insert into user4 (name, age) values ('정약용', 33);

create table user5(
name    varchar2(20) not null,
gender  char(1) not null check(gender in('M', 'F')),
age     int default 1 check(age > 0 and age <100),
addr    varchar2(255)
);

insert into user5 values ('김유신','M',23,'김해시');
insert into user5 values ('김춘추','M',21,'경주시');
insert into user5 (name, gender, addr) values ('신사임당','F','강릉시');
insert into user5 (name, gender) values ('이순신', 'M');
insert into user5 (name, age) values ('정약용', 33);

--실습 3.1 데이터사전 사전 조회
select * from DIC;

select table_name from user_tables;

select owner, table_name from ALL_TABLES;

select * from DBA_TABLES;

select * from DBA_USERS;

--실습 3.2 인덱스 조회/생성/삭제

select * from USER_INDEXES;
select * from USER_IND_COLUMNS;

create INDEX IDX_USER1_UID on User1(`uid`);
select * from USER_IND_COLUMNS;

drop INDEX IDX_USER1_UID;
select * from user_ind_columns;

--실습 3.4 뷰 생성/조회/삭제
create view vw_user1 as (select name, hp, age from user1);
create view vw_user2_age_under30 as (select * from user2 where age <30);
select * from user_views;

select * from vw_user1;
select * from vw_user2_age_under30;

drop view vw_user1;
drop view vw_user2_age_under30;

--실습 3.5 시퀀스 적용 테이블 생성
create table user6(
    SEQ number primary key,
    NAME varchar2(20),
    GENDER char(1),
    AGE number,
    ADDR varchar2(255)
    );
    
    create sequence seq_user6 increment by 1 start with 1;
    
    insert into user6 values (seq_user6.nextval, '김유신', 'M', 25, '김해시');
    insert into user6 values (seq_user6.nextval, '김춘추', 'M', 23, '경주시');
    insert into user6 values (seq_user6.nextval, '신사임당', 'F', 27, '강릉시');
    select * from user6;
    
    --실습하기 4.1 사용자생성
    alter session set "_oracle_script"=true;
    create user rhdyeji12 identified by 1234;
    
    --실습하기 4.2 사용자조회
    select * from all_users;
    
    select * from all_users where username='RHDYEJI12';
    
    --실습하기 4.4 Role 부여
    grant connect, resource to rhdyeji12;
    grant unlimited tablespace to rhdyeji12;
    
    
    















    