/* Formatted on 2018/06/29 오후 4:23:49 (QP5 v5.326) */
SELECT * FROM team;

SELECT COUNT (*) AS "테이블의 수" FROM tab;

SELECT COUNT (*) 테이블의수 FROM tab;                                                                -- 컬럼의 아이아스

SELECT team_name AS "전체 축구팀 목록" FROM team;

  SELECT team_name     "전체 축구팀 목록"
    FROM team
ORDER BY team_name;                                                                              -- 오름차순

  SELECT team_name     AS "전체 축구팀 목록"
    FROM team
ORDER BY team_name DESC;                                                                                           -- 내림차순

SELECT DISTINCT position     AS "포지션"
  FROM player;

SELECT DISTINCT NVL2 (position, position, '신입')     "포지션"
  FROM player;                           -- nvl2(a,'b','c') a가 null이면 c, null아니면 b

  SELECT player_name     이름
    FROM player
   WHERE team_id LIKE 'K02' AND position LIKE 'GK'
ORDER BY player_name;


SELECT position 포지션, player_name 이름
  FROM player
 WHERE     team_id LIKE 'K02'
       AND height >= 170
       AND SUBSTR (player_name, 1, 1) LIKE '고';

SELECT SUBSTR (player_name, 1, 2) 테스트값 FROM player;

SELECT position 포지션, player_name 이름
  FROM player
 WHERE team_id LIKE 'K02' AND height >= 170 AND player_name LIKE '고__';

  SELECT player_name                                    이름,
         TO_CHAR (NVL2 (height, height, 0)) || 'cm'     키,
         TO_CHAR (NVL2 (weight, weight, 0)) || 'kg'     무게
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '선수'              이름,
         NVL2 (height, height, 0) || 'cm'     키,
         NVL2 (weight, weight, 0) || 'kg'     무게
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '선수'                             이름,
         NVL2 (height, height, 0) || 'cm'                    키,
         NVL2 (weight, weight, 0) || 'kg'                    무게,
         ROUND (weight / (POWER (height, 2) / 10000), 2)     BMI
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '선수' 이름, p.team_id 팀아디
    FROM player p, team t
   WHERE     p.team_id = t.team_id
         AND p.team_id IN ('K10', 'K02')
         AND p.position LIKE 'MF'
         AND player_name LIKE '고%'
ORDER BY team_name;


SELECT player_name || '선수' 이름, team_id 아디
  FROM player
 WHERE player_name LIKE '고%';

--008

  SELECT team_name,
         position,
         player_name,
         nation,
         t.team_id,
         p.team_id
    FROM team t, player p
   WHERE     p.team_id = t.team_id
         AND p.team_id IN ('K02', 'K10')
         AND p.position LIKE 'GK'
ORDER BY t.team_name, p.player_name;

--ANSI
--SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
--FROM Orders (기준이되는)
--INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

  SELECT team_name,
         position,
         player_name,
         nation,
         t.team_id,
         p.team_id
    FROM player p INNER JOIN team t ON t.team_id LIKE p.team_id
   WHERE p.team_id IN ('K02', 'K10') AND p.position LIKE 'GK'
ORDER BY t.team_name, p.player_name;

  SELECT p.height || 'cm' 키, t.team_name 팀명, p.player_name 이름
    FROM team t, player p
   WHERE     t.team_id LIKE p.team_id
         AND p.team_id IN ('K02', 'K10')
         AND p.height BETWEEN 180 AND 183
ORDER BY p.height, t.team_name, p.player_name;

--ANSI

  SELECT p.height || 'cm' 키, t.team_name 팀명, p.player_name 이름
    FROM player p JOIN team t ON t.team_id LIKE p.team_id
   WHERE p.team_id IN ('K02', 'K10') AND p.height BETWEEN 180 AND 183
ORDER BY p.height, t.team_name, p.player_name;

-- SOCCER_SQL_010
--  모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순

  SELECT t.team_name, p.player_name, p.position
    FROM player p JOIN team t ON p.team_id LIKE t.team_id
   WHERE p.position IS NULL
ORDER BY t.team_name, p.player_name;


-- SOCCER_SQL_011
--  팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력

SELECT t.team_name 팀명, s.stadium_name 스타디움이름
  FROM team t JOIN stadium s ON t.stadium_id LIKE s.stadium_id;


-- SOCCER_SQL_012
--  팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오.

