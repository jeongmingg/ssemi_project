-- CREATE USER SEMI_4JO IDENTIFIED BY SEMI;
-- GRANT RESOURCE, CONNECT TO SEMI_4JO;

DROP TABLE REPORT;
DROP TABLE IMG_FILE;
DROP TABLE BOARD_COMMENT;
DROP TABLE BOARD;
DROP TABLE REVIEW;
DROP TABLE HEART;
DROP TABLE ALERT;
DROP TABLE MENU;
DROP TABLE REST;
DROP TABLE CATEGORY;
DROP TABLE LOCATION;
DROP TABLE MEMBER;

DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_MNNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_RVNO;
DROP SEQUENCE SEQ_FNO;
DROP SEQUENCE SEQ_BNO;
DROP SEQUENCE SEQ_BCNO;
DROP SEQUENCE SEQ_CNO;      -- 카테고리번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_LNO;      -- 로케이션번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_ANO;      -- 알림번호 발생시킬 시퀀스
DROP SEQUENCE SEQ_RPNO;

--------------------------------------------------
------------------  MEMBER TABLE 관련   ------------------   
--------------------------------------------------
CREATE TABLE MEMBER(
    MEM_NO VARCHAR2(20) CONSTRAINT MNO_PK PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20),
    MEM_NAME VARCHAR2(20) NOT NULL,
    NICKNAME VARCHAR2(30) NOT NULL UNIQUE,
    EMAIL VARCHAR2(50) NOT NULL UNIQUE,
    EMAIL_AUTH NUMBER DEFAULT 0 NOT NULL CHECK(EMAIL_AUTH IN (0,1)),
    ADDRESS VARCHAR2(100),
    MEM_WARNING NUMBER DEFAULT 0 NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    MEM_LEVEL CHAR(1) DEFAULT 'U' NOT NULL CHECK (MEM_LEVEL IN('A', 'U')),
    MEM_STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK (MEM_STATUS IN('Y', 'N', 'B'))
);

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호(ex.M1)';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.EMAIL_AUTH IS '이메일인증여부(미인증:0, 인증:1)';
COMMENT ON COLUMN MEMBER.ADDRESS IS '거주지';
COMMENT ON COLUMN MEMBER.MEM_WARNING IS '경고횟수';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MEM_LEVEL IS '회원등급(관리자:A, 일반회원:U)';
COMMENT ON COLUMN MEMBER.MEM_STATUS IS '회원상태(가입:Y, 탈퇴:N, 강퇴:B)';

CREATE SEQUENCE SEQ_MNO
NOCACHE;

--------------------------------------------------
--------------     CATEGORY 관련   ------------------   
--------------------------------------------------
CREATE TABLE CATEGORY(
    CTG_ID VARCHAR2(20) NOT NULL CONSTRAINT CID_PK PRIMARY KEY,
    CTG_NAME VARCHAR2(50)
);

COMMENT ON COLUMN CATEGORY.CTG_ID IS '카테고리ID (ex.C1)';
COMMENT ON COLUMN CATEGORY.CTG_NAME IS '카테고리명';

CREATE SEQUENCE SEQ_CNO
NOCACHE;

