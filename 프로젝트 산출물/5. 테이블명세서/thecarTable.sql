drop table member_tbl CASCADE CONSTRAINTS;
drop table car_tbl CASCADE CONSTRAINTS;
drop table reserve_tbl CASCADE CONSTRAINTS;
drop table INQUIRE_TBL CASCADE CONSTRAINTS;
drop table REPLY_TBL CASCADE CONSTRAINTS;
drop table INQUIRE_TBL CASCADE CONSTRAINTS;

 -- ���������̺�
create table admin_tbl(
    a_id varchar2(50) not null,
    a_pw varchar2(50) not null,
    a_name varchar2(50) not null,
    PRIMARY KEY(a_id)
);
insert into admin_tbl values('admin','1234','������');
select * from admin_tbl;

-- ȸ�����̺�(ȸ����ȣ, ���̵�, ��й�ȣ, �̸�, ����(M/F), �������, ��ȭ��ȣ, �ּ�, �̸���, ����������, ȸ��������, Ż������)
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
    
-- ��ǰ���̺�(��ǰ��ȣ, ������, ������ȣ, ��������, ž���ν�, ����, ����, ����, �뿩�ڰ�, Ư�̻���, ������, ���պ���, ������å, �뿩���ɿ���)
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
    
--  �������̺�(�������, �����ȣ, �̿�ݾ�, �ݳ������Ͻ�, �뿩�����Ͻ�, �Ǵ뿩�Ͻ�, �ǹݳ��Ͻ�, ��ü���ظ�å����, �����ĺ������������̿뵿��, ���������������̿��������, �ڵ���ǥ�ش뿩�������, ��ҹ�����ݱ�������, �뿩�ڰ�Ȯ�ε���, �߰����, �ʰ��ð�, �������, �뿩����)
--  FK(ȸ�����̵�(M_ID), ������(C_NAME))
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
 
-- ���ǻ������̺�(�Խñ۹�ȣ, �Խñۺ�й�ȣ, �Խñ�����, �Խñۺ���, �Խñ�÷������, �Խñ��ۼ���, �Խñ��ۼ���, ��ۻ���, ���̵�)
--  FK(ȸ�����̵�(M_ID))
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
 
-- ������̺�(��۹�ȣ, ����ۼ���, �������, ��ۺ���, ����ۼ���)
-- FK(�Խñ۹�ȣ(I_NO)
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
 
 
-- �����������̺�(�������׹�ȣ, ������������, �������׺���, ���������ۼ���, ����������ȸ��) 
 create table INQUIRE_TBL(
    N_NO number primary key,
    N_TITLE varchar2(50) not null,
    N_BODY varchar2(1000) not null,
    N_DATE date not null,
    N_HITS number not null
 );
 
 
 
--������ 
 
-- ȸ�����̺� ȸ����ȣ(M_NO) ������
create SEQUENCE member_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- ��ǰ���̺� ��ǰ��ȣ(C_NO) ������
create SEQUENCE car_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- �������̺� �������(R_NO) ������
create SEQUENCE reserve_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- ���ǻ������̺� �Խñ۹�ȣ(I_NO) ������
create SEQUENCE inquire_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- ������̺� ��۹�ȣ(RP_NO) ������
create SEQUENCE reply_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;

-- �����������̺� �������׹�ȣ(N_NO) ������
create SEQUENCE notis_seq
INCREMENT by 1
start with 1
minvalue 1
maxvalue 1000000
nocycle
cache 10;