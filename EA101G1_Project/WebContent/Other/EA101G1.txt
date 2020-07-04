----------------------------------------------------------
--DROP TABLE BEFORE CREATING
DROP TABLE CUSTOMER_MESSAGE;
DROP TABLE ONE_TO_ONE;
DROP TABLE DISCOUNT_LIST;
DROP TABLE PRODUCT_ORDER_LIST;
DROP TABLE PRODUCT_ORDER;
DROP TABLE FAVOURITE_PRODUCT;
DROP TABLE PRODUCT;
DROP TABLE DISCOUNT;
DROP TABLE PRODUCTORDSTAT;
DROP TABLE PRODUCT_TYPE;
DROP TABLE COMM;
DROP TABLE FAVORITE_POST;
DROP TABLE POST;
DROP TABLE PTYPE;
DROP TABLE MEMBER;


DROP SEQUENCE CM_SEQ;
DROP SEQUENCE CR_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE SEQ_DIS_ID ;
DROP SEQUENCE SEQ_ORESTAT_ID ;
DROP SEQUENCE SEQ_P_ID;
DROP SEQUENCE SEQ_PO_ID;
DROP SEQUENCE POST_SEQ;
DROP SEQUENCE COMM_SEQ;
DROP SEQUENCE PTYPE_SEQ;

--DROP TABLE BEFORE CREATING
----------------------------------------------------------

ALTER SESSION SET NLS_DATE_FORMAT = 'yyyy-mm-dd';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'yyyy-mm-dd hh24:mi:ss';

-----------------------------TABLE-----------------------------

CREATE TABLE MEMBER(
    MEM_ID VARCHAR2(30) PRIMARY KEY NOT NULL,
    MEM_EMAIL VARCHAR2(30) UNIQUE NOT NULL,
    MEM_PASS VARCHAR2(30) NOT NULL,
    MEM_NAME VARCHAR2(50),
    MEM_ICON BLOB,
    MEM_PHONE VARCHAR2(30),
    MEM_ADDR VARCHAR2(200),
    BANK_ACC VARCHAR2(30),
    CARD_NO VARCHAR2(16),
    CARD_YY VARCHAR2(4),
    CARD_MM VARCHAR2(2),
    CARD_SEC VARCHAR2(3),
    MEM_AUTHO NUMBER(2) NOT NULL,
    MEM_BONUS NUMBER(30),
    MEM_JOINDAT DATE DEFAULT CURRENT_TIMESTAMP,
    MEM_BIRTH DATE,
    MEM_WARN NUMBER(30)
);

CREATE TABLE CUSTOMER_MESSAGE(
CM_ID VARCHAR2(30) not null PRIMARY KEY,
CM_TIME TIMESTAMP DEFAULT current_timestamp,
CM_WORD clob,
CM_PIC blob,
CM_STATUS NUMBER(1),
CM_CUSTOMERID VARCHAR2(30) references MEMBER(MEM_ID)
);

CREATE TABLE ONE_TO_ONE(
CR_ID VARCHAR2(30) not null PRIMARY KEY,
USER_ONE VARCHAR2(30) references MEMBER(MEM_ID),
USER_TWO VARCHAR2(30) references MEMBER(MEM_ID),
CR_TIME TIMESTAMP DEFAULT current_timestamp,
CR_WORD clob,
CR_PIC blob,
CR_STATUS NUMBER(1)
);

CREATE TABLE PTYPE(
    PTYPE_ID NUMBER(30) PRIMARY KEY NOT NULL,
    TYPE VARCHAR2(30)
);

CREATE TABLE POST(
    POST_ID VARCHAR2(30) PRIMARY KEY NOT NULL,
    MEM_ID VARCHAR2(30) NOT NULL,
    PTYPE_ID NUMBER(30) NOT NULL,
    P_STATUS NUMBER(1) NOT NULL,
    P_TITLE VARCHAR2(200) NOT NULL,
    TEXT CLOB NOT NULL,
    IMAGE BLOB,
    LAST_EDIT TIMESTAMP,
    POST_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_POST_MEMBER
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER(MEM_ID),
    CONSTRAINT FK_POST_PTYPE
    FOREIGN KEY (PTYPE_ID) REFERENCES PTYPE(PTYPE_ID)
);

