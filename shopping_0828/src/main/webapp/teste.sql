DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02 (
    custno NUMBER(6) NOT NULL PRIMARY KEY,
    custname VARCHAR2(20),
    phone VARCHAR2(13),
    address VARCHAR2(60),
    joindate DATE,
    grade CHAR(1),
    city CHAR(2)
);
INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', TO_DATE('20151202', 'YYYYMMDD'), 'A', '01');

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', TO_DATE('20151206', 'YYYYMMDD'), 'B', '01');

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', TO_DATE('20151001', 'YYYYMMDD'), 'B', '30');

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', TO_DATE('20151113', 'YYYYMMDD'), 'A', '30');

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', TO_DATE('20151225', 'YYYYMMDD'), 'B', '60');

INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city)
VALUES (100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', TO_DATE('20151211', 'YYYYMMDD'), 'C', '60');

DROP  TABLE money_tbl_02;
CREATE TABLE money_tbl_02 (
    custno NUMBER(6) NOT NULL,
    salenol NUMBER(8) NOT NULL,
    pcost NUMBER(8),
    amount NUMBER(4),
    price NUMBER(8),
    pcode VARCHAR2(4),
    sdate DATE,
    PRIMARY KEY (custno, salenol)
);

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100001, 20160001, 500, 5, 2500, 'A001', TO_DATE('20160101', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100001, 20160002, 1000, 4, 4000, 'A002', TO_DATE('20160101', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100001, 20160003, 500, 3, 1500, 'A008', TO_DATE('20160101', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100002, 20160004, 2000, 1, 2000, 'A004', TO_DATE('20160102', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100002, 20160005, 500, 1, 500, 'A001', TO_DATE('20160103', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100003, 20160006, 1500, 2, 3000, 'A003', TO_DATE('20160103', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100004, 20160007, 500, 2, 1000, 'A001', TO_DATE('20160104', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100004, 20160008, 300, 1, 300, 'A005', TO_DATE('20160104', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100004, 20160009, 600, 1, 600, 'A006', TO_DATE('20160104', 'YYYYMMDD'));

INSERT INTO money_tbl_02 (custno, salenol, pcost, amount, price, pcode, sdate)
VALUES (100004, 20160010, 3000, 1, 3000, 'A007', TO_DATE('20160106', 'YYYYMMDD'));



SELECT custno, custname, phone, address, TO_CHAR(joindate, 'YYYYMMDD'), DECODE(grade, 'A', 'VIP', 'B', '일반', 'C', '직원'), city
FROM member_tbl_02
ORDER BY 1;

SELECT custname, phone, address, joindate, grade, city FROM member_tbl_02 WHERE CUSTNO = '100001';

UPDATE member_tbl_02 SET custname = ?, phone = ?, address= ? , joindate =  TO_DATE(?, 'YYYMMDD'), grade = ?, city = ?;

SELECT mem.custno, mem.custname, DECODE(mem.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS RANK, SUM(mon.price) AS SALES	 
FROM member_tbl_02 mem
INNER 
	JOIN money_tbl_02 mon ON MEM.CUSTNO = MON.CUSTNO
group by mem.custno, mem.custname, mem.grade
ORDER BY 4 DESC;