--------------------------------------------------
--------------     LOCATION 관련   ------------------   
--------------------------------------------------
CREATE TABLE LOCATION(
    LOCAL_ID VARCHAR2(20) NOT NULL CONSTRAINT LID_PK PRIMARY KEY,
    LOCAL_NAME VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN LOCATION.LOCAL_ID IS '지역ID (ex.L1)';
COMMENT ON COLUMN LOCATION.LOCAL_NAME IS '지역이름';

CREATE SEQUENCE SEQ_LNO
NOCACHE;

--------------------------------------------------
------------------  REST 관련   ------------------   
--------------------------------------------------
CREATE TABLE REST(
    REST_NO VARCHAR2(20) CONSTRAINT RNO_PK PRIMARY KEY,
    REST_LOCAL_ID VARCHAR2(20),
    REST_NAME VARCHAR2(100) NOT NULL,
    CTG_ID VARCHAR2(20) NOT NULL,
    REST_ADDRESS VARCHAR2(2000) NOT NULL,
    REST_TEL VARCHAR2(20) CONSTRAINT RESTTEL_UQ UNIQUE,
    REST_X NUMBER,
    REST_Y NUMBER,
    REST_PARKING CHAR(1) DEFAULT 'N' CHECK (REST_PARKING IN ('Y','N')),
    REST_GRADE NUMBER,
    REST_TIME VARCHAR2(20), 
    REST_AVG NUMBER, 
    REST_STATUS CHAR(1) DEFAULT 'Y' NOT NULL, 
    REST_IMG_URL VARCHAR2(2000),
    DT CHAR(1) DEFAULT 'N' CHECK (DT IN ('Y','N')),
    ANIMAL CHAR(1) DEFAULT 'N' CHECK (ANIMAL IN ('Y','N')),
    ROOM CHAR(1) DEFAULT 'N' CHECK (ROOM IN ('Y','N')),
    BIG_ROOM CHAR(1) DEFAULT 'N' CHECK (BIG_ROOM IN ('Y','N')),
    CONSTRAINT RLID_FK FOREIGN KEY(REST_LOCAL_ID) REFERENCES LOCATION(LOCAL_ID) 
);

COMMENT ON COLUMN REST.REST_NO IS '식당번호(R1)';
COMMENT ON COLUMN REST.REST_LOCAL_ID IS '지역ID';
COMMENT ON COLUMN REST.REST_NAME IS '식당명';
COMMENT ON COLUMN REST.CTG_ID IS '카테고리ID';
COMMENT ON COLUMN REST.REST_ADDRESS IS '식당주소';
COMMENT ON COLUMN REST.REST_TEL IS '식당전화번호';
COMMENT ON COLUMN REST.REST_X IS '경도';
COMMENT ON COLUMN REST.REST_Y IS '위도';
COMMENT ON COLUMN REST.REST_PARKING IS '주차여부(가능:Y, 불가능:N)';
COMMENT ON COLUMN REST.REST_GRADE IS '식당등급';
COMMENT ON COLUMN REST.REST_TIME IS '영업시간';
COMMENT ON COLUMN REST.REST_AVG IS '총 별점 평균';
COMMENT ON COLUMN REST.REST_STATUS IS '등록상태(등록:Y, 미등록:N)';
COMMENT ON COLUMN REST.REST_IMG_URL IS '대표이미지';
COMMENT ON COLUMN REST.DT IS '드라이브스루';
COMMENT ON COLUMN REST.ANIMAL IS '반려동물 동반';
COMMENT ON COLUMN REST.ROOM IS '개별룸';
COMMENT ON COLUMN REST.BIG_ROOM IS '대형룸';
CREATE SEQUENCE SEQ_RNO NOCACHE;

--------------------------------------------------
------------------  MENU 관련   ------------------   
--------------------------------------------------
CREATE TABLE MENU( 
    MENU_NO VARCHAR2(20) CONSTRAINT MNNO_PK PRIMARY KEY, 
    REST_NO VARCHAR2(20) NOT NULL,
    MENU_NAME VARCHAR2(50) NOT NULL, 
    MENU_PRICE VARCHAR2(50) NOT NULL, 
    REP_MENU CHAR(1) DEFAULT 'N' CHECK (REP_MENU IN ('Y', 'N')) NOT NULL,
    CONSTRAINT RNO_FK FOREIGN KEY(REST_NO) REFERENCES REST(REST_NO)
);    

COMMENT ON COLUMN MENU.MENU_NO IS '메뉴식별번호(MN1)';
COMMENT ON COLUMN MENU.REST_NO IS '식당번호';
COMMENT ON COLUMN MENU.MENU_NAME IS '메뉴이름';
COMMENT ON COLUMN MENU.MENU_PRICE IS '메뉴가격';
COMMENT ON COLUMN MENU.REP_MENU IS '대표메뉴여부(대표:Y, 대표X:N)';

CREATE SEQUENCE SEQ_MNNO NOCACHE;

--------------------------------------------------
------------------  HEART 관련   ------------------   
--------------------------------------------------
CREATE TABLE HEART(
    REST_NO VARCHAR2(20),
    MEM_NO VARCHAR2(20),
    LIKE_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT H_MNO_FK FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO),
    CONSTRAINT H_RNO_FK FOREIGN KEY(REST_NO) REFERENCES REST(REST_NO),
    CONSTRAINT RMNO_PK PRIMARY KEY(REST_NO, MEM_NO)
);

