/* Formatted on 2018/06/28 오후 7:11:33 (QP5 v5.326) */
---------------------------------------------------------------------------------
--UPDATE TEAMW
--SET MEM_NAME = '태형'
--WHERE MEM_NAME LIKE '태영';

  SELECT Z1.TEAM_ID              팀,
         COUNT (Z1.MEM_NAME)     명수,
         SUM (Z1.MEM_AGE)        나이합,
         MAX (Z1.MEM_AGE)        나이최대치,
         MIN (Z1.MEM_AGE)        나이최소치,
         AVG (Z1.MEM_AGE)        나이평균
    FROM TEAMW Z1
GROUP BY Z1.TEAM_ID
ORDER BY AVG (Z1.MEM_AGE) DESC;

  SELECT Z1.TEAM_NAME           팀명,
         COUNT (W.MEM_NAME)     팀원수,
         SUM (W.MEM_AGE)        나이합,
         MAX (W.MEM_AGE)        나이최대치,
         MIN (W.MEM_AGE)        나이최소치,
         AVG (W.MEM_AGE)        나이평균
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_NAME;

  SELECT (SELECT Z2.TEAM_NAME
            FROM TEAMZ Z2
           WHERE Z2.TEAM_ID LIKE Z1.TEAM_ID)
             팀명,
         COUNT (W.MEM_NAME)
             팀원수,
         SUM (W.MEM_AGE)
             나이합,
         MAX (W.MEM_AGE)
             나이최대치,
         MIN (W.MEM_AGE)
             나이최소치,
         AVG (W.MEM_AGE)
             나이평균
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_ID;


  SELECT (SELECT Z2.TEAM_NAME
            FROM TEAMZ Z2
           WHERE Z2.TEAM_ID LIKE Z1.TEAM_ID)
             팀명,
         COUNT (W.MEM_NAME)
             팀원수,
         SUM (W.MEM_AGE)
             나이합,
         MAX (W.MEM_AGE)
             나이최대치,
         MIN (W.MEM_AGE)
             나이최소치,
         AVG (W.MEM_AGE)
             나이평균
    FROM TEAMW W JOIN TEAMZ Z1 ON W.TEAM_ID LIKE Z1.TEAM_ID
GROUP BY Z1.TEAM_ID
  HAVING AVG (W.MEM_AGE) >= 28                      -- GROUP의 조건절은 HAVING으로 준다
ORDER BY Z1.TEAM_ID;

SELECT AVG (mem_age) FROM TEAMW;


SELECT Z.TEAM_ID       팀ID,
       Z.TEAM_NAME     팀명,
       W.MEM_ID        ID,
       W.MEM_NAME      이름,
       W.MEM_AGE       나이,
       W.ROLL          역할
  FROM TEAMW W JOIN TEAMZ Z ON W.TEAM_ID LIKE Z.TEAM_ID;

DESC TEAMW;

UPDATE MEMBER
   SET ROLL =
           CASE
               WHEN mem_name IN ('형준',
                                 '혜리',
                                 '최정훈',
                                 '승호')
               THEN
                   '팀장'
               ELSE
                   '팀원'
           END;

SELECT * FROM TEAMZ;
SELECT * FROM TEAMW;

ALTER TABLE TEAMW
    ADD ROLL VARCHAR (20);                           -- 칼럼을 추가할때

ALTER TABLE TEAMW
    DROP (ROLL);                    -- 칼럼 자체를 지울때

UPDATE TEAMW
   SET ROLL = ''
 WHERE ROLL IS NOT NULL;                    -- 칼럼 내용만 직울때

DROP TABLE TEAMW;
DROP TABLE TEAMZ;

DESC TEAMW;
---------------------------------------------------------------------------------

ALTER TABLE TEAMZ
RENAME TO PROJECT_TEAM;
ALTER TABLE TEAMW
RENAME TO MEMBER;



SELECT *FROM MEMBER;

ALTER TABLE PROJECT_TEAM
RENAME COLUMN MEM_NAME TO NAME;