CREATE TABLE COMM(
    COMM_ID VARCHAR2(30) PRIMARY KEY NOT NULL,
    POST_ID VARCHAR2(30) NOT NULL,
    MEM_ID VARCHAR2(30) NOT NULL,
    C_STATUS NUMBER(1) NOT NULL,
    TEXT CLOB NOT NULL,
    LAST_EDIT TIMESTAMP,
    POST_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_COMM_POST
    FOREIGN KEY (POST_ID) REFERENCES POST(POST_ID),
    CONSTRAINT FK_COMM_MEMBER
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER(MEM_ID)
);

CREATE TABLE FAVORITE_POST(
    MEM_ID VARCHAR2(30),
    POST_ID VARCHAR2(30),
    CONSTRAINT PK_FAV
    PRIMARY KEY (MEM_ID, POST_ID),
    CONSTRAINT FK_FAV_MEMBER
    FOREIGN KEY (MEM_ID) REFERENCES MEMBER(MEM_ID),
    CONSTRAINT FK_FAV_POST
    FOREIGN KEY (POST_ID) REFERENCES POST(POST_ID)
);

CREATE TABLE PRODUCT_TYPE(
    PT_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
    TYPENAME VARCHAR2(30)
);

CREATE TABLE PRODUCTORDSTAT(
    ORDSTAT_ID NUMBER(1) PRIMARY KEY NOT NULL,
    ORDSTAT VARCHAR2(10)
);