COMMENT ON COLUMN HEART.REST_NO IS '식당번호';
COMMENT ON COLUMN HEART.MEM_NO IS '회원번호';
COMMENT ON COLUMN HEART.LIKE_DATE IS '찜꽁한날짜';

--------------------------------------------------
------------------  ALERT 관련   ------------------   
--------------------------------------------------
CREATE TABLE ALERT(
    ALERT_NO VARCHAR2(20) NOT NULL PRIMARY KEY,
    MEM_NO VARCHAR2(20) NOT NULL,
    ALERT_CONTENT VARCHAR2(2000) NOT NULL,
    ALERT_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y','N')) NOT NULL,
    FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
);

COMMENT ON COLUMN ALERT.ALERT_NO IS '알림번호 (ex.A1)';
COMMENT ON COLUMN ALERT.MEM_NO IS '회원번호';
COMMENT ON COLUMN ALERT.ALERT_CONTENT IS '알림내용';
COMMENT ON COLUMN ALERT.ALERT_DATE IS '알림일시';
COMMENT ON COLUMN ALERT.STATUS IS '알림상태값(Y/N)';

CREATE SEQUENCE SEQ_ANO
NOCACHE;

--------------------------------------------------
------------------  REVIEW TABLE 관련   ------------------   
--------------------------------------------------
CREATE TABLE REVIEW(
    REVIEW_NO VARCHAR2(20) CONSTRAINT RVNO_PK PRIMARY KEY,
    REST_NO VARCHAR2(20) NOT NULL,
    REVIEW_WRITER VARCHAR2(20) NOT NULL,
    REVIEW_CONT VARCHAR2(300) NOT NULL,
    REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
    UPDATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    REVIEW_LIKE NUMBER DEFAULT 0 NOT NULL,
    REVIEW_DISLIKE NUMBER DEFAULT 0 NOT NULL,
    ALERT_NO NUMBER DEFAULT 0 NOT NULL,
    REVIEW_RATE NUMBER,
    REVIEW_STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK (REVIEW_STATUS IN('Y', 'N')),
    CONSTRAINT RV_RNO_FK FOREIGN KEY (REST_NO) REFERENCES REST(REST_NO),
    CONSTRAINT RV_MNO_FK FOREIGN KEY (REVIEW_WRITER) REFERENCES MEMBER(MEM_NO)
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '리뷰번호(ex.RV1)';
COMMENT ON COLUMN REVIEW.REST_NO IS '식당번호';
COMMENT ON COLUMN REVIEW.REVIEW_WRITER IS '작성자';
COMMENT ON COLUMN REVIEW.REVIEW_CONT IS '리뷰내용';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.UPDATE_DATE IS '수정일';
COMMENT ON COLUMN REVIEW.REVIEW_LIKE IS '추천수';
COMMENT ON COLUMN REVIEW.REVIEW_DISLIKE IS '비추천수';
COMMENT ON COLUMN REVIEW.ALERT_NO IS '신고횟수';
COMMENT ON COLUMN REVIEW.REVIEW_RATE IS '별점';
COMMENT ON COLUMN REVIEW.REVIEW_STATUS IS '리뷰상태(리뷰 삭제 시, N)';

CREATE SEQUENCE SEQ_RVNO
NOCACHE;

--------------------------------------------------
------------------  BOARD 관련   ------------------   
CREATE TABLE BOARD(
    BOARD_NO VARCHAR2(20) CONSTRAINT BNO_PK PRIMARY KEY,
    REST_ID VARCHAR2(20),
    REST_NAME VARCHAR2(50) NOT NULL,
    REST_ADDRESS VARCHAR2(60) NOT NULL,
    BOARD_WRITER VARCHAR2(20) NOT NULL,
    BOARD_TYPE VARCHAR2(20) DEFAULT '맛집 등록' CHECK(BOARD_TYPE IN ('맛집 등록', '맛집 삭제')) NOT NULL ,
    BOARD_TITLE VARCHAR2(60) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0,
    BOARD_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOARD_STATUS CHAR(1) DEFAULT 'Y' NOT NULL CHECK(BOARD_STATUS IN ('Y', 'N')),
    CONSTRAINT B_RNO_FK FOREIGN KEY (REST_ID) REFERENCES REST(REST_NO),
    CONSTRAINT B_MNO_FK FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER(MEM_NO)
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글번호 (ex.B1)';
COMMENT ON COLUMN BOARD.REST_ID IS '식당번호';
COMMENT ON COLUMN BOARD.REST_NAME IS '식당이름';
COMMENT ON COLUMN BOARD.REST_ADDRESS IS '식당주소';
COMMENT ON COLUMN BOARD.BOARD_WRITER IS '작성자 (ex.M3)';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS '게시글유형 (등록, 삭제)';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글제목';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '게시글내용';
COMMENT ON COLUMN BOARD.BOARD_COUNT IS '조회수';
COMMENT ON COLUMN BOARD.BOARD_DATE IS '게시글작성일';
COMMENT ON COLUMN BOARD.BOARD_STATUS IS '게시글상태 (Y/N)';

CREATE SEQUENCE SEQ_BNO NOCACHE;

--------------------------------------------------
------------------  BOARD_COMMENT관련   ------------------   
--------------------------------------------------
CREATE TABLE BOARD_COMMENT(
    COM_NO VARCHAR2(20) CONSTRAINT BCNO_PK PRIMARY KEY, 
    BOARD_NO VARCHAR2(20) NOT NULL UNIQUE,
    COM_WRITER VARCHAR2(20) DEFAULT 'M1' NOT NULL,
    COM_CONT VARCHAR2(500) NOT NULL,
    COM_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT BC_MNO_FK FOREIGN KEY (COM_WRITER) REFERENCES MEMBER(MEM_NO),
    CONSTRAINT BC_BNO_FK FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO)
);

COMMENT ON COLUMN BOARD_COMMENT.COM_NO IS '댓글번호(ex.BC1)';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_NO IS '게시글번호';
COMMENT ON COLUMN BOARD_COMMENT.COM_WRITER IS '작성자 (ex.M1)';
COMMENT ON COLUMN BOARD_COMMENT.COM_CONT IS '댓글내용';
COMMENT ON COLUMN BOARD_COMMENT.COM_DATE IS '댓글작성일';

CREATE SEQUENCE SEQ_BCNO NOCACHE;

--------------------------------------------------
------------------  IMG_FILE관련   ------------------   
--------------------------------------------------
CREATE TABLE IMG_FILE(
    IMG_FILE_NO VARCHAR2(20) PRIMARY KEY,
    REF_NO VARCHAR2(20) NOT NULL,
    IMG_ORIGIN_NAME VARCHAR2(255),
    IMG_CHANGE_NAME VARCHAR2(255),
    IMG_FILE_PATH VARCHAR2(1000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    IMG_STATUS VARCHAR2(10) DEFAULT 'Y' CHECK (IMG_STATUS IN('Y', 'N')) NOT NULL
);

COMMENT ON COLUMN IMG_FILE.IMG_FILE_NO IS '파일번호(ex.F1)';
COMMENT ON COLUMN IMG_FILE.REF_NO IS '참조게시글번호';
COMMENT ON COLUMN IMG_FILE.IMG_ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN IMG_FILE.IMG_CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN IMG_FILE.IMG_FILE_PATH IS '파일저장경로';
COMMENT ON COLUMN IMG_FILE.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN IMG_FILE.IMG_STATUS IS '파일상태';

CREATE SEQUENCE SEQ_FNO
NOCACHE;

--------------------------------------------------
------------------  REPORT관련  ------------------   
--------------------------------------------------
-- 리뷰번호, 신고자, 신고분류, 신고날짜
CREATE TABLE REPORT(
    REPORT_NO VARCHAR2(20) PRIMARY KEY,
    REVIEW_NO VARCHAR2(20) NOT NULL,
    REPORT_WRITER VARCHAR2(20) NOT NULL,
    REPORT_CTG VARCHAR2(300) NOT NULL,
    REPORT_DATE DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고번호(ex.RP1)';
COMMENT ON COLUMN REPORT.REVIEW_NO IS '리뷰번호(ex.RV1)';
COMMENT ON COLUMN REPORT.REPORT_WRITER IS '신고자';
COMMENT ON COLUMN REPORT.REPORT_CTG IS '신고 사유';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고 날짜';

CREATE SEQUENCE SEQ_RPNO
NOCACHE;

------------------------------------------------------
-- MEMBER TABLE INSERT
------------------------------------------------------
INSERT INTO MEMBER
VALUES('M'||SEQ_MNO.NEXTVAL, 'admin', 'admin', '관리자', 'admin', 'admin@naver.com', 1, NULL, DEFAULT, DEFAULT, 'A', DEFAULT);

INSERT INTO MEMBER
VALUES('M'||SEQ_MNO.NEXTVAL, 'user01', 'pass01', '노정민', 'njm', 'njm@naver.com', 1, '서울특별시 강남구', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES('M'||SEQ_MNO.NEXTVAL, 'user02', 'pass02', '김도현', 'kdh', 'kdh@gmail.com', 1, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES('M'||SEQ_MNO.NEXTVAL, 'user03', 'pass03', '신나리', 'snr', 'snr@daum.net', 1, '서울특별시 영등포구', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES('M'||SEQ_MNO.NEXTVAL, 'user04', 'pass04', '남지혜', 'njh', 'njh@jj.ac.kr', 1, '서울특별시 관악구', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

------------------------------------------------------
-- CATEGORY TABLE INSERT
------------------------------------------------------
INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '한식');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '일식');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '중식');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '양식');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '분식');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '카페');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '술집');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '횟집');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '고깃집');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C'||SEQ_CNO.NEXTVAL, '뷔페');

