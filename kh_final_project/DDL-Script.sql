/* # 채용절차 테이블 
 	- ap_num : 순번
 	- step1 : 서류전형
 	- step2 : 인적성검사
 	- step3 : 1차면접
 	- step4 : 2차면접
 	- step5 : 최종합격
 */
 
DROP TABLE BUSINESS_APPLY_PROCESS;
CREATE TABLE BUSINESS_APPLY_PROCESS(
    ap_num NUMBER PRIMARY KEY 
  , step1 VARCHAR2(20)
  , step2 VARCHAR2(20)
  , step3 VARCHAR2(20)
  , step4 VARCHAR2(20)
  , step5 VARCHAR2(20)
)