CREATE TABLE DISCOUNT(
    DIS_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
    DIS_NAME VARCHAR2(40),
    STAR_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    END_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PRODUCT(
    P_ID VARCHAR2(10) PRIMARY KEY NOT NULL,
    PT_ID VARCHAR2(10) REFERENCES PRODUCT_TYPE(PT_ID) NOT NULL,
    P_NAME VARCHAR2(40),
    P_PRICE NUMBER,
    P_IMAGE BLOB,
    P_INFO CLOB,
    P_SALES NUMBER,
    P_STOCK NUMBER,
    P_ADD_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    P_STAT NUMBER
);

CREATE TABLE FAVOURITE_PRODUCT(
    P_ID VARCHAR2(10) REFERENCES PRODUCT(P_ID)  NOT NULL,
    MEM_ID VARCHAR(10) REFERENCES MEMBER(MEM_ID)  NOT NULL,
    PRIMARY KEY(P_ID,MEM_ID)
);

CREATE TABLE PRODUCT_ORDER(
    PO_ID VARCHAR2(20) PRIMARY KEY NOT NULL,
    MEM_ID VARCHAR2(20) REFERENCES MEMBER(MEM_ID),
    ORDSTAT_ID NUMBER(10) REFERENCES PRODUCTORDSTAT(ORDSTAT_ID),
    ADD_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    RETURN_FORM CLOB
);

CREATE TABLE PRODUCT_ORDER_LIST(
    PO_ID VARCHAR2(20) REFERENCES PRODUCT_ORDER(PO_ID)  NOT NULL,
    P_ID VARCHAR2(10) REFERENCES PRODUCT(P_ID)  NOT NULL,
    ORDER_QUA NUMBER,
    P_PRICE NUMBER,
    PRIMARY KEY(PO_ID,P_ID)
);

CREATE TABLE DISCOUNT_LIST(
    P_ID VARCHAR2(10) REFERENCES PRODUCT(P_ID)  NOT NULL,
    DIS_ID VARCHAR2(10) REFERENCES DISCOUNT(DIS_ID)  NOT NULL,
    DIS_PRICE NUMBER,
    PRIMARY KEY(P_ID,DIS_ID)
);

-----------------------------TABLE-----------------------------

-----------------------------SEQUENCE-----------------------------

CREATE SEQUENCE MEMBER_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE SEQ_DIS_ID 
INCREMENT BY 1 
START WITH 1 
NOMAXVALUE
;

CREATE SEQUENCE SEQ_ORESTAT_ID 
INCREMENT BY 1 
START WITH 1  
NOMAXVALUE 
;
CREATE SEQUENCE SEQ_P_ID 
INCREMENT BY 1 
START WITH 1 
NOMAXVALUE
;
CREATE SEQUENCE SEQ_PO_ID 
INCREMENT BY 1 
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE PTYPE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE POST_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE COMM_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE CM_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

CREATE SEQUENCE CR_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
;

-----------------------------SEQUENCE-----------------------------

-----------------------------新增會員-----------------------------

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'servereDiarrhea@gmail.com', '123456', '早餐店大冰奶', '0912345678', '桃園市中壢區中大路300號', '121234512345', '1234567898765432', '2028', '11', '876', 2, 5000, to_date('1970-01-01', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'pg18Guardian@gmail.com', '123456', '十八禁銅人', '0987654321', '桃園市中壢區三光路115號', '43215678912345', '9876123476545678', '2023', '04', '551', 2, 499, to_date('1970-01-02', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'neutralVoter@gmail.com', '123456', '中壢李姓選民', '0923456789', '桃園市中壢區健行路229號', '843257564928', '7364856382659380', '2021', '06', '366', 2, 16888, to_date('1970-01-03', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'alBacino@gmail.com', '123456', '艾爾不怕西諾', '0934567890', '桃園市中壢區林森路95號', '47584776534274', '5828565532195890', '2011', '02', '313', 2, 23999, to_date('1970-01-04', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'tomohisaAtFGS@gmail.com', '123456', '金寶山下製酒', '0945678901', '桃園市中壢區元化路357號', '8475875947599', '5638449676900713', '2028', '10', '335', 2, 33666, to_date('1970-01-05', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'johnCenan@gmail.com', '123456', '江西男', '0956789012', '桃園市平鎮區振興路2號', '334785769930', '2274388900216475', '2031', '10', '585', 2, 66666, to_date('1970-01-06', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'iPadWarmWater@gmail.com', '123456', '一定iPad溫開水', '0967890123', '桃園市平鎮區環南路三段100號', '54909483775894', '1385966849604958', '2024', '05', '984', 2, 55123, to_date('1970-01-07', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'ayalReallyStrict@gmail.com', '123456', '阿粵真der很嚴格', '0978901234', '桃園市中壢區廣州路25號', '447384758672', '6485938495069485', '2029', '12', '374', 2, 123456, to_date('1970-01-08', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, BANK_ACC, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'fiveSpeedMouth@gmail.com', '123456', '投資一定有風險', '0989012345', '桃園市中壢區龍東路750號', '31326654694948', '8377586849586757', '2026', '08', '394', 2, 23456, to_date('1970-01-09', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'fiveSpeedMouth2@gmail.com', '123456', '基金投資有賺有賠', '0990123456', '桃園市八德區山下街115號', '3948586948594739', '2023', '04', '118', 1, 34567, to_date('1970-01-10', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, CARD_NO, CARD_YY, CARD_MM, CARD_SEC, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'prospectus@gmail.com', '123456', '申購前應詳閱公開說明書', '0901234567', '桃園市八德區廣德里18鄰廣興路601巷25號', '8374857687748576', '2022', '09', '368', 1, 45678, to_date('1970-01-11', 'yyyy-mm-dd'), 0);

INSERT INTO member 
(MEM_ID, MEM_EMAIL, MEM_PASS, MEM_NAME, MEM_PHONE, MEM_ADDR, MEM_AUTHO, MEM_BONUS, MEM_BIRTH, MEM_WARN)
VALUES 
('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'), 'admin@gmail.com', '123456', '平台管理員', '0901234567', '桃園市中壢區華勛街363巷', 1, 50000, to_date('1970-01-12', 'yyyy-mm-dd'), 0);

-----------------------------新增會員-----------------------------

---商品分類 PRODUCT_TYPE---

INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('1',3,'0'),'Switch主機');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('2',3,'0'),'Switch遊戲');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('3',3,'0'),'Switch周邊');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('4',3,'0'),'PS4主機');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('5',3,'0'),'PS4遊戲');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('6',3,'0'),'PS4周邊');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('7',3,'0'),'XBOX主機');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('8',3,'0'),'XBOX遊戲');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('9',3,'0'),'XBOX周邊');
INSERT INTO PRODUCT_TYPE(PT_ID,TYPENAME)
VALUES('PT'||LPAD('10',3,'0'),'其他');

---商品分類 PRODUCT_TYPE---

---商品訂單狀態種類 PRODUCTORDSTAT---

