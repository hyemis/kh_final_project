/* # 채용공고등록 테이블

*/


/* #개인회원 테이블 */
INSERT INTO USERS VALUES( 'user1'
						  ,'user1'
						  ,'01012345678'
						  ,'000101'
						  ,'user1@joba.co.kr'
						  ,'서울특별시 강남구'
						  ,'사용자1');
						 
INSERT INTO USERS VALUES( 'user2'
						  ,'user2'
						  ,'01023456789'
						  ,'000102'
						  ,'user2@joba.co.kr'
						  ,'서울특별시 종로구'
						  ,'사용자2');
						 
						 
INSERT INTO USERS VALUES( 'user3'
						  ,'user3'
						  ,'01034567890'
						  ,'000103'
						  ,'user3@joba.co.kr'
						  ,'서울특별시 마포구'
						  ,'사용자3');

-- selectList
select USER_ID,USER_PHONE, USER_BIRTH, USER_NAME from USERS;

-- selectOne
select USER_ID,USER_PHONE, USER_BIRTH, USER_NAME from USERS where USER_ID='user1';

-- insert 
INSERT INTO USERS VALUES( 'user100'
						  ,'user100'
						  ,'100'
						  ,'000100'
						  ,'user100@joba.co.kr'
						  ,'서울특별시 관악구'
						  ,'user100');
-- update 
update USERS set USER_NAME='변경사용자1' where USER_ID = 'user100';

-- delete
delete from USERS where USER_ID='user100';		

commit;


/* JA_CATEGORY TABLE 	*/

--지역 코드 1단계 
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('LO', '지역', '1', 'LO', NULL);


--지역 코드 2단계
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('LO01', '서울', '2', 'LO', 'LO');
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('LO02', '경기', '2', 'LO', 'LO');

--직종 코드 1단계
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('JN', '직종', '1', 'JN', NULL);


--직종 코드 2단계
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('JN01', '인터넷/IT/통신/모바일/게임', '2', 'JN', 'JN');
INSERT INTO JA_CATEGORY (CATEGORY_ID, CATEGORY_NAME, CATEGORY_DEPT, CATEGORY_TYPE, REQ_CATEGORY_ID)
VALUES ('JN02', '경영/인사/총무/사무', '2', 'JN', 'JN');


