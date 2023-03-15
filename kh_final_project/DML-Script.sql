/* # 채용절차 테이블

*/
INSERT INTO BUSINESS_APPLY_PROCESS 
			VALUES((SELECT NVL(MAX(ap_num),0) + 1 FROM BUSINESS_APPLY_PROCESS)
                  , '서류전형'
                  , null
                  , '1차면접'
                  , null
                  , '최종합격');

INSERT INTO  BUSINESS_APPLY_PROCESS 
			VALUES((SELECT NVL(MAX(ap_num),0) + 1 FROM BUSINESS_APPLY_PROCESS)
                  , '서류전형'
                  , '인적성검사'
                  , '1차면접'
                  , '2차면접'
                  , '최종합격');

SELECT * FROM BUSINESS_APPLY_PROCESS;