SELECT t.team_name        팀명,
       s.stadium_name     스타디움,
       sc.awayteam_id     원정팀,
       sc.sche_date       스케쥴날짜
  FROM team  t
       JOIN stadium s ON t.stadium_id LIKE s.stadium_id
       JOIN schedule sc ON s.STADIUM_ID LIKE sc.STADIUM_ID
 WHERE sc.sche_date LIKE '20120317';



 -- SOCCER_SQL_013
-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오

SELECT p.player_name      이름,
       p.position         포지션,
       t.team_name        팀명,
       s.stadium_name     스타디움,
       sc.SCHE_DATE       스케쥴날짜
  FROM player  p
       JOIN team t ON p.team_id LIKE t.team_id
       JOIN stadium s ON t.stadium_id LIKE s.stadium_id
       JOIN schedule sc ON t.STADIUM_ID LIKE sc.STADIUM_ID
 WHERE     sc.SCHE_DATE LIKE '20120317'
       AND t.team_id LIKE 'K03'
       AND p.position LIKE 'GK';

    -- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오

  SELECT s.stadium_name                            스타디움,
         sc.sche_date                              경기날짜,
         t1.region_name || ' ' || t1.team_name     홈팀,
         t2.region_name || ' ' || t2.team_name     원정팀,
         sc.home_score                             "홈팀 점수",
         sc.away_score                             "원정팀 점수"
    FROM schedule sc
         JOIN stadium s ON sc.stadium_id LIKE s.stadium_id
         JOIN team t1 ON s.hometeam_id LIKE t1.team_id
         JOIN team t2 ON sc.awayteam_id LIKE t2.team_id
   WHERE sc.home_score - sc.away_score >= 3
ORDER BY sc.sche_date;



-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20 , 일산 밑에 마산, 안양도 있음

SELECT s.stadium_name,
       s.stadium_id,
       s.seat_count,
       s.hometeam_id,
       t.e_team_name
  FROM stadium s LEFT JOIN team t ON s.STADIUM_ID LIKE t.STADIUM_ID;

--아이디를 모르고 이름으로만 쿼리를 짤때

SELECT T.TEAM_NAME       팀명,
       P.PLAYER_NAME     선수명,
       P.POSITION        포지션,
       P.BACK_NO         백넘버,
       P.HEIGHT          키
  FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
 WHERE T.TEAM_ID IN ((X), (Y));

-- SOCCER_SQL_016
-- 소속이 삼성블루윙즈 팀인 선수들과
-- 드래곤즈팀인 선수들의 선수 정보

SELECT T.TEAM_NAME       팀명,
       P.PLAYER_NAME     선수명,
       P.POSITION        포지션,
       P.BACK_NO         백넘버,
       P.HEIGHT          키
  FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
 WHERE T.TEAM_ID IN
           (SELECT T.TEAM_ID
              FROM TEAM T
             WHERE T.TEAM_NAME IN ('삼성블루윙즈', '드래곤즈'));

--018
--최호진 선수의 소속팀과 포지션 백넘버는 무엇입니까

SELECT P.PLAYER_NAME     선수명,
       T.TEAM_NAME       팀명,
       P.POSITION        포지션,
       P.BACK_NO         백넘버
  FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
 WHERE P.PLAYER_NAME LIKE '최호진';


-- 019
-- 대전시티즌의 MF 평균키는 얼마입니까

SELECT ROUND (AVG (HEIGHT), 2)     평균키
  FROM PLAYER P
 WHERE P.POSITION LIKE 'MF' AND P.TEAM_ID LIKE 'K10';



-- 020
-- 2012년 월별 경기수를 구하시오