INSERT INTO PRODUCTORDSTAT(ORDSTAT_ID,ORDSTAT)
VALUES(1,'已取消');
INSERT INTO PRODUCTORDSTAT(ORDSTAT_ID,ORDSTAT)
VALUES(2,'已出貨');
INSERT INTO PRODUCTORDSTAT(ORDSTAT_ID,ORDSTAT)
VALUES(3,'待審核');
INSERT INTO PRODUCTORDSTAT(ORDSTAT_ID,ORDSTAT)
VALUES(4,'已退貨');
INSERT INTO PRODUCTORDSTAT(ORDSTAT_ID,ORDSTAT)
VALUES(5,'已完成');

---商品訂單狀態種類 PRODUCTORDSTAT---

---限時優惠專案 DISCOUNT---

INSERT INTO DISCOUNT(DIS_ID,DIS_NAME,STAR_DATE,END_DATE)
VALUES('DIS'||LPAD(TO_CHAR(SEQ_DIS_ID.NEXTVAL),3,'0'),'單身狗優惠','2020-11-11','2020-11-12');
INSERT INTO DISCOUNT(DIS_ID,DIS_NAME,STAR_DATE,END_DATE)
VALUES('DIS'||LPAD(TO_CHAR(SEQ_DIS_ID.NEXTVAL),3,'0'),'爸爸節優惠','2020-08-08','2020-08-09');
INSERT INTO DISCOUNT(DIS_ID,DIS_NAME,STAR_DATE,END_DATE)
VALUES('DIS'||LPAD(TO_CHAR(SEQ_DIS_ID.NEXTVAL),3,'0'),'聖誕節優惠','2020-12-25','2020-12-26');

---限時優惠專案 DISCOUNT---

---商城商品 PRODUCT---

INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT001','Nintendo Switch',9780,'
▉ 可遊玩時間加長!!!

▉ 遊戲生活變得更加互動

▉ 改變形態多種遊戲模式：TV模式、桌上模式、手提模式

▉ 最多連線8台主機，進行對戰或協力遊戲

▉ Joy-Con內置「HD震動」體驗逼真細膩臨場感

▉ 台灣公司貨，提供1年保固'
,2,10,1);

INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT002','集合啦！動物森友會',1790,'
主機平台：Nintendo Switch ( NS )

遊戲類型：其他

發售日期：2020-03-20

遊戲人數：多人

作品分級：保護級

製作廠商：Nintendo

發行廠商：Nintendo

代理廠商：香港任天堂

官方網站：https://www.nintendo.tw/switch/animal_crossing_new_horizons/'
,3,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT003','動物之森 支架 for Nintendo Switch ',550,'
■ Nintendo Switch 專用桌上型支架

■ 18mm超輕巧NS螢幕立架可折疊、輕巧好攜帶、三段式角度調整

■ 貼心充電孔、可一邊充電一邊遊玩'
,1,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT004','PS4 Pro 專業版 主機 極致黑 1TB',12980,'
■全新CUH-7200系列

■硬體容量為1TB

■支援 4K 超高解析度

■PS4 遊戲均以1080p 解像度呈現

■支援已發售及將會發售的所有PS4遊戲'
,5,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT005','湯姆克蘭西：全境封鎖 2',590,'
主機平台：PS4

遊戲類型：射擊

發售日期：2019年預定

遊戲人數：多人

作品分級：CERO D

製作廠商：Massive Entertainment

發行廠商：Ubisoft

官方網站：https://tomclancy-thedivision.ubisoft.com/game/en-gb/home'
,2,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT006','原廠無線手把',1780,'
適用於電腦和Xbox One

有線控制器

舒適度及操作度提升',3,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT007','Xbox One S',7980,'
▉ 全面數位化，個人遊戲庫

▉ 超值的價錢 豐富的遊戲和娛樂

▉ 效能依然強悍，支援4K與HDR

▉ 內含3款遊戲

▉ 本主機無藍光光碟機'
,4,10,1);
INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT008','絕地求生',839,'
遊戲類型：射擊

發售日期：2017-12-12

遊戲人數：多人

作品分級：CERO D

製作廠商：Bluehole,PlayerUnknown''s Battle Royale G

發行廠商：Microsoft Studios

代理廠商：台灣微軟

官方網站：https://playbattlegrounds.com/'
,1,10,1);

