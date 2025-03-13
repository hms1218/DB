/*
USER   
----------
ID(PK) VARCHAR2(100)
----------
PW VARCHAR2(100)
NAME VARCHAR2(50)   
ADDRESS VARCHAR2(100)
EMAIL VARCHAR2(50)
BIRTH DATE

PRODUCT
---------------
PRODUCT_NUM(PK) NUMBER
---------------
PRODUCT_NAME VARCHAR2(300)
PRODUCT_PRICE NUMBER
PRODUCT_COUNT NUMBER

외래키는 참조하려고 하는 컬럼의 타입과 크기가 일치해야 하고, 없는 컬럼을 참조할 수 없다.
ORDER      
------------------
ORDER_NUM(PK) NUMBER
------------------
ORDER_DATE DATE
ID(FK) VARCHAR2(100)
PRODUCT_NUM(FK) NUMBER
*/

CREATE TABLE "USER"(
	ID VARCHAR2(100) PRIMARY KEY,
	PW VARCHAR2(100),
	NAME VARCHAR2(50),
	ADDRESS VARCHAR2(100),
	EMAIL VARCHAR2(50),
	BIRTH DATE
)

CREATE TABLE PRODUCT(
	PRODUCT_NUM NUMBER PRIMARY KEY,
	PRDOUCT_NAME VARCHAR2(300),
	PRODUCT_PRICE NUMBER,
	PRODUCT_COUNT NUMBER
)

--주문테이블
CREATE TABLE "ORDER"(
	ORDER_NUM NUMBER PRIMARY KEY, -- 주문번호
	ORDER_DATE DATE,
	ID VARCHAR2(100),
	PRODUCT_NUM NUMBER,
	-- 외래키 설정(FOREIGN KEY)
	CONSTRAINT USER_FK FOREIGN KEY(ID) REFERENCES "USER"(ID),
	CONSTRAINT PRODUCT_FK FOREIGN KEY(PRODUCT_NUM) REFERENCES PRODUCT(PRODUCT_NUM)
)

CREATE TABLE FLOWER(
	FLOWER_NAME VARCHAR2(100) PRIMARY KEY,
	FLOWER_COLOR VARCHAR2(50),
	FLOWER_PRICE NUMBER
)

CREATE TABLE JAR(
	JAR_NUM NUMBER PRIMARY KEY,
	JAR_COLOR VARCHAR2(50),
	JAR_SAHPE VARCHAR2(50),
	FLOWER_NAME VARCHAR2(100),
	CONSTRAINT FLOWER_FK FOREIGN KEY(FLOWER_NAME) REFERENCES FLOWER(FLOWER_NAME)
)

-- SELECT

-- 사원 테이블에서 모든 내용을 조회하세요
SELECT * FROM EMPLOYEES;

-- 부서 테이블의 모든 정보를 조회하세요
SELECT * FROM DEPARTMENTS;

-- 사원 테이블에서 이름, 직종, 급여를 조회하세요
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES;

-- 사원 테이블에서 사번, 이름, 입사일, 급여 조회하세요
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

-- 사원 테이블에서 사번, 이름, 직종, 급여, 보너스비율, 실제보너스금액 출력 (SELECT절에서 간단한 연산도 가능)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT COMM FROM EMPLOYEES;

-- 사원 테이블에서 급여가 10000 이상인 사원들의 정보를 사번,이름,급여순으로 조회하세요
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 10000;

-- 사원 테이블에서 이름 MICHAEL인 사원의 사번, 이름, 급여를 조회
-- 데이터 대소문자를 구별해서 써야한다.
-- SQL에서 문자형 데이터는 ''에 넣어야 한다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'Michael';

-- 사원 테이블에서 직종이 IT_PROG인 사원들의 정보를 사번, 이름, 직종, 급여 순으로 출력하세요
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- 사원 테이블에서 급여가 10000이상 13000이하인 사원의 정보를 사원번호, 이름, 급여순으로 조회하세요
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <= 13000;

-- 사원 테이블에서 입사일이 05년 9월 21일인 사원의 정보를 사번,이름,입사일 순으로 출력하세요
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE >= '2005-09-21';

-- 사원 테이블에서 직종이 SA_MAN이거나 IT_PROG인 사원들의 모든 정보를 출력하세요
SELECT * FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN' OR JOB_ID = 'IT_PROG';

