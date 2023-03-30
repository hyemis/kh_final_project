CREATE TABLE personal_member (
	USER_ID	VARCHAR2(200)	NOT NULL,
	USER_PW	VARCHAR2(200)	NOT NULL,
	NAME	VARCHAR2(200)	NULL,
	EMAIL	VARCHAR2(500)	NULL,
	PHONE_NUM1	VARCHAR2(50)	NULL,
	PHONE_NUM2	VARCHAR2(50)	NULL,
	PHONE_NUM3	VARCHAR2(50)	NULL
);

ALTER TABLE personal_member ADD CONSTRAINT PK_PERSONAL_MEMBER PRIMARY KEY (
	USER_ID
);

select * from personal_member;

INSERT into personal_member values('aaa', 'aaa','최민건','aaa@aaa.com','010','0000','1111');
INSERT into personal_member values('bbb', 'bbb','김민건','bbb@bbb.com','010','2222','3333');
INSERT into personal_member values('ccc', 'ccc','씨민건','ccc@ccc.com','010','4444','5555');

commit;

/* # 채용공고등록 테이블*/
alter table RECRUIT_REGIST modify CLOSE_DATE varchar2(30);
alter table RECRUIT_REGIST modify REGIST_DATE varchar2(30);