INSERT INTO PRODUCT(P_ID,PT_ID,P_NAME,P_PRICE,P_INFO,P_SALES,P_STOCK,P_STAT)
VALUES('P'||LPAD(TO_CHAR(SEQ_P_ID.NEXTVAL),3,'0'),'PT009','Xbox One 無線控制器(黑色)',1549,'
適用於電腦和Xbox One

有線控制器

舒適度及操作度提升',0,10,1);

---商城商品 PRODUCT---

---我的最愛．商城 FAVOURITE_PRODUCT---

INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P001','M000001');
INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P003','M000001');
INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P005','M000001');
INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P004','M000002');
INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P005','M000002');
INSERT INTO FAVOURITE_PRODUCT(P_ID,MEM_ID)
VALUES('P009','M000002');

---我的最愛．商城 FAVOURITE_PRODUCT---

---商城訂單 PRODUCT_ORDER---

INSERT INTO PRODUCT_ORDER(PO_ID,MEM_ID,ORDSTAT_ID)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||LPAD(TO_CHAR(SEQ_PO_ID.NEXTVAL),6,'0'),'M000001',2);
INSERT INTO PRODUCT_ORDER(PO_ID,MEM_ID,ORDSTAT_ID)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||LPAD(TO_CHAR(SEQ_PO_ID.NEXTVAL),6,'0'),'M000002',5);

---商城訂單 PRODUCT_ORDER---

---商城訂單明細 PRODUCT_ORDER_LIST---

INSERT INTO PRODUCT_ORDER_LIST(PO_ID,P_ID,ORDER_QUA,P_PRICE)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||'000001','P002',1,1790);
INSERT INTO PRODUCT_ORDER_LIST(PO_ID,P_ID,ORDER_QUA,P_PRICE)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||'000001','P003',1,550);
INSERT INTO PRODUCT_ORDER_LIST(PO_ID,P_ID,ORDER_QUA,P_PRICE)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||'000002','P005',1,590);
INSERT INTO PRODUCT_ORDER_LIST(PO_ID,P_ID,ORDER_QUA,P_PRICE)
VALUES(TO_CHAR(sysdate,'yyyy-mm-dd')||'-'||'000002','P009',2,1549);

---商城訂單明細 PRODUCT_ORDER_LIST---

---限時優惠專案細項 DISCOUNT_LIST---

INSERT INTO DISCOUNT_LIST(P_ID,DIS_ID,DIS_PRICE)
VALUES('P001','DIS001',1111);
INSERT INTO DISCOUNT_LIST(P_ID,DIS_ID,DIS_PRICE)
VALUES('P002','DIS002',8888);
INSERT INTO DISCOUNT_LIST(P_ID,DIS_ID,DIS_PRICE)
VALUES('P003','DIS003',520);

---限時優惠專案細項 DISCOUNT_LIST---

-----------------------------新增文章類型-----------------------------

INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, '心得');
INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, '情報');
INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, '閒聊');
INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, '問題');
INSERT INTO ptype (ptype_id, type) VALUES (ptype_seq.NEXTVAL, '平台資訊');

-----------------------------新增文章類型-----------------------------

-----------------------------新增文章-----------------------------

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000001', 3, 1, '一直拉 從昨晚腹瀉了24小時怎麼辦？', '
大家好

我肥宅啦

昨天晚上突然猛拉

一開始覺得還好有點嚴重（我想說還好）

就吃新表飛鳴 跑去睡了

結果被屎意嚇醒 整床都是拉稀

昨天連續拉了一整天
好不容易晚上九點  控制一下 去看醫生

回家吃了一包藥 吃了雞湯粥

剛過十二點 想說睡覺時間差不多了

吃「一顆強力止瀉藥」

結果這短短一小時我又拉了四次

我是不是得到什麼病毒啊......

醫生也只說吃壞肚子而已嗚嗚嗚嗚
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000002', 3, 1, '為什麼才剛上班就有人在刷牙？', '
如題

為什麼才剛上班就有人在刷牙？

刷牙不是起床在家就刷玩了嗎？

同樣也是有人在上班剪指甲

在公司剪有什麼魔力嗎？

我很好奇
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000002', 3, 1, '8+9屁孩語錄有哪些？', '
大家安安

#Just do it

#莫忘初衷

#狼若回頭 不是報恩就是報仇

#OO在走 XX要有

