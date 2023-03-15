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