-- 사원 테이블에서 급여가 2200, 3200, 5000, 6800을 받는 사원의 정보를 사번,이름,직종,급여순으로 조회하세요
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY = 2200 OR SALARY = 3200 OR SALARY = 5000 OR SALARY = 6800;

-- SQL 연산자
-- 1. BETWEEN A AND B : A와 B사이의 값을 조회할 때 사용
-- 2. IN(A,B,C,D....) : OR을 대신해서 사용하는 연산자
-- 3. LIKE : 유사검색

-- 사원 테이블에서 06년도에 입사한 사원들의 정보를 사번,이름,직종,입사일 순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '2006-01-01' AND '2006-12-31';

SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN('SA_MAN','IT_PROG');

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY IN(2200,3200,5000,6800);

-- LIKE연산자(유사검색)
-- 쿼리문에 WHERE절에 주로 사용되며 부분적으로 일치하는 속성을 찾을 때 사용된다.
-- % : 모든 값
-- _ : 하나의 값
-- EX) 'A%' : A로 시작하는 모든값
-- '%A' : A로 끝나는 모든값
-- '%A%' : A를 포함하고 있는 모든값
-- '%A%B%' : A와 B를 포함하고 있는 모든값
-- 'A_' : A로 시작하는 두 글자의 데이터
-- 'A__' : A로 시작하는 세 글자의 데이터
-- '_A_' : 두 번째 글자에 A가 들어가는 세 글자의 데이터

-- 사원 테이블에서 사원들의 이름 중 M으로 시작하는 사원들의 정보를 사번,이름,직종순으로 출력하세요
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';

-- 사원 테이블에서 이름이 D로 끝나는 사원의 사번,이름,직종 순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%d';

-- 사원 테이블에서 이름에 a가 포함되어 있는 사원의 정보를 이름, 직종순으로 조회
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a%';

-- 이름에 소문자 o가 들어가면서 a로 끝나는 사원들의 정보를 이름, 급여순으로 조회
SELECT FIRST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%o%a';

-- 이름이 H로 시작하면서 6글자 이상인 사원의 정보를 사번, 이름순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'H_____%';

-- 사원 테이블에서 이름이 s가 포함되어 있지 않은 사원들만 사번, 이름 순으로 조회
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%s%';

-- OR 연산자를 통해서 여러개의 LIKE 조건을 연결할 수 있다.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%el%' OR FIRST_NAME LIKE '%en%';

-- INSERT
-- 테이블에 데이터를 추가하는 문법
-- INSERT INTO 테이블명 (컬럼명1,컬럼명2...)
-- VALUES(값1,값2...);

-- 성별은 'M' 또는 'W'만 들어갈 수 있다.
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES(0,'홍길동','컴공','M',TO_DATE('1980-01-02','YYYY-MM-DD'));

-- PK로 설정된 컬럼에는 값이 겹치거나 비워둘 수 없다.
INSERT INTO HR.TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(1, '허춘삼', '컴공', 'W', TO_DATE('1980-01-02','YYYY-MM-DD'));

-- CHECK 제약조건으로 1980-01-01보다 나이가 많은 사람은 추가할 수 없다.
INSERT INTO HR.TBL_STUDENT
(ID, NAME, MAJOR, GENDER, BIRTH)
VALUES(2, '김마리', '컴공', 'W', TO_DATE('2000-12-30','YYYY-MM-DD'));

-- 성별을 생략하면 DEFAULT 값인 'W'가 들어가게 된다.
INSERT INTO HR.TBL_STUDENT
(ID, NAME, MAJOR, BIRTH)
VALUES(3, '박정민', '컴공', TO_DATE('1980-01-02','YYYY-MM-DD'));

SELECT * FROM TBL_STUDENT;

-- 꽃 테이블, 화분 테이블
INSERT INTO FLOWER(FLOWER_NAME,FLOWER_COLOR,FLOWER_PRICE)
VALUES('장미꽃','빨간색',3000);

INSERT INTO FLOWER(FLOWER_NAME,FLOWER_COLOR,FLOWER_PRICE)
VALUES('해바라기','노란색',2000);

INSERT INTO FLOWER(FLOWER_NAME,FLOWER_COLOR,FLOWER_PRICE)
VALUES('안개꽃','흰색',4000);

SELECT * FROM FLOWER;

