/*
    날짜 : 2025/07/15
    이름 : 정순권
    내용 : 3장 SQL 고급
*/

-- 실습하기 3-1. 테이블 생성 및 데이터 입력
create table EMP (
        EMPNO NUMBER(4) PRIMARY KEY,
        NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(1) NOT NULL,
        JOB NVARCHAR2(20) NOT NULL,
        DEPNO NUMBER(2) DEFAULT NULL,
        REFDATE DATE NOT NULL
);

DROP TABLE EMP;

create table DEPT (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(20) NOT NULL,
    DTEL NVARCHAR2(12) NOT NULL
);

DROP TABLE DEPT;

create table SALE (
    NO NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    EMPNO NUMBER(4) NOT NULL,
    YEAR NUMBER(4) NOT NULL,
    MONTH NUMBER(2) NOT NULL,
    PRICE NUMBER(10) default NULL
);

DROP TABLE SALE;

// 직원 테이블 데이터 입력
INSERT INTO EMP VALUES (1001, '김유신', 'M', '사원', 10, SYSDATE);
INSERT INTO EMP VALUES (1002, '김춘추', 'M', '대리', 20, SYSDATE);
INSERT INTO EMP VALUES (1003, '장보고', 'M', '과장', 10, SYSDATE);
INSERT INTO EMP VALUES (1004, '강감찬', 'M', '부장', 30, SYSDATE);
INSERT INTO EMP VALUES (1005, '신사임당', 'F', '대리', 20, SYSDATE);
INSERT INTO EMP VALUES (1006, '이황', 'M', '사원', 40, SYSDATE);
INSERT INTO EMP VALUES (1007, '이이', 'M', '과장', 20, SYSDATE);
INSERT INTO EMP VALUES (1008, '이순신', 'M', '사원', NULL, SYSDATE);
INSERT INTO EMP VALUES (1009, '허난설헌', 'F', '사원', NULL, SYSDATE);
INSERT INTO EMP VALUES (1010, '정약용', 'M', '대리', 50, SYSDATE);

// 부서 테이블 데이터 입력
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (10, '영업1부', '051-511-1000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (20, '영업2부', '051-511-2000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (30, '영업3부', '051-511-3000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (40, '영업4부', '051-511-4000');
INSERT INTO DEPT (DEPTNO, DNAME, DTEL) VALUES (50, '영업지원부', '051-511-5000');

// 매출 테이블 데이터 입력
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 1, 98100);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 1, 136000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 1, 80000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2023, 1, 78000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 1, NULL);

INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2023, 2, 23500);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2023, 2, 126000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2023, 2, 18500);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2023, 2, 19000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1010, 2023, 2, 53000);

INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1001, 2024, 1, 24000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 1, 109000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 1, 80000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 1, NULL);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1007, 2024, 1, 24000);

INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1002, 2024, 2, 160000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1003, 2024, 2, 101000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1004, 2024, 2, 43000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1005, 2024, 2, 24000);
INSERT INTO SALE (EMPNO, YEAR, MONTH, PRICE) VALUES (1006, 2024, 2, 109000);


-- 실습하기 2-1
SELECT * FROM EMP WHERE NAME != '김춘추';
SELECT * FROM EMP WHERE NAME <> '김춘추';
SELECT * FROM EMP WHERE NAME = '김유신';
--------------------------------------------------------
SELECT * FROM EMP WHERE JOB = '차장' AND DEPNO = 10;
SELECT * FROM EMP WHERE JOB = '차장' OR DEPNO = 10;
SELECT * FROM EMP WHERE JOB = '사원' AND DEPNO = 10;
SELECT * FROM EMP WHERE JOB = '사원' OR JOB = '대리';
SELECT * FROM EMP WHERE JOB IN ('사원', '대리');
--------------------------------------------------------
SELECT * FROM EMP WHERE NAME LIKE '김%';
SELECT * FROM EMP WHERE NAME LIKE '신%';
SELECT * FROM EMP WHERE NAME LIKE '이_';
SELECT * FROM EMP WHERE NAME LIKE '김__';
SELECT * FROM EMP WHERE NAME LIKE '_순%';
--------------------------------------------------------
SELECT * FROM EMP WHERE HP LIKE '010-1111%';
SELECT * FROM EMP WHERE DEPTNO IS NULL;
SELECT * FROM EMP WHERE DEPTNO IS NOT NULL;
SELECT * FROM EMP WHERE EMPNO >= 1005;
--------------------------------------------------------
SELECT * FROM DEPT WHERE DEPTNO = 10;
SELECT * FROM DEPT WHERE DNAME = '영업지원부';
SELECT * FROM DEPT WHERE DTEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPTNO IN (10, 30);
SELECT * FROM DEPT WHERE DNAME LIKE '영업__';
--------------------------------------------------------
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);

