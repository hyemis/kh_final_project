
-- 마감일 지난 공고들 RA_ADMISSION 변경 프로시저 등록
CREATE OR REPLACE PROCEDURE RECRUIT_ADMISSION_CHECK
IS
BEGIN
    UPDATE RECRUIT_REGIST
    SET RA_ADMISSION = 'P'
    WHERE CLOSE_DATE < SYSDATE
    AND RA_ADMISSION IN ('Y', 'P');
END RECRUIT_ADMISSION_CHECK;
/

-- 프로시저 실행
EXEC RECRUIT_ADMISSION_CHECK();

--JOB 등록
DECLARE
  AD_CHECK NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    (  JOB       => AD_CHECK
     , WHAT      => 'RECRUIT_ADMISSION_CHECK();'
     , NEXT_DATE =>  SYSDATE + 1/24/60		-- 1분후
     , INTERVAL  => 'TRUNC(SYSDATE)  + 20 / 24' 
     , NO_PARSE  => TRUE
    );
    commit;
END;
/


-- 스크랩한 채용공고 90일 후 db자동 삭제
-- 프로시저 등록
CREATE OR REPLACE PROCEDURE delete_scrap_info 
AS
BEGIN
  DELETE FROM scrap_info WHERE insert_date < SYSDATE - 90;
  COMMIT;
END;
/
--프로시저 실행
EXEC delete_scrap_info();
-- job등록
DECLARE
    DELETE_SCRAP NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    ( JOB       => DELETE_SCRAP
    , WHAT => 'delete_scrap_info();'
     , NEXT_DATE =>  SYSDATE + 1/24/60		-- 1분후
     , INTERVAL  => 'TRUNC(SYSDATE)  + 20 / 24' 
    , NO_PARSE  => FALSE
    );
  commit;
END;
/

-- 등록한 잡 확인
--SELECT * 
--  FROM USER_JOBS;

--등록한 잡 삭제
--잡 테이블에서 보고 삭제
--BEGIN
--    DBMS_JOB.REMOVE(2);
--    COMMIT;
--END;
--/

-- 인터벌 수정 명령어
--EXEC DBMS_JOB.INTERVAL(3, 'TRUNC(SYSDATE)  + 20 / 24');
--commit;