INSERT INTO CATEGORY (CTG_ID, CTG_NAME)
VALUES ('C20', '기타');

------------------------------------------------------
-- LOCATION TABLE INSERT
------------------------------------------------------
INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '강남구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '강동구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '강북구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '강서구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '관악구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '광진구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '구로구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '금천구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '노원구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '도봉구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '동대문구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '동작구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '마포구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '서대문구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '서초구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '성동구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '성북구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '송파구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '양천구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '영등포구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '용산구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '은평구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '종로구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '중구');

INSERT INTO LOCATION (LOCAL_ID, LOCAL_NAME)
VALUES ('L'||SEQ_LNO.NEXTVAL, '중랑구');

------------------------------------------------------
-- REST TABLE INSERT
------------------------------------------------------
INSERT INTO REST
VALUES('R'||SEQ_RNO.NEXTVAL, 'L1', '역삼갈비', 'C1', '서울시 강남구 강남대로 64번길 15',
        '02-111-1111', 35.11122, 48.22333, DEFAULT, 3, '12:00~22:00',
        4.1, 'Y', 'https://d12zq4w4guyljn.cloudfront.net/20231003115336_photo1_8e6b5858a3af.jpg',
        DEFAULT, DEFAULT, 'Y', DEFAULT);

INSERT INTO REST
VALUES('R'||SEQ_RNO.NEXTVAL, 'L2', '나이스샤워', 'C2', '서울시 강북구 강북대로 11길 78',
        '02-222-2222', 38.78512, 40.15781, DEFAULT, 2, '12:00~21:00',
        4.6, 'Y', 'https://d12zq4w4guyljn.cloudfront.net/750_750_20231216120911_photo1_df8d74769f81.jpg',
        DEFAULT, 'Y', DEFAULT, DEFAULT);
        