SELECT (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201201%')
           "1월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201202%')
           "2월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201203%')
           "3월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201204%')
           "4월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201205%')
           "5월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201206%')
           "6월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201207%')
           "7월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201208%')
           "8월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '201209%')
           "9월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '2012010%')
           "10월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '2012011%')
           "11월",
       (SELECT COUNT (*)
          FROM SCHEDULE
         WHERE SCHE_DATE LIKE '2012012%')
           "12월"
  FROM DUAL;



-- 021
-- 2012년 월별 진행된 경기수(GUBUN IS YES)를 구하시오
-- 출력은 1월:20경기 이런식으로...

SELECT    (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201201%')
       || '경기'
           "1월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201202%')
       || '경기'
           "2월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201203%')
       || '경기'
           "3월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201204%')
       || '경기'
           "4월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201205%')
       || '경기'
           "5월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201206%')
       || '경기'
           "6월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201207%')
       || '경기'
           "7월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201208%')
       || '경기'
           "8월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '201209%')
       || '경기'
           "9월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '2012010%')
       || '경기'
           "10월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '2012011%')
       || '경기'
           "11월",
          (SELECT COUNT (*)
             FROM SCHEDULE
            WHERE SCHE_DATE LIKE '2012012%')
       || '경기'
           "12월"
  FROM DUAL;



-- 022
-- 2012년 9월 14일에 벌어질 경기는 어디와 어디입니까
-- 홈팀: ?   원정팀: ? 로 출력

SELECT HT.TEAM_NAME 홈팀이름, AT.TEAM_NAME 원정팀이름
  FROM SCHEDULE  K
       JOIN TEAM HT ON HT.TEAM_ID LIKE K.HOMETEAM_ID
       JOIN TEAM AT ON AT.TEAM_ID LIKE K.AWAYTEAM_ID
 WHERE K.SCHE_DATE LIKE '20120914';


--023
--GROUP 사용
--팀별 선수의 수
--아이파트 20명
--드래곤즈 19명 TEAN ID로

  SELECT (SELECT A.TEAM_NAME
            FROM TEAM A
           WHERE A.TEAM_ID LIKE T.TEAM_ID)
             "팀이름",
         COUNT (P.PLAYER_ID)
             선수인원
    FROM TEAM T JOIN PLAYER P ON T.TEAM_ID LIKE P.TEAM_ID
GROUP BY T.TEAM_ID
ORDER BY T.TEAM_ID;

CREATE TABLE TEAMZ
(
    TEAM_ID      VARCHAR2 (20) PRIMARY KEY,
    TEAM_NAME    VARCHAR2 (20)
);

INSERT INTO TEAMZ
     VALUES ('1', '저스티스');

INSERT INTO TEAMZ
     VALUES ('2', '엘카로');

INSERT INTO TEAMZ
     VALUES ('3', '가오갤');

INSERT INTO TEAMZ
     VALUES ('4', '어벤져스');


DELETE FROM TEAMW;

DROP TABLE TEAMW;
DROP TABLE TEAMZ;



CREATE TABLE TEAMW
(
    MEM_ID      VARCHAR2 (20) PRIMARY KEY,
    TEAM_ID     VARCHAR2 (20),
    MEM_NAME    VARCHAR2 (20),
    MEM_AGE     DECIMAL,
    ROLL        VARCHAR2 (20)
--롤: 팀장,/// 회원담당, 아이템담당, 게시판담당, 관리자담당
);

ALTER TABLE TEAMW
    ADD CONSTRAINT TEAMW_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAMZ (TEAM_ID);


INSERT INTO TEAMW
     VALUES ('1',
             '1',
             '형준',
             34,
             '팀장');

INSERT INTO TEAMW
     VALUES ('2',
             '1',
             '세인',
             35,
             '');

INSERT INTO TEAMW
     VALUES ('3',
             '1',
             '희태',
             21,
             '');

INSERT INTO TEAMW
     VALUES ('4',
             '1',
             '상훈',
             29,
             '');

INSERT INTO TEAMW
     VALUES ('5',
             '1',
             '태영',
             35,
             '');

INSERT INTO TEAMW
     VALUES ('6',
             '2',
             '혜리',
             26,
             '팀장');

INSERT INTO TEAMW
     VALUES ('7',
             '2',
             '지은',
             26,
             '');

INSERT INTO TEAMW
     VALUES ('8',
             '2',
             '준',
             27,
             '');

INSERT INTO TEAMW
     VALUES ('9',
             '2',
             '재경',
             30,
             '');

INSERT INTO TEAMW
     VALUES ('10',
             '2',
             '단아',
             26,
             '');

INSERT INTO TEAMW
     VALUES ('11',
             '3',
             '최정훈',
             32,
             '팀장');

INSERT INTO TEAMW
     VALUES ('12',
             '3',
             '윤호',
             31,
             '');

INSERT INTO TEAMW
     VALUES ('13',
             '3',
             '가은',
             29,
             '');

INSERT INTO TEAMW
     VALUES ('14',
             '3',
             '정훈',
             23,
             '');

INSERT INTO TEAMW
     VALUES ('15',
             '3',
             '승태',
             30,
             '');

INSERT INTO TEAMW
     VALUES ('16',
             '4',
             '승호',
             27,
             '팀장');

INSERT INTO TEAMW
     VALUES ('17',
             '4',
             '소진',
             26,
             '');

INSERT INTO TEAMW
     VALUES ('18',
             '4',
             '이슬',
             29,
             '');

INSERT INTO TEAMW
     VALUES ('19',
             '4',
             '진태',
             26,
             '');

INSERT INTO TEAMW
     VALUES ('20',
             '4',
             '누리',
             30,
             '');

SELECT * FROM TEAMZ;


--ATEAM,CTEAM,STEAM



  SELECT (SELECT Z.TEAM_NAME
            FROM TEAMZ Z
           WHERE Z.TEAM_ID LIKE W.TEAM_ID)
             "팀명",
         COUNT (*)
             "팀원수",
         SUM (W.MEM_AGE)
             "나이합",
         MAX (W.MEM_AGE)
             "나이최대치",
         MIN (W.MEM_AGE)
             "나이 최소치",
         AVG (W.MEM_AGE)
             "나이평균"
    FROM TEAMW W
GROUP BY W.TEAM_ID
ORDER BY W.TEAM_ID;

  SELECT (SELECT Z.TEAM_NAME
            FROM TEAMZ Z
           WHERE Z.TEAM_ID LIKE W.TEAM_ID)
             "팀명",
         COUNT (*)
             "팀원수",
         SUM (W.MEM_AGE)
             "나이합",
         MAX (W.MEM_AGE)
             "나이최대치",
         MIN (W.MEM_AGE)
             "나이최소치",
         AVG (W.MEM_AGE)
             "나이평균"
    FROM TEAMW W
GROUP BY W.TEAM_ID
  HAVING AVG (W.MEM_AGE) >= 28                             --HAVING은 그룹바이를 해야함
ORDER BY W.TEAM_ID;

SELECT Z.TEAM_ID       팀ID,
       Z.TEAM_NAME     팀명,
       W.MEM_ID        ID,
       W.MEM_NAME      이름,
       W.MEM_AGE       나이,
       W.ROLL          역할
  FROM TEAMW W JOIN TEAMZ Z ON W.TEAM_ID LIKE Z.TEAM_ID;

UPDATE TEAMW
   SET ROLL = '팀원'
 WHERE MEM_ID = '2';

SELECT Z.TEAM_ID 팀ID,
       Z.TEAM_NAME  팀명,
       W.MEM_ID  ID,
       W.MEM_NAME 이름,
       W.MEM_AGE 나이,
       W.ROLL,
       CASE WHEN ROLL LIKE '팀장' THEN '팀장' ELSE '팀원' END     ROLL
  FROM TEAMW W JOIN TEAMZ Z ON W.TEAM_ID LIKE Z.TEAM_ID;

DELETE FROM TEAMW
      WHERE ROLL;

SELECT * FROM TEAMW;

SELECT PLAYER_NAME,
       POSITION,
       CASE
           WHEN POSITION IS NULL THEN '없음'
           WHEN POSITION LIKE 'GK' THEN '골키퍼'
           WHEN POSITION LIKE 'DF' THEN '수비수'
           ELSE '팀원'
       END
           포지션
  FROM PLAYER
 WHERE TEAM_ID = 'K08';



-- SOCCER_SQL_IN 24
-- 소속이 삼성블루윙즈 팀인 선수들과
-- 드래곤즈팀인 선수들의 선수 정보



SELECT ROWNUM "NO", A.*
  FROM (  SELECT T.TEAM_NAME       팀명,
                 P.PLAYER_NAME     선수명,
                 P.POSITION        포지션,
                 P.BACK_NO         백넘버,
                 P.HEIGHT          키
            FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
           WHERE     T.TEAM_ID LIKE
                         (SELECT T.TEAM_ID
                            FROM TEAM T
                           WHERE T.TEAM_NAME LIKE '삼성블루윙즈')
                 AND P.HEIGHT IS NOT NULL
        ORDER BY P.HEIGHT DESC) A;

--25 삼성블루윙즈에서 키순으로 탑 10

SELECT ROWNUM "NO", A.*
  FROM (  SELECT T.TEAM_NAME       팀명,
                 P.PLAYER_NAME     선수명,
                 P.POSITION        포지션,
                 P.BACK_NO         백넘버,
                 P.HEIGHT          키
            FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
           WHERE     T.TEAM_ID LIKE
                         (SELECT T.TEAM_ID
                            FROM TEAM T
                           WHERE T.TEAM_NAME LIKE '삼성블루윙즈')
                 AND P.HEIGHT IS NOT NULL
        ORDER BY P.HEIGHT DESC) A
 WHERE ROWNUM <= 10;

--25 삼성블루윙즈에서 키순으로 탑 10 제외 나머지

SELECT B.*
  FROM (SELECT ROWNUM RNUM, A.*
          FROM (  SELECT T.TEAM_NAME       팀명,
                         P.PLAYER_NAME     선수명,
                         P.POSITION        포지션,
                         P.BACK_NO         백넘버,
                         P.HEIGHT          키
                    FROM PLAYER P JOIN TEAM T ON P.TEAM_ID LIKE T.TEAM_ID
                   WHERE     T.TEAM_ID LIKE
                                 (SELECT T.TEAM_ID
                                    FROM TEAM T
                                   WHERE T.TEAM_NAME LIKE '삼성블루윙즈')
                         AND P.HEIGHT IS NOT NULL
                ORDER BY P.HEIGHT DESC) A) B
 WHERE B.RNUM BETWEEN 10 AND 20;

-- 026
-- 팀별 골키퍼의 평균 키에서
-- 가장 평균키가 큰 팀명은

SELECT
   A.TNAME
FROM
(SELECT
   (SELECT
   TEAM_NAME
FROM
   TEAM 
WHERE TEAM_ID LIKE T.TEAM_ID) TNAME,
   AVG(P.HEIGHT) AVG_HT,
   T.TEAM_ID
FROM
   TEAM T
   JOIN
   PLAYER P
       ON
       T.TEAM_ID LIKE P.TEAM_ID
WHERE
   P.POSITION LIKE 'GK'
GROUP BY T.TEAM_ID
ORDER BY AVG_HT DESC)A
WHERE ROWNUM = 1
;

-- 027
-- 각 구단별 선수들 평균키가 삼성 블루윙즈팀의
-- 평균키보다 작은 팀의 이름과 해당 팀의 평균키를
-- 구하시오



SELECT                                                          
       ROWNUM, A.*
  FROM (  SELECT T.TEAM_NAME, ROUND (AVG (P.HEIGHT), 2) 평균키
            FROM TEAM T JOIN PLAYER P ON T.TEAM_ID LIKE P.TEAM_ID
        GROUP BY T.TEAM_NAME) A
 WHERE A.평균키 < (  SELECT ROUND (AVG (P.HEIGHT), 2)     평균키
                          FROM TEAM T JOIN PLAYER P ON T.TEAM_ID LIKE P.TEAM_ID
                         WHERE T.TEAM_NAME LIKE '삼성블루윙즈'
                      GROUP BY T.TEAM_NAME)
                      ORDER BY A.평균키 DESC;






-- 028
-- 2012년 경기 중에서 점수차가 가장 큰 경기 전부


SELECT A.*
FROM(SELECT
        K.SCHE_DATE 경기날짜,
        HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME 경기,
        CASE
            WHEN K.HOME_SCORE >= K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
            ELSE K.AWAY_SCORE - K.HOME_SCORE
        END 점수차
     FROM
        SCHEDULE K
        JOIN TEAM HT
            ON K.HOMETEAM_ID LIKE HT.TEAM_ID
        JOIN TEAM AT
            ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.SCHE_DATE LIKE '2012%'
        AND K.GUBUN LIKE 'Y'
    
     ORDER BY 점수차 DESC) A
WHERE ROWNUM LIKE 1
;




-- 029
-- 좌석수대로 스타디움 순서 매기기

SELECT ROWNUM, A.*
  FROM (  SELECT S.STADIUM_NAME, S.SEAT_COUNT
            FROM STADIUM S
        ORDER BY S.SEAT_COUNT DESC) A;



-- 030
-- 2012년 구단 승리 순으로 순위매기기
SELECT 
    A.WINNER,
    COUNT(A.WINNER) 승리
FROM(SELECT
        K.SCHE_DATE 경기날짜,
        CASE
            WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
            WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
            ELSE '무승부'
        END WINNER
     FROM SCHEDULE K
            JOIN TEAM HT
                ON K.HOMETEAM_ID LIKE HT.TEAM_ID
            JOIN TEAM AT
                ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
     WHERE
        K.GUBUN LIKE 'Y'
        AND K.SCHE_DATE LIKE '2012%'
    )A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY 승리 DESC
;



DESC team;

SELECT * FROM schedule;

SELECT * FROM stadium;

SELECT * FROM team;

SELECT * FROM player;