-- 실습하기 2-2
select * from sale order by price;
select * from sale order by price asc;
select * from sale order by price DESC;
select * from emp order by name;
select * from emp order by name desc;
select * from emp order by refdate asc;

select * from sale where price > 50000 order by price desc;
select * from sale
    where price > 50000
    order by year, month, price desc;

select * from sale fetch first 3 row only;
select * from sale offset 0 rows fetch next 3 rows only;
select * from sale offset 1 rows fetch next 2 rows only;
select * from sale offset 5 rows fetch next 3 rows only;
select * from sale order by price desc offset 3 rows fetch next 5 rows only;
select * from sale
    where price < 50000
    order by price desc
    fetch first 3 rows only;

SELECT * FROM SALE
    WHERE PRICE > 50000
    ORDER BY YEAR DESC, MONTH, PRICE DESC
    FETCH FIRST 5 ROWS ONLY;
    
-- 실습하기 2-3
SELECT DISTINCT DEPNO FROM EMP;
SELECT DISTINCT JOB, DEPNO FROM EMP;
SELECT EMPNO AS 사번, NAME 이름, GENDER AS "성별" FROM EMP;
SELECT EMPNO E, NAME N, GENDER G FROM EMP;

-- 실습하기 3-1. 다양한 SQL 숫자 함수 실습
SELECT SUM(PRICE) AS 합계 FROM SALE;
SELECT COUNT(*) AS 직원수 FROM EMP;
SELECT COUNT(EMPNO) AS 직원수 FROM EMP;
SELECT COUNT(DEPNO) AS 부서수 FROM EMP;

SELECT CEIL(1.2) FROM DUAL;
SELECT CEIL(1.8) FROM DUAL;
SELECT FLOOR(1.2) FROM DUAL;
SELECT FLOOR(1.8) FROM DUAL;
SELECT ROUND(1.2) FROM DUAL;
SELECT ROUND(1.8) FROM DUAL;

SELECT DBMS_RANDOM.VALUE FROM DUAL;
SELECT CEIL(DBMS_RANDOM.VALUE *10) FROM DUAL;

SELECT AVG(PRICE) AS 평균 FROM SALE;
SELECT MAX(PRICE) AS "최대값" FROM SALE;
SELECT MIN(PRICE) AS "최소값" FROM SALE;
    
// SELECT COUNT(JOB) AS "정직원 수" FROM SALE;

-- 실습하기 3-2. 다양한 SQL 문자 함수 실습
select 'Hello ORACLE!', LENGTH('Hello Oracle!') FROM DUAL;
select
    'HELLO ORACLE!',
    SUBSTR('HELLO ORACLE', 1, 3),
    SUBSTR('HELLO ORACLE', 3, 2),
    SUBSTR('HELLO ORACLE', 5)
FROM
    DUAL;

select
    INSTR('HELLO ORACLE!', 'L') AS INSTR_1, 
    INSTR('HELLO ORACLE!', 'L', -1) AS INSTR_2
FROM DUAL;

select '010-1234-5678', REPLACE('010-1234-5678', '-', '') from dual;

select 
    lpad('Oracle', 10, '#') as lpad, // (대상문자열, 전체길이, 패딩문자)
    rpad('Oracle', 10, '*') as rpad
from
    dual;

select concat(empno, name) from emp where name = '이순신';
SELECT EMPNO || NAME FROM EMP WHERE NAME = '정약용';

select
    '[_Oracle_]' AS BEFORE,
    '[' || TRIM(' _Oracle_ ') || ']' AS TRIMED
FROM DUAL;

// SYSDATE
SELECT
    SYSDATE,
    SYSDATE -1,
    SYSDATE +1
FROM
    DUAL;

SELECT
    ADD_MONTHS(SYSDATE, 1),
    ADD_MONTHS(SYSDATE, -1)
FROM
    DUAL;

SELECT
    MONTHS_BETWEEN(DATE '2025-07-13', DATE '2024-07-13') AS 개월차
FROM DUAL;

