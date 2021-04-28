--마지막줄에 커밋 넣어놨음


drop table qna;
drop table productImage;
drop table orderinfo;
drop table notice;
drop table coupon;
drop table cart;
drop table addressinfo;
drop table comments;
drop table MEMBER;
drop table product;
drop table review;
drop table Xmember;



SELECT * FROM USER_CONSTRAINTS ;


select * from seq;

DROP SEQUENCE addr_seq;
DROP SEQUENCE cart_seq;
DROP SEQUENCE member_seq;
DROP SEQUENCE notice_seq;
DROP SEQUENCE orderinfo_seq;
DROP SEQUENCE productimage_seq;
DROP SEQUENCE product_seq;
DROP SEQUENCE comments_seq;
DROP SEQUENCE qna_seq;
DROP SEQUENCE review_seq;





-- member table ======================================================================
create table member (
memberNum number not null,
id varchar2(100) constraint MEMBER_ID_PK primary key,
pw varchar2(100) not null,
name varchar2(100) not null,
phone varchar2(100) not null,
email varchar2(100) not null
);

--member sequence
create sequence member_seq;

--member insert
insert into member values (member_seq.nextval,'id1','pw1','name1','phone1','email1');
insert into member values (member_seq.nextval,'id2','pw2','name2','phone2','email2');
insert into member values (member_seq.nextval,'id3','pw3','name3','phone3','email3');
insert into member values (member_seq.nextval,'id4','123456','name4','phone4','email4');

commit work;

--product table ========================================================================
create table product(
productNum number constraint product_pn_pk primary key,
kinds VARCHAR2(100),
contents CLOB,
price number,
productName VARCHAR2(100),
amount number
);


--product sequence
CREATE SEQUENCE PRODUCT_SEQ
START WITH 1
INCREMENT BY 1;


--product insert
insert into product values(product_seq.nextval,'kinds1','contents1',1,'productName1',1);
insert into product values(product_seq.nextval,'kinds2','contents2',2,'productName2',2);
insert into product values(product_seq.nextval,'kinds3','contents3',3,'productName2',3);





--orderinfo table ========================================================================
CREATE TABLE ORDERINFO
(
    oiNum             NUMBER           PRIMARY KEY,
    productNum        NUMBER         references product(productNum)on delete cascade,
    orderNum          NUMBER           NOT NULL unique,
    orderDate         DATE             NOT NULL, 
    orderProcess      VARCHAR2(100)    NOT NULL, 
    orderCondition    VARCHAR2(100)    NOT NULL
);

--orderinfo seq
CREATE SEQUENCE ORDERINFO_SEQ
START WITH 1
INCREMENT BY 1;


--orderinfo insert
insert into orderinfo values(1,1,1,sysdate,'orderPorocess1','orderCondition1');
insert into orderinfo values(2,2,2,sysdate,'orderPorocess2','orderCondition2');
insert into orderinfo values(3,3,3,sysdate,'orderPorocess3','orderCondition3');


--productImage table =============================================================================
CREATE TABLE PRODUCTIMAGE
(
    imageNum      NUMBER           PRIMARY KEY,
    productNum    NUMBER           references product(productNum)on delete cascade,
    thumbnail     CLOB             NOT NULL, 
    contents      CLOB             NULL, 
    fileName      VARCHAR2(400)    NOT NULL, 
    ogName        VARCHAR2(400)    NOT NULL 
    
);

--seq
CREATE SEQUENCE PRODUCTIMAGE_SEQ
START WITH 1
INCREMENT BY 1;



--insert
insert into PRODUCTIMAGE values(1,1,'thumbnail1','contents1','fileName1','ogName1');
insert into PRODUCTIMAGE values(2,2,'thumbnail2','contents2','fileName2','ogName2');
insert into PRODUCTIMAGE values(3,3,'thumbnail3','contents3','fileName3','ogName3');



------------------------------------------------


-- Xmember table ===========================================================================================
create Table XMEMBER(
    xId varchar2(100) CONSTRAINT XMEMBER_ID_PK PRIMARY KEY,
    memberNum number,
    orderNum number CONSTRAINT XMEMBER_ON_FK REFERENCES ORDERINFO(orderNum) on delete cascade not null,
    xName varchar2(100) not null,
    orderPw varchar2(100) not null
);

-- insert
insert into XMEMBER values('xId1', member_seq.nextval, 1, 'xName1', 'orderPw1');
insert into XMEMBER values('xId2', member_seq.nextval, 2, 'xName2', 'orderPw2');
insert into XMEMBER values('xId3', member_seq.nextval, 3, 'xName3', 'orderPw3');
insert into XMEMBER values('xId4', member_seq.nextval, 3, 'xName4', 'orderPw1234');

-- xMember 지우기
drop table xMember;

commit work;


--cart ==============================================================================================
create table cart (
cartNum number constraint CART_CNUM_PK primary key,
productNum number constraint CART_PNUM_FK references product (productNum) not null,
id varchar2(100) constraint CART_ID_FK references member (id) on delete cascade not null
);

--cart sequence
create sequence cart_seq;

--cart insert
insert into cart values (cart_seq.nextval, 1,'id1');
insert into cart values (cart_seq.nextval, 2,'id2');
insert into cart values (cart_seq.nextval, 3,'id3');




--coupon =================================================================================================
create table coupon (
couponNum varchar2(400) constraint COUPON_CPNUM_PK primary key,
id varchar2(100) constraint COUPON_ID_FK references member (id) on delete cascade not null,
disRate number not null,
disPrice number not null,
useage varchar2(10) not null
);

--coupon insert
insert into coupon values ('couponNum1','id1',1,1,'Y');
insert into coupon values ('couponNum2','id2',2,2,'Y');
insert into coupon values ('couponNum3','id3',3,3,'Y');