8+9屁孩語錄還有哪些？
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000002', 3, 1, '只有台灣的牛排有麵嗎？', '
除了一些外國或高檔的餐廳以外

台灣本地不管是夜市或連鎖店、小牛排館的牛排大都是有附加麵的

台灣人從小也是很理所當然牛排有麵

但是其它國家的聽說都只有肉跟主菜而已，中國沒吃過不知道

有沒有全世界只有台灣的牛排有麵的八卦？
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000002', 3, 1, '在山上種田養豬雞牛羊自己自足要多少錢？', '
在山上，蓋間小屋，屋子四周，種田種地瓜馬玲薯各種菜葱薑蒜

再養些豬雞牛羊，想吃肉就殺一隻

過著盡量少花錢，自己自足的生活

從此不再被政客資本家銀行家剝削

醬要多少地多少錢啊

在山上種田養豬雞牛羊自己自足要多少錢？
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000001', 3, 1, '欸，白開水不是白色的啊？', '
長輩每次都說
你們小孩子啊，只會喝飲料
都不喝白開水

我想了想
不對啊

開水就不是白色的
是在白什麼？
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000001', 3, 1, '台南沙茶火鍋誰才是最強', '
乳啼

台南號稱美食聖地，是否有能屌打林聰明或是台中

汕頭沙茶鍋的沙茶火鍋呢？

小豪洲 和二月牌 夠格嗎？

還是又是我家巷口屌打？

有掛嗎？
', SYSDATE);

INSERT INTO post
(POST_ID, MEM_ID, PTYPE_ID, P_STATUS, P_TITLE, TEXT, LAST_EDIT)
VALUES
('POST'||LPAD(to_char(post_seq.NEXTVAL), 6, '0'), 'M000001', 3, 1, '出桶了該如何慶祝？！', '
大家晚安啊
是這樣的
我剛剛發現我出桶了

上個月因為不小心超貼問卦
所以被桶了一個月
真的是有夠智障

忍了一個月又可以在八卦發言
感覺真好
所以我該如何慶祝？
有卦嗎？
', SYSDATE);

-----------------------------新增文章-----------------------------

-----------------------------新增留言-----------------------------

INSERT INTO comm
(COMM_ID, POST_ID, MEM_ID, C_STATUS, TEXT, LAST_EDIT)
VALUES
('COMM'||LPAD(to_char(COMM_SEQ.NEXTVAL), 6, '0'), 'POST000001', 'M000002', 1, '真的學不到什麼東西 除非他玩蠻王之類的 不過大部分都練角 而且也很少看小地圖 也不會去預測jg位置 都是做效果居多 如果學他玩大機率會下去', SYSDATE);

INSERT INTO comm
(COMM_ID, POST_ID, MEM_ID, C_STATUS, TEXT, LAST_EDIT)
VALUES
('COMM'||LPAD(to_char(COMM_SEQ.NEXTVAL), 6, '0'), 'POST000001', 'M000005', 1, '謝謝各位的建議 我還在銅牌地獄慢慢往上爬....', SYSDATE);

INSERT INTO comm
(COMM_ID, POST_ID, MEM_ID, C_STATUS, TEXT, LAST_EDIT)
VALUES
('COMM'||LPAD(to_char(COMM_SEQ.NEXTVAL), 6, '0'), 'POST000001', 'M000002', 1, '這我覺得不行，他有些套路10場才成功一場，像是上路慨影，實況主都偏做效果', SYSDATE);

INSERT INTO comm
(COMM_ID, POST_ID, MEM_ID, C_STATUS, TEXT, LAST_EDIT)
VALUES
('COMM'||LPAD(to_char(COMM_SEQ.NEXTVAL), 6, '0'), 'POST000003', 'M000007', 1, '認同這個人跟玩遊戲是兩回事', SYSDATE);

INSERT INTO comm
(COMM_ID, POST_ID, MEM_ID, C_STATUS, TEXT, LAST_EDIT)
VALUES
('COMM'||LPAD(to_char(COMM_SEQ.NEXTVAL), 6, '0'), 'POST000003', 'M000006', 1, '經驗值曲線不知道有沒有調整,像上次一樣免費送大家幾星?', SYSDATE);

-----------------------------新增留言-----------------------------

-----------------------------新增收藏文章-----------------------------

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000001', 'POST000005');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000002', 'POST000003');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000003', 'POST000006');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000005', 'POST000002');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000008', 'POST000001');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000004', 'POST000007');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000002', 'POST000006');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000007', 'POST000006');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000008', 'POST000003');

