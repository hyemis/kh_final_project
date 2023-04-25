----업데이트문
--- 해당 부분은 recruit_regist 의 career 부분
-- 다른 부분 바꿀려면 set 부분에 변경할 데이터 컬럼 명과 
-- 서브쿼리의 where 과 본 쿼리의 where 절의 비교 컬럼 명과 카테로그 타입 변경
-- 예를 들어 근무제 바꾸기 위해서는 set 다음의 rr.carreer 을 rr.holiday_type로
-- 각각의 where 문의 카테고리와 본문의 rr.carreer 을 rr.holiday_type 로 변경

UPDATE recruit_regist rr set rr.career = (
select jc.category_id from JA_CATEGORY jc where rr.career = jc.category_name
and jc.CATEGORY_ID like 'CA%')
where rr.CAREER not like 'CA%';

--근무일
UPDATE recruit_regist rr set rr.holiday_type = (
select jc.category_id from JA_CATEGORY jc where rr.holiday_type = jc.category_name
and jc.CATEGORY_ID like 'HT%')
where rr.holiday_type not like 'HT%';