--INSERT ALL
--INTO 테이블명(컬럼명)VALUES(값);
--INTO 테이블명(컬럼명)VALUES(값);
--INTO 테이블명(컬럼명)VALUES(값);
--INTO 테이블명(컬럼명)VALUES(값);
--SELECT * FROM DUAL; 꼭!꼮!꼭ㄲ! DUAL : 가상의 테이블
-- DUAL 테이블을 이용한 SELECT구문은 단일 행을 반환하여 각 INTO절이 한번씩 실행되도록 한다.

-- 참조하는 테이블에 없는 데이터는 추가할 수 없다.
INSERT INTO HR.JAR
(JAR_NUM, JAR_COLOR, JAR_SAHPE, FLOWER_NAME)
VALUES(202503130003, '흰색', '네모', '해바라기');

SELECT * FROM JAR;

-- DELETE(삭제)
-- DELETE FROM 테이블명 WHERE 조건;

-- 외래키로 참조되고 있을 때 자식테이블에서 참조되고 있는 행을 먼저 삭제해야 부모테이블에서 삭제할 수 있다.
DELETE FROM JAR WHERE FLOWER_NAME = '해바라기';
DELETE FROM FLOWER WHERE FLOWER_NAME = '해바라기';

-- DELETE문에 조건을 쓰지 않으면 의도하지 않게 모든 데이터가 날아갈 수 있다.
DELETE FROM JAR;

-- UPDATE(수정하기)
-- UPDATE 테이블명
-- SET 컬럼명 = '변경값'
-- WHERE 조건식

--TBL_STUDENT테이블에서 홍길동의 전공을 경영학과로 수정하기
UPDATE TBL_STUDENT
SET MAJOR = '경영학과'
WHERE NAME = '홍길동';

SELECT * FROM TBL_STUDENT;

-- 테이블 사이에는 관계라는 개념이 존재하고 1:1, 1:N(1:다), N:M(다:다)의 관계가 있다.

-- 일대일 관계
-- 두 테이블 A,B가 있을 때 A의 정보와 B의 정보 하나가 연결된 관계
-- EX)한 사람은 하나의 여권만 소지할 수 있고, 하나의 여권은 한 사람에게만 발급된다.

-- 일대다 관계
-- 테이블 A의 레코드(행) 하나가 B의 여러 레코드(행)와 연결되는 관계
-- EX)한 사람이 여러 개의 부동산을 가질 수 있지만, 집은 주인이 한 명이다.

-- 다대다 관계
-- 테이블 A의 행 하나가 테이블 B의 행 여러개와,
-- 테이블 B의 행 하나가 테이블 A의 행 여러개와 연결된 관계
-- EX) 학생과 강의의 관계
-- 한 학생이 여러 강의를 수강할 수 있다.
-- 하나의 강의는 여러 학생들이 들을 수 있다.
-- 다대다 관계는 두 개의 테이블 사이에서 직접 구현할 수 없으므로
-- 연결 테이블을 사용하여 테이블 A와 B를 연결한다.
-- 연결 테이블은 두 테이블의 기본키를 외래키로 포함하며 복합 기본키로 지정하는 경우가 많다.
CREATE TABLE ARTIST(
	ARTISTNAME VARCHAR2(100) PRIMARY KEY,
	COUNTRY VARCHAR2(50),
	DEBUTYEAR DATE
)

CREATE TABLE CD(
	TITLE VARCHAR2(100) PRIMARY KEY,
	PRICE NUMBER,
	GENRE VARCHAR2(50),
	TRACKLIST VARCHAR2(50),
	ARTISTNAME VARCHAR2(100),
	CONSTRAINT NAME_FK FOREIGN KEY(ARTISTNAME) REFERENCES ARTIST(ARTISTNAME)
);

CREATE TABLE TRACK(
	TITLE VARCHAR2(100) PRIMARY KEY,
	RUNNINGTIME VARCHAR2(50),
	CDTITLE VARCHAR2(100),
	CONSTRAINT TITLE_FK FOREIGN KEY(CDTITLE) REFERENCES CD(TITLE)
);

-- 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의사원번호,이름 및 급여를 조회하세요
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID IN('10','30') AND SALARY > 1500;

-- 관리자가 없는 모든 사원의 이름 및 직종을 출력하세요
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 직업이 IT_PROG 또는 SA_MAN 이면서 급여가 1000,3000,5000이 아닌 모든 사원들의 이름, 직종 및 급여를 조회하세요
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_MAN' AND SALARY NOT IN(1000,3000,5000);