INSERT INTO REST
VALUES('R'||SEQ_RNO.NEXTVAL, 'L3', '멱도날드', 'C3', '서울시 노원구 노원대로 77번길 20',
        '02-333-3333', 11.44521, 22.27843, DEFAULT, 3, '09:00~20:00',
        2.2, 'Y', 'https://d12zq4w4guyljn.cloudfront.net/20230212040901_photo2_7467b46fb0da.jpg',
        'Y', DEFAULT, DEFAULT, DEFAULT);
        
INSERT INTO REST
VALUES('R'||SEQ_RNO.NEXTVAL, 'L4', '마포갈매기', 'C4', '서울시 마포구 마포대로 12번길 13',
        '02-444-4444', 17.75122, 48.23557, 'Y', 1, '16:00~24:00',
        4.8, 'Y', 'https://d12zq4w4guyljn.cloudfront.net/20210401120511281_photo_0c8f0ee03560.jpg',
        DEFAULT, DEFAULT, 'Y', 'Y');
        
INSERT INTO REST
VALUES('R'||SEQ_RNO.NEXTVAL, 'L5', '삼원명가', 'C5', '서울시 성북구 성북대로 44번길 10',
        '02-555-5555', 25.96335, 31.27893, 'Y', 2, '11:00~20:00',
        3.4, 'Y', 'https://d12zq4w4guyljn.cloudfront.net/20231002092833980_photo_f8089d108807.jpg',
        DEFAULT, DEFAULT, 'Y', 'Y');

