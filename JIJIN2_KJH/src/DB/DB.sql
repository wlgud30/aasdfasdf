CREATE SEQUENCE USERSEQ;

CREATE TABLE USERBOARD(
NO NUMBER PRIMARY KEY,            --회원번호
ID VARCHAR2(500) UNIQUE NOT NULL,        --회원 ID
PW VARCHAR2(500) NOT NULL,      --회원 PW
NAME VARCHAR2(500) NOT NULL,  --회원 이름
NIKNAME VARCHAR2(1000) UNIQUE NOT NULL,  --회원 닉네임
EMAIL VARCHAR2(1000) UNIQUE NOT NULL ,   --회원 EMAIL
PHONE VARCHAR2(500) ,                   --회원 PHONE
ADDR VARCHAR2(2000) NOT NULL,   --회원 주소
SUBADDR VARCHAR2(2000),		--회원 상세주소
GRADE VARCHAR2(500),                  --회원 등급
ENABLED VARCHAR2(2) NOT NULL,   --회원 탈퇴여부
LASTDATE DATE,                           --회원탈퇴날짜
CONSTRAINT USERBOARD_CHK CHECK(ENABLED IN('Y','N')),
CONSTRAINT USERBOARD_CHK2 CHECK(GRADE IN('USER','MANAGER','ADMIN'))
);

DESC USERBOARD;
SELECT * FROM USERBOARD;
INSERT INTO USERBOARD VALUES(USERSEQ.NEXTVAL,'ADMIN','ADMIN1234','관리자','관리자','ADMIN@NAVER.COM',NULL,'관리시','관리동','ADMIN','Y',NULL);
INSERT INTO USERBOARD VALUES(USERSEQ.NEXTVAL,'USER','USER1234','유저','유저','ADN@NAVER.COM',NULL,'관리광역시','관리구','USER','Y',NULL);


--게시판2(지진게시판)--시퀀스
CREATE SEQUENCE JIJINSEQ;
--게시판2(지진게시판)
CREATE TABLE JIJINBOARD(
ALL_NO NUMBER PRIMARY KEY,		--지진게시판 게시글넘버
BOARD_NO NUMBER CHECK(BOARD_NO IN (1)) NOT NULL,  ---댓글테이블과 엮어줌
NIKNAME VARCHAR2(500) NOT NULL REFERENCES USERBOARD(NIKNAME),			---유저테이블의 닉네임과 엮어줌
JIJIN_TITLE VARCHAR2(500) NOT NULL,			---지진게시판 게시글제목
JIJIN_CONTENT VARCHAR2(2000) NOT NULL,		---지진게시판 게시글내용
JIJIN_REGDATE DATE NOT NULL,				---지진게시판 게시글생성날짜
JIJIN_COUNT NUMBER NOT NULL			--조회수 카운트
);

DROP TABLE JIJINBOARD PURGE;

CREATE TABLE FREEBOARD(
ALL_NO NUMBER PRIMARY KEY,		---자유게시판 게시글넘버
BOARD_NO NUMBER CHECK(BOARD_NO IN (2)) NOT NULL, --댓글테이블과 엮어줌
NIKNAME VARCHAR2(500) NOT NULL,			--유저테이블의 닉네임과 엮어줌
FREE_TITLE VARCHAR2(500) NOT NULL,			--자유게시판 게시글제목
FREE_CONTENT VARCHAR2(2000) NOT NULL,		--자유게시판 게시글내용
FREE_REGDATE DATE NOT NULL,				--자유게시판 게시글 생성날짜
FREE_COUNT NUMBER NOT NULL,			--조회수 카운트
FOREIGN KEY(NIKNAME) REFERENCES USERBOARD(NIKNAME)
);


CREATE TABLE REBOARD(
RE_NO NUMBER PRIMARY KEY,		--댓글넘버
BOARD_NO NUMBER CHECK(BOARD_NO IN(1,2)) NOT NULL,	--게시판 넘버찾기
ALL_NO NUMBER NOT NULL,			--게시글 넘버 찾기
GROUP_NO NUMBER NOT NULL,		--부모자식 묶어줌
TITLE_TAB NUMBER NOT NULL,		--부모
NIKNAME VARCHAR2(500) NOT NULL,		--유저닉네임과엮어줌
REBOARD_ENABLED VARCHAR2(2) NOT NULL,   --댓글 삭제 여부
REBOARD_CONTENT VARCHAR2(3000) NOT NULL, --댓글 내용
REBOARD_REGDATE DATE NOT NULL,
CONSTRAINT USERBOARD_CHK2123123 CHECK(REBOARD_ENABLED IN('Y','N')),
FOREIGN KEY(NIKNAME) REFERENCES USERBOARD(NIKNAME),
FOREIGN KEY(ALL_NO) REFERENCES FREEBOARD(ALL_NO),
FOREIGN KEY(ALL_NO) REFERENCES JIJINBOARD(ALL_NO)
);

DELETE USERBOARD WHERE NO = 15