select * from coupon;




--addressInfo ===============================================================================================
create table addressInfo (
addressNum number constraint ADDR_ANUM_PK primary key,
id varchar2(100) constraint ADDR_ID_FK references member (id)on delete cascade not null,
zipCode number not null,
majorAddr varchar2(100) not null,
minorAddr varchar2(100) not null,
addrMessage varchar2(200) not null,
orderNum number not null
);

--address sequence
create sequence addr_seq;

--address insert
insert into addressInfo values (addr_seq.nextval,'id1',1,'majorAddr1','minorAddr1','addMessage1',1);
insert into addressInfo values (addr_seq.nextval,'id2',2,'majorAddr2','minorAddr2','addMessage2',2);
insert into addressInfo values (addr_seq.nextval,'id3',3,'majorAddr3','minorAddr3','addMessage3',3);

commit;




drop table notice;
drop table qna;
drop table comments;
drop table review;

DROP SEQUENCE notice_seq;
DROP SEQUENCE qna_seq;
DROP SEQUENCE comments_seq;
DROP SEQUENCE review_seq;

--notice table =====================================================================================================
create table NOTICE(
   num number CONSTRAINT NOTICE_Number_PK PRIMARY KEY,
   title varchar2(100) not null,
   writer varchar2(100) not null,
   contents clob,
   regdate Date default sysdate not null,
   hit number default 0 not null
);


Create sequence notice_seq
start with 1;

insert into NOTICE values(notice_seq.nextval, 'nTitle1', 'id1', 'nContents1', sysdate, 0);
insert into NOTICE values(notice_seq.nextval, 'nTitle2', 'id2', 'nContents2', sysdate, 0);
insert into NOTICE values(notice_seq.nextval, 'nTitle3', 'id3', 'nContents3', sysdate, 0);



----------

-- QNA table =====================================================================================================
create table QNA(
   num number CONSTRAINT QNA_Number_PK PRIMARY KEY,
   productNum number CONSTRAINT QNA_PN_FK REFERENCES PRODUCT on delete cascade not null,
   title varchar2(100) not null,
   writer varchar2(100) CONSTRAINT QNA_QW_FK REFERENCES MEMBER (id) on delete cascade not null,
   contents clob,
   regdate Date default sysdate not null,
   hit number default 0 not null,
   ref number default 0 not null,
   step number default 0 not null,
   depth number default 0 not null
);


Create sequence qna_seq
start with 1;

insert into QNA values(qna_seq.nextval,1, 'qTitle1', 'id1', 'qContents1', sysdate, 0, 0, 0, 0);
insert into QNA values(qna_seq.nextval,2, 'qTitle2', 'id2', 'qContents2', sysdate, 0, 0, 0, 0);
insert into QNA values(qna_seq.nextval,3, 'qTitle3', 'id3', 'qContents3', sysdate, 0, 0, 0, 0);


--------

-- review table ================================================================================================
create table REVIEW(
   num number CONSTRAINT REVIEW_Number_PK PRIMARY KEY,
   title varchar2(100) not null,
   writer varchar2(100) CONSTRAINT REVIEW_RW_FK REFERENCES MEMBER (id) on delete cascade not null,
   contents clob,
   regdate Date default sysdate not null,
   hit number default 0 not null
);



Create sequence review_seq
start with 1;



insert into REVIEW values(review_seq.nextval, 'rTitle1', 'id1', 'rContents1', sysdate, 0);
insert into REVIEW values(review_seq.nextval, 'rTitle2', 'id2', 'rContents2', sysdate, 0);
insert into REVIEW values(review_seq.nextval, 'rTitle3', 'id3', 'rContents3', sysdate, 0);




-------


-- comments table ==================================================================================================
create table COMMENTS(
   num number CONSTRAINT COMMENTS_Number_PK PRIMARY KEY,
   reviewNum number CONSTRAINT REVIEW_RN_FK REFERENCES REVIEW on delete cascade not null,
   writer varchar2(100) CONSTRAINT COMMENT_CW_FK REFERENCES MEMBER (id) on delete cascade not null,
   contents clob,
   regdate Date default sysdate not null
);


Create sequence comments_seq
start with 1;


insert into COMMENTS values(comments_seq.nextval, 1, 'id1', 'cContents1',sysdate);
insert into COMMENTS values(comments_seq.nextval, 2, 'id2', 'cContents2',sysdate);
insert into COMMENTS values(comments_seq.nextval, 3, 'id3', 'cContents3',sysdate);



commit;


-------------


-- ?????????????????????????????????????????????????????????????????????????????????????????????????????
select * from notice;

update notice set title = 'nTitle1', writer = '1', contents = 'nContents1', hit = 0, regdate = sysdate 
where num = 3;
-- ?????????????????????????????????????????????????????????????????????????????????????????????????????
rollback;
commit work;

-- 욱창이 변경사항 21.04.28
alter table productImage drop column contents;


drop table cart;
DROP SEQUENCE cart_seq;


create table cart (
cartNum number constraint CART_CNUM_PK primary key,
productNum number constraint CART_PNUM_FK references product (productNum) not null,
id varchar2(100) constraint CART_ID_FK references member (id) on delete cascade not null,
cartStock number not null,
addDate date default sysdate
);

—cart sequence
create sequence cart_seq;

—cart insert
insert into cart (cartNum,productNum,id,cartStock) values (cart_seq.nextval, 1,'id1',1);
insert into cart  (cartNum,productNum,id,cartStock)values (cart_seq.nextval, 2,'id2',1);
insert into cart (cartNum,productNum,id,cartStock) values (cart_seq.nextval, 3,'id3',1);


alter table orderinfo modify (orderDate default sysdate);