------------------------------------------------------
-- MENU TABLE INSERT
------------------------------------------------------
INSERT INTO MENU
VALUES('MN'||SEQ_MNNO.NEXTVAL, 'R1', '양념갈비', 18000, 'Y');

INSERT INTO MENU
VALUES('MN'||SEQ_MNNO.NEXTVAL, 'R2', '에비텐동', 14000, DEFAULT);

INSERT INTO MENU
VALUES('MN'||SEQ_MNNO.NEXTVAL, 'R3', '멱따는 치킨버거', 9000, DEFAULT);

INSERT INTO MENU
VALUES('MN'||SEQ_MNNO.NEXTVAL, 'R4', '갈매기살', 17000, 'Y');

INSERT INTO MENU
VALUES('MN'||SEQ_MNNO.NEXTVAL, 'R5', '제육뚝배기', 9000, 'Y');

------------------------------------------------------
-- HEART TABLE INSERT
------------------------------------------------------
INSERT INTO HEART
VALUES('R1', 'M2', SYSDATE);

INSERT INTO HEART
VALUES('R1', 'M3', SYSDATE);

INSERT INTO HEART
VALUES('R2', 'M2', SYSDATE);

INSERT INTO HEART
VALUES('R3', 'M4', SYSDATE);

INSERT INTO HEART
VALUES('R5', 'M5', SYSDATE);

------------------------------------------------------
-- ALERT TABLE INSERT
------------------------------------------------------
INSERT INTO ALERT (ALERT_NO, MEM_NO,ALERT_CONTENT,ALERT_DATE,STATUS)
VALUES ('A'||SEQ_ANO.NEXTVAL,'M2','첫번째 경고입니다',SYSDATE,DEFAULT);

INSERT INTO ALERT (ALERT_NO, MEM_NO,ALERT_CONTENT,ALERT_DATE,STATUS)
VALUES ('A'||SEQ_ANO.NEXTVAL,'M2','회원님명으로 신고가 들어왔습니다',SYSDATE,DEFAULT);

INSERT INTO ALERT (ALERT_NO, MEM_NO,ALERT_CONTENT,ALERT_DATE,STATUS)
VALUES ('A'||SEQ_ANO.NEXTVAL,'M3','두번째 경고입니다',SYSDATE,DEFAULT);

INSERT INTO ALERT (ALERT_NO, MEM_NO,ALERT_CONTENT,ALERT_DATE,STATUS)
VALUES ('A'||SEQ_ANO.NEXTVAL,'M4','세번째 경고입니다',SYSDATE,DEFAULT);

INSERT INTO ALERT (ALERT_NO, MEM_NO,ALERT_CONTENT,ALERT_DATE,STATUS)
VALUES ('A'||SEQ_ANO.NEXTVAL,'M5','첫번째 경고입니다',SYSDATE,DEFAULT);

------------------------------------------------------
-- REVIEW TABLE INSERT
------------------------------------------------------
INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R1', 'M2', '맛있어요맛있어', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R2', 'M2', '와 여기 진짜 맛있어요!! 완전추천 재방문의사 100%!!!', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 3.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R3', 'M3', '음식은 진짜 맛있는데 좀 비싸네요ㅠㅠ 가격에서 별점 조금 뺐어요', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 3, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R4', 'M5', '맛, 가격 괜찮은데 서비스가 좀.. 아쉬워요 불친절한 느낌이였어요 그래도 맛은 굿!', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R5', 'M4', '가성비 굿', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R1', 'M2', '다음에 또 올게요! 맛있어요', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R2', 'M2', '서울오면 여기 맨날 와야지~~', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R3', 'M3', '좀 비싸도 맛있어서 좋아요', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 3.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R4', 'M5', '맛있어요~ 인생맛집!', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R5', 'M4', '가성비가 진짜 미쳤어요 최고!!', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R1', 'M2', '맛있어요 여자친구랑 와야지', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R2', 'M2', '존맛이요~~', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 4, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R3', 'M3', '좀 비싸여ㅠㅠ 맛은 좋아용', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 3.5, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R1', 'M3', '우웩실환가 노맛이에요', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 1, DEFAULT);