SELECT
    NEXT_DAY(SYSDATE, '월요일') AS 다음_월요일
FROM 
    DUAL;

-- 실습하기 3-4 

SELECT
    TO_CHAR(SYSDATE, 'YYYY') AS YYYY,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'DD') AS DD,
    TO_CHAR(SYSDATE, 'HH24') AS HH24,
    TO_CHAR(SYSDATE, 'MI') AS NI,
    TO_CHAR(SYSDATE, 'SS') AS SS,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD/HH24/MI/SS') AS 날짜시간
FROM
    DUAL;
    
INSERT INTO EMP 
    VALUES (1011, '안중근', 'M', '부장', 30, TO_CHAR(SYSDATE, 'YYYY/MM/DD/HH24/MI/SS'));


SELECT
    TO_DATE('20250714', 'YYYY/MM/DD') AS 날짜1,
    TO_DATE('250714', 'YY-MM-DD') AS 날짜2,
    TO_DATE(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 날짜3
FROM
    DUAL;
    
INSERT INTO EMP VALUES(1014, '유관순', 'F', '차장', 20, SYSDATE);


SELECT
    NO,
    EMPNO,
    YEAR,
    MONTH,
    NVL(PRICE, 0)
FROM SALE;

SELECT
    EMPNO,
    NAME,
    GENDER,
    JOB,
    NVL2(DEPNO, '정규직', '비정규직')
FROM EMP;

-- 실습하기 4-1
SELECT EMPNO FROM SALE GROUP BY EMPNO;
SELECT YEAR FROM SALE GROUP BY YEAR;
SELECT EMPNO, YEAR FROM SALE GROUP BY EMPNO, YEAR;

SELECT EMPNO, COUNT(*) AS 판매건수 FROM SALE GROUP BY EMPNO;
SELECT EMPNO, SUM(PRICE) AS 합계 FROM SALE GROUP BY EMPNO;

SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    GROUP BY EMPNO, YEAR;

SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    WHERE PRICE >= 50000
    GROUP BY EMPNO, YEAR
    HAVING SUM(PRICE) >= 200000
    ORDER BY 합계 DESC;

SELECT EMPNO, YEAR, SUM(PRICE) AS 합계 
    FROM SALE
    GROUP BY EMPNO, YEAR
    ORDER BY YEAR ASC, 합계 DESC;

SELECT EMPNO, SUM(PRICE) AS 합계 FROM SALE GROUP BY EMPNO HAVING SUM(PRICE) >= 200000;


-- 실습  5-1
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR = 2023
UNION
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR = 2024;

SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR = 2023
UNION ALL
SELECT EMPNO, MONTH, PRICE FROM SALE WHERE YEAR = 2024;

SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE
    WHERE YEAR = 2023
    GROUP BY EMPNO, YEAR
    UNION
    SELECT EMPNO, YEAR, SUM(PRICE) AS 합계
    FROM SALE 
    WHERE YEAR = 2024
    GROUP BY EMPNO, YEAR
    ORDER BY YEAR ASC, 합계 DESC;

-- 실습하기 5-2
SELECT EMPNO FROM SALE WHERE YEAR = 2023
INTERSECT
SELECT EMPNO FROM SALE WHERE YEAR = 2024;

-- 실습하기 5-3
SELECT EMPNO FROM SALE WHERE YEAR = 2023
MINUS
SELECT EMPNO FROM SALE WHERE YEAR = 2024;

-- 실습하기 6-1
SELECT *
FROM EMP E
JOIN DEPT D
ON E.DEPNO = D.DEPTNO;

SELECT *
FROM EMP E
JOIN DEPT D
USING (DEPTNO); -- 조인하려는 두 테이블의 동일한 컬럼명

SELECT * FROM EMP E, DEPT D WHERE E.DEPNO = D.DEPTNO;

SELECT
    S.NO,
    S.EMPNO,
    E.NAME,
    E.JOB,
    E.REFDATE,
    E.DEPNO,
    D.DNAME
FROM SALE S
JOIN EMP E ON S.EMPNO = E.EMPNO
JOIN DEPT D ON E.DEPNO = D.DEPTNO
WHERE PRICE > 100000 AND YEAR = 2024
ORDER BY S.PRICE DESC;

-- 실습하기 6-2
DELETE FROM EMP WHERE EMPNO = 1006;

SELECT 
    *
FROM SALE S
RIGHT JOIN EMP E ON S.EMPNO = E.EMPNO;























