--실습하기 1-1

create table dept (
    deptno  number(2) constraint pk_dept primary key,
    dname   varchar(14),
    loc     varchar(13)
    );
    
create table emp (
    empno       number(4) constraint pk_emp primary key,
    ename       varchar2(10),
    job         varchar2(9),
    mgr         number(4),
    hiredate    date,
    sal         number(7, 2),
    comm        number(7, 2),
    deptno      number(2) constraint fk_deptno references dept
    );

create table salgrade (
    grade   number,
    losal   number,
    hisal   number
    );
    
create table bonus (
    ename   varchar2(10),
    job     varchar2(9),
    sal     number,
    comm    number
    );
    


 insert into dept values (10, 'accounting', 'new york');
 insert into dept values (20, 'research', 'dallas');
 insert into dept values (30, 'sales', 'chicago');
 insert into dept values (40, 'operations', 'boston');

 insert into emp values (7369, 'smith', 'clerk', 7902, '80-12-17', 800, null, 20);
 insert into emp values (7499, 'allen', 'salesman', 7698, '81-02-20',1600,300,30);
 insert into emp values (7521, 'ward', 'salesman', 7698, '81-02-22', 1250, 500, 30);
 insert into emp values (7566, 'jones', 'manager', 7839, '81-02-04',2975,null,20);
 insert into emp values (7654, 'martin', 'salesman', 7698, '81-09-28',1250,1400,30);
 insert into emp values (7698, 'blake', 'manager', 7839, '81-05-01',2850,null,30);
 insert into emp values (7782, 'clark', 'manager', 7839, '81-06-09',2450,null,10);
 insert into emp values (7788, 'scott', 'analyst', 7566, '87-04-19',3000,null,20);
 insert into emp values (7839, 'king', 'president', null, '81-11-17',5000,null,10);
 insert into emp values (7844, 'turner', 'salesman', 7698, '81-09-08',1500,0,30);
 insert into emp values (7876, 'adams','clerk', 7788, '87-05-23',1100,null,20);
 insert into emp values (7900, 'james', 'clerk', 7698, '81-12-03', 950,null,30);
 insert into emp values (7902, 'ford', 'analyst', 7566,
                        to_date('3-12-1981', 'DD-MM-YYYY'), 3000, null, 20);
 insert into emp values (7934, 'miller', 'clerk', 7782,
                        to_date('23-1-1982', 'DD-MM-YYYY'), 1300, null, 10);


 insert into salgrade values (1, 700, 1200);
 insert into salgrade values (2, 1201, 1400);
 insert into salgrade values (3, 1401, 2000);
 insert into salgrade values (4, 2001, 3000);
 insert into salgrade values (5, 3001, 9999);


 select * from emp;
 select empno, ename, deptno from emp; 


 select * from emp order by sal;
 select * from emp order by sal desc;
 select * from emp order by deptno asc, sal desc;


 select distinct deptno from emp;
 select distinct job, deptno from emp;
 select ename, sal, sal*12+comm, comm from emp;
 select ename, sal, sal*12+comm as annsal, comm from emp;


 select * from emp where deptno=30;
 select * from emp where deptno=30 and job='salesman';
 select * from emp where deptno=30 or job='clerk';
 select * from emp where sal * 12 = 36000;
 select * from emp where sal = 3000;
 select * from emp where sal != 3000;
 select * from emp where sal < 3000;
 select * from emp where not sal = 3000;
 select * from emp where job in ('manager', 'salesman', 'clerk');
 select * from emp where job not in ('manager', 'salesman', 'clerk');
 select * from emp where sal = 2000 and sal <= 3000;
 select * from emp where sal between 2000 and 3000;
 select * from emp where sal not between 2000 and 3000;
 select * from emp where ename like 's%';
 select * from emp where ename like '_l%';
 select * from emp where ename like '%am%';
 select * from emp where ename not like '%am%';
 select * from emp where comm = null;
 select * from emp where comm is null;
 select * from emp where comm is not null;

 select empno, ename, sal, deptno
 from emp
 where deptno = 10
 union
 select empno, ename, sal, deptno
 from emp
 where deptno = 20;

 select ename, length(ename) from emp;
 select ename, upper(ename), lower(ename), initcap(ename) from emp;
 select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5) from emp;
 select
    instr('hello oracle!', 'l') as instr_1,
    instr('hello oracle!', 'l', -1) as instr_2
 from dual;

 select '010-1234-5678', replace('010-1234-5678', '-', '') from dual;
 select lpad('oracle', 10, '#') as lpad, rpad('oracle', 10, '*') as rpad from dual;
 select concat(empno, ename) from emp where ename = 'scott';
 select empno || ename from emp where ename = 'scott';
 select
 '[ _oracle_ ]' as before,
 '[' || trim(' _oracle_ ') || ']' as trim
 from dual;
 
 select sum(sal) as 합계 from emp;
 select count(*) as 전체갯수 from emp;
 select count(comm) as comm_갯수 from emp;
 select avg(sal) as 평균 from emp;
 select count(comm) as comm_갯수 from emp;

 select
 round(123.56) as round,
 round(123.56, 0) as round_0,
 round(123.56, 1) as round_1,
 round(123.56, 2) as round_2
 from dual;
 select
 ceil(3.14),
 ceil(3.78),
 floor(3.14),
 floor(3.78)
 from dual;

 select sysdate, sysdate - 1, sysdate + 1 from dual;
 select
 add_months(sysdate, 1),
 add_months(sysdate, -1)
 from dual;
 
  select
    to_char(sysdate, 'yyyy') as yyyy,
    to_char(sysdate, 'mm') as mm,
    to_char(sysdate, 'dd') as dd,
    to_char(sysdate, 'hh24') as hh24,
    to_char(sysdate, 'mi') as mi,
    to_char(sysdate, 'ss') as ss,
    to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') as 날짜시간
  from dual;
 
  insert into emp values (1001, '김유신', '사원', 7566,
                to_char(sysdate, 'yyyy/mm/dd'), 3600, null, 10);

 select
    to_date('20180714', 'yyyy/mm/dd') as 날짜1,
    to_date('180714', 'yy-mm-dd') as 날짜2,
    to_date(sysdate, 'yyyy/mm/dd hh24:mi:ss') as 날짜시간
 from dual;
 
 insert into emp values (1002, '김춘추', '사원', 7566, sysdate, 3600, null, 10);
 insert into emp values (1003, '장보고', '대리', 7566,
                to_date(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 2600, null, 10);

 select empno, ename, sal, comm,
    nvl(comm, 0),
    nvl2(comm, 'null 아님', 'null 맞음')
 from emp;

 select avg(sal), deptno from emp group by deptno;
 select avg(sal), deptno from emp group by deptno, job; 
 
 
 select
    deptno,
    job,
    avg(sal)
 from emp
 group by deptno, job
 having avg(sal) = 2000;
 
 select
    deptno,
    job,
    avg(sal)
 from emp
 where sal <= 3000
 group by deptno, job
 having avg(sal) = 2000
 order by deptno, job;

 select *
 from emp e
 join dept d
 on e.deptno = d.deptno;
 
 select *
 from emp e
 join dept d
 using (deptno);
 
 select *
 from emp e, dept d
 where e.deptno = d.deptno;
 
 select
    e.empno,
    e.ename,
    e.job,
    e.mgr,
    e.hiredate,
    e.sal,
    e.deptno,
    d.dname,
    d.loc
 from emp e
 join dept d
 on e.deptno = d.deptno
 where sal <= 3000
 order by e.deptno, empno; 
 
 select * from emp e1 left join emp e2 on e1.mgr = e2.empno;
 select * from emp e1 right join emp e2 on e1.mgr = e2.empno;





  
    
    