INSERT INTO REVIEW
VALUES('RV'||SEQ_RVNO.NEXTVAL, 'R1', 'M5', '여기갈비진짜개존맛이네요 키야', SYSDATE, SYSDATE, DEFAULT, DEFAULT, DEFAULT, 5, DEFAULT);
------------------------------------------------------
------------------------------------------------------
-- BOARD TABLE INSERT
------------------------------------------------------
INSERT INTO BOARD 
VALUES('B'||SEQ_BNO.NEXTVAL, NULL, '강남역 멧돌순두부', '서울', 'M2', DEFAULT, '맛집 등록 요청합니다', '강남역 멧돌순두부 식당 등록요청합니다~', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD 
VALUES('B'||SEQ_BNO.NEXTVAL, NULL, '칠보칼국수', '서울 종로', 'M3', DEFAULT, '맛집 등록 요청합니다', '칠보칼국수 식당 등록요청해주세요 맛나요!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD 
VALUES('B'||SEQ_BNO.NEXTVAL, 'R5', 'R5해당식당', 'R5식당주소', 'M4', '맛집 삭제', '맛집 삭제 요청합니다', '역삼역 맥도날드 기계고장나서 폐업했습니다 삭제해주세요', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD 
VALUES('B'||SEQ_BNO.NEXTVAL, NULL, '바게트케이', '선릉역', 'M5', DEFAULT, '맛집 등록 요청합니다', '선릉역 바게트케이 새로 개업했습니다 등록 부탁드려요', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD 
VALUES('B'||SEQ_BNO.NEXTVAL, 'R4', 'R4식당이름', 'R4식당주소', 'M3', '맛집 삭제', '맛집 삭제 요청합니다', '요술포차 강남역 사라졌어요 이제 어디가서 술먹죠', DEFAULT, DEFAULT, DEFAULT);

------------------------------------------------------
-- BOARD_COMMENT TABLE INSERT
------------------------------------------------------

INSERT INTO BOARD_COMMENT
VALUES('BC'||SEQ_BCNO.NEXTVAL, 'B1', 'M1', '감사합니다 요청하신 식당이 등록됐습니다!', DEFAULT);
INSERT INTO BOARD_COMMENT
VALUES('BC'||SEQ_BCNO.NEXTVAL, 'B2', 'M1', '감사합니다 요청하신 식당이 등록됐습니다!', DEFAULT);
INSERT INTO BOARD_COMMENT
VALUES('BC'||SEQ_BCNO.NEXTVAL, 'B3', 'M1', '감사합니다 요청하신 식당이 삭제됐습니다.', '2024-02-17');
INSERT INTO BOARD_COMMENT
VALUES('BC'||SEQ_BCNO.NEXTVAL, 'B4', 'M1', '감사합니다 요청하신 식당이 등록됐습니다!', '2024-02-17');
INSERT INTO BOARD_COMMENT
VALUES('BC'||SEQ_BCNO.NEXTVAL, 'B5', 'M1', '감사합니다 요청하신 식당이 삭제됐습니다.', '2024-02-18');

------------------------------------------------------
-- IMG_FILE TABLE INSERT
------------------------------------------------------
INSERT INTO IMG_FILE
VALUES('F'||SEQ_FNO.NEXTVAL, 'B1', '파일원본명1', '파일수정명1', '파일저장경로1', SYSDATE, 'Y');

INSERT INTO IMG_FILE
VALUES('F'||SEQ_FNO.NEXTVAL, 'B2', '파일원본명2', '파일수정명2', '파일저장경로2', SYSDATE, 'Y');

INSERT INTO IMG_FILE
VALUES('F'||SEQ_FNO.NEXTVAL, 'RV1', '파일원본명3', '파일수정명3', '파일저장경로3', SYSDATE, 'Y');

INSERT INTO IMG_FILE
VALUES('F'||SEQ_FNO.NEXTVAL, 'RV2', '파일원본명4', '파일수정명4', '파일저장경로4', SYSDATE, 'Y');

INSERT INTO IMG_FILE
VALUES('F'||SEQ_FNO.NEXTVAL, 'M2', '파일원본명5', '파일수정명5', '파일저장경로5', SYSDATE, 'Y');


COMMIT;