INSERT INTO favorite_post
(MEM_ID, POST_ID)
VALUES
('M000010', 'POST000005');

-----------------------------新增收藏文章-----------------------------

-----------------------------新增CM-----------------------------
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000001','哈囉你好嗎請問方便嗎');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000002','哈囉你好嗎請問方便嗎');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000001','我要申訴');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000001','我買的東西壞掉了，我要退貨');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000001','請問怎麼上架商品到交易區');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),0,'M000002','在~~請問需要什麼服務嗎?');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),0,'M000001','在~~請問需要什麼服務嗎?');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),0,'M000003','
:┴┬┴┬／￣＼＿／￣＼
┬┴┬┴▏　　▏▔▔▔▔＼
┴┬┴／＼　／　　　　　　﹨
┬┴∕　　　　　　　／　　　）
┴┬▏　　　　　　　　●　　▏
┬┴▏　　　　　　　　　　　▔█◤
┴◢██◣　　　　　　 ＼＿＿／
┬█████◣　　　　　　　／
┴█████████████◣
◢██████████████▆▄
█◤◢██◣◥█████████◤＼
◥◢████　████████◤　　 ＼
┴█████　██████◤　　　　　 ﹨
┬│　　　│█████◤　　　　　　　　▏
┴│　　　│　　　　　　　　　　　　　　▏
┬∕　　　∕　　　　／▔▔▔＼　　　　 ∕
∕＿＿／﹨　　　∕　　　　　 ＼　　／＼
┬┴┬┴┬┴＼ 　　 ＼　　　　　﹨／　　﹨
┴┬┴┬┴┬┴ ＼＿＿＿＼　　　　 ﹨／▔＼﹨／▔＼
▲△▲▲╓╥╥╥╥╥╥╥╥＼　　 ∕　 ／▔﹨　／▔﹨
　＊＊＊╠╬╬╬╬╬╬╬╬＊﹨　　／　　／／　　／
（＼／）（＼／）＊＊　△▲▲﹨／＿＿／／＿＿');
insert into CUSTOMER_MESSAGE(CM_ID,CM_STATUS,CM_CUSTOMERID,CM_WORD) values('CM'||LPAD(to_char(cm_seq.NEXTVAL), 6, '0'),1,'M000003','
★︵＿＿＿︵☆
／　　　　　＼
︴●　　　●　︴大　家　天　天　快→樂　~
︴≡　﹏　≡　︴永　遠　幸　福　快　樂 唷　！～
＼＿＿＿＿＿／ 要　加　油　～～加　油！
╭灌水╮╭灌水╮╭灌水╮╭灌水╮
╰～～╯╰～～╯╰～～╯╰～～╯ ');

-----------------------------新增CM-----------------------------

-----------------------------新增CR-----------------------------
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'哈囉你好嗎請問方便嗎','M000001','M000002',1);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),
'☆ ．．．▍▍．☆█ ☆ ☆ ∵ ..../ .；☆
◥█▅▅██▅▅██▅▅▅▅▅██ ██ █ ◤
　◥███我開ㄌ一艘船來幫你灌水 ███◤
～~～~～~～~～~～~～～~～～～~～~～~～~～～~～~～','M000001','M000002',0);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'kono Dio ?','M000001','M000002',0);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'.............','M000001','M000002',1);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'
恩？＿＿＿＿＿
　／───　　＼
／　 ●　　───＼
︳　　　　　 ●    ︱
︳　　　　　　　  ︱
＼╭╮／＼　　　／
你｜╰－－－╮／有點
好｜　－┬－╯生氣哦
像｜　－╯','M000001','M000002',0);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'可以換個正常的人嗎?','M000001','M000002',1);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'我很正常喔','M000001','M000002',0);
insert into ONE_TO_ONE(CR_ID,CR_WORD,USER_ONE,USER_TWO,CR_STATUS) values('CR'||LPAD(to_char(CR_SEQ.NEXTVAL), 6, '0'),'那可以幫我取消那筆韓式烤肉醬的訂單嗎','M000001','M000002',1);

-----------------------------新增CR-----------------------------

COMMIT;
