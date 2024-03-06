/*
    날짜 : 2024/03/04
    이름 : 공예지
    내용 : 1장 데이터베이스와 DBMS 개요
*/


create table type_test_number(
    num1 number,
    num2 number(2),
    num3 number(3,1),
    num4 number(4,2),
    num5 number(5,6)
    );
    
    //num1 number
    insert into type_test_number (num1) values (1);    
    insert into type_test_number (num1) values (123);    
    insert into type_test_number (num1) values (123.74);
    insert into type_test_number (num1) values (123.12345);
    
    //num2 number(2)
    insert into type_test_number (num2) values (12);
    insert into type_test_number (num2) values (123);
    insert into type_test_number (num2) values (1.2);
    insert into type_test_number (num2) values (1.23);
    insert into type_test_number (num2) values (12.34567);
    insert into type_test_number (num2) values (12.56789);
    insert into type_test_number (num2) values (123.56789);
    
    //num3 number(3,1)
    insert into type_test_number (num3) values (12);
    insert into type_test_number (num3) values (123);
    insert into type_test_number (num3) values (12.1);
    insert into type_test_number (num3) values (12.1234);
    insert into type_test_number (num3) values (12.56789);
    insert into type_test_number (num3) values (123.56789);
         