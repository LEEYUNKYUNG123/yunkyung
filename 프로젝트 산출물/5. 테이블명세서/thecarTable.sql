drop table member_tbl CASCADE CONSTRAINTS;
drop table car_tbl CASCADE CONSTRAINTS;
drop table reserve_tbl CASCADE CONSTRAINTS;
drop table INQUIRE_TBL CASCADE CONSTRAINTS;
drop table REPLY_TBL CASCADE CONSTRAINTS;
drop table INQUIRE_TBL CASCADE CONSTRAINTS;

 -- 관리자테이블
create table admin_tbl(
    a_id varchar2(50) not null,
    a_pw varchar2(50) not null,
    a_name varchar2(50) not null,
    PRIMARY KEY(a_id)
);
insert into admin_tbl values('admin','1234','관리자');
select * from admin_tbl;

-- 회원테이블(회원번호, 아이디, 비밀번호, 이름, 성별(M/F), 생년월일, 전화번호, 주소, 이메일, 운전면허증, 회원가입일, 탈퇴유무)
create table member_tbl(
    M_NO number UNIQUE not null,
    M_ID varchar2(30) primary key,
    M_PW varchar2(30) not null,
    M_NAME varchar2(20) not null,
    M_GENDER char(1) not null, 
    M_BRD char(8) not null,
    M_PHONE char(11) not null,
    M_ADD varchar2(200) not null,
    M_EMAIL varchar2(100) not null UNIQUE,
    M_DLNUM char(12) not null UNIQUE,
    M_JOINDATE date not null,
    M_EXIT char(6) not null 
    );
    
-- 상품테이블(상품번호, 차량명, 차량번호, 차량종류, 탑승인승, 연료, 연식, 색상, 대여자격, 특이사항, 상세정보, 종합보험, 자차면책, 대여가능여부)
create table car_tbl(
    C_NO number UNIQUE not null,
    C_NAME varchar2(50) primary key,
    C_NUM varchar2(30) UNIQUE not null,
    C_TYPE varchar2(30) not null,
    C_SEATER varchar2(10) not null,
    C_FUEL varchar2(20) not null,
    C_YEAR number not null,
    C_COLOR varchar2(20) not null,
    C_CRT varchar2(30) not null,
    C_ELSE varchar2(50) not null,
    C_DET varchar2(100) not null,
    C_INS varchar2(30) not null,
    C_SII varchar2(30) not null,
    C_RENT varchar2(10) not null
    );
    
--  예약테이블(예약순번, 예약번호, 이용금액, 반납예정일시, 대여예정일시, 실대여일시, 실반납일시, 전체손해면책제도, 고유식별정보수집및이용동의, 개인정보수집및이용목적동의, 자동차표준대여약관동의, 취소및위약금규정동의, 대여자격확인동의, 추가비용, 초과시간, 예약상태, 대여상태)
--  FK(회원아이디(M_ID), 차량명(C_NAME))
create table reserve_tbl(
    R_NO number UNIQUE not null,
    R_NUM varchar2(50) primary key,
    R_PRICE varchar2(30) not null,
    R_PRERETURNDATE DATE not null,
    R_PRERENTALDATE DATE not null,
    R_RENTALDATE DATE not null,
    R_RETURNDATE DATE not null,
    R_EXSYSTEM CHAR(1) not null,
    R_IDENTIFIINFO CHAR(1) not null,
    R_PERSONALINFO CHAR(1) not null,
    R_CARSTANDARD CHAR(1) not null,
    R_CANCEL CHAR(1) not null,
    R_QUALIFICATION CHAR(1) not null,
    R_EXCHARGE NUMBER not null,
    R_EXTIME DATE not null,
    R_STATUS varchar2(50) not null,
    R_RENTSTATUS varchar2(50) not null,
    M_ID varchar2(50) not null,
    C_NAME varchar2(50) not null,
    
    CONSTRAINT reserve_M_ID_FK FOREIGN KEY(M_ID)
    REFERENCES member_tbl(M_ID) ON DELETE CASCADE,
    CONSTRAINT reserve_C_NAME_FK FOREIGN KEY(C_NAME)
    REFERENCES car_tbl(C_NAME) ON DELETE CASCADE
 
 );
 
-- 문의사항테이블(게시글번호, 게시글비밀번호, 게시글제목, 게시글본문, 게시글첨부파일, 게시글작성자, 게시글작성일, 답글상태, 아이디)
--  FK(회원아이디(M_ID))
create table INQUIRE_TBL(
    I_NO number primary key,
    I_PW varchar2(50) not null,
    I_TITLE varchar2(100) not null,
    I_BODY varchar2(500) not null,
    I_FILE varchar2(50),
    I_WRITER varchar2(30) not null,
    I_DATE DATE not null,
    I_REPLY varchar2(10) not null,
    M_ID varchar2(50) not null,
   
    CONSTRAINT INQUIRE_M_ID_FK FOREIGN KEY(M_ID)
    REFERENCES member_tbl(M_ID) ON DELETE CASCADE
 );
 
-- 답글테이블(답글번호, 답글작성자, 답글제목, 답글본문, 답글작성일)
-- FK(게시글번호(I_NO)
create table REPLY_TBL(
    RP_NO number primary key,
    RP_WRITER varchar2(30) not null,
    RP_TITLE varchar2(100) not null,
    RP_BODY varchar2(500) not null,
    RP_DATE date not null,
    I_NO number not null,
   
    CONSTRAINT REPLY_I_NO_FK FOREIGN KEY(I_NO)
    REFERENCES INQUIRE_TBL(I_NO) ON DELETE CASCADE
 );
 
 
-- 공지사항테이블(공지사항번호, 공지사항제목, 공지사항본문, 공지사항작성일, 공지사항조회수) 
 create table INQUIRE_TBL(
    N_NO number primary key,
    N_TITLE varchar2(50) not null,
    N_BODY varchar2(1000) not null,
    N_DATE date not null,
    N_HITS number not null
 );
 
 
 
--시퀀스 
 
-- 회원테이블 회원번호(M_NO) 시퀀스
create SEQUENCE member_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- 상품테이블 상품번호(C_NO) 시퀀스
create SEQUENCE car_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- 예약테이블 예약순번(R_NO) 시퀀스
create SEQUENCE reserve_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- 문의사항테이블 게시글번호(I_NO) 시퀀스
create SEQUENCE inquire_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- 답글테이블 답글번호(RP_NO) 시퀀스
create SEQUENCE reply_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- 공지사항테이블 공지사항번호(N_NO) 시퀀스
create SEQUENCE notis_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;