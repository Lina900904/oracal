/* Formatted on 2018/06/27 오후 2:46:57 (QP5 v5.326) */
SELECT * FROM team;

SELECT COUNT (*) AS "테이블의 수" FROM tab;

SELECT COUNT (*) 테이블의수 FROM tab;                                -- 컬럼의 아이아스

SELECT team_name AS "전체 축구팀 목록" FROM team;

  SELECT team_name     "전체 축구팀 목록"
    FROM team
ORDER BY team_name;                                                           -- 오름차순

  SELECT team_name     AS "전체 축구팀 목록"
    FROM team
ORDER BY team_name DESC;                                                                   -- 내림차순

SELECT DISTINCT position     AS "포지션"
  FROM player;

SELECT DISTINCT NVL2 (position, position, '신입')     "포지션"
  FROM player;             -- nvl2(a,'b','c') a가 null이면 c, null아니면 b

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

  SELECT t.team_name,
         p.player_name,
         p.position
    FROM player p 
        JOIN team t 
            ON p.team_id like t.team_id
    where p.position is null
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
      JOIN stadium s 
            ON t.stadium_id like s.stadium_id
       JOIN schedule sc 
            ON s.STADIUM_ID LIKE sc.STADIUM_ID
 WHERE sc.sche_date LIKE '20120317';



 -- SOCCER_SQL_013
-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오

SELECT p.player_name 이름,
       p.position 포지션,
       t.team_name 팀명,
       s.stadium_name 스타디움,
       sc.SCHE_DATE 스케쥴날짜
FROM player  p
        JOIN team t 
            ON p.team_id  LIKE t.team_id 
        JOIN stadium s 
            ON t.stadium_id LIKE s.stadium_id
        JOIN schedule sc 
            ON t.STADIUM_ID LIKE sc.STADIUM_ID
where 
    sc.SCHE_DATE   like '20120317'
    and t.team_id like 'K03'
    and p.position like 'GK';
 
    -- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
SELECT  s.stadium_name 스타디움,
        sc.SCHE_DATE 경기날짜,
        ht.Region_name|| ' '||ht.team_name 홈팀,
        at.Region_name|| ' '||at.team_name 원정팀,
        p.player_name 이름,
        sc.home_score 홈팀점수,
        sc.away_score 원정팀점수
FROM schedule sc 
        JOIN stadium s
            ON sc.stadium_id  LIKE s.stadium_id
        JOIN team ht
            ON sc.hometeam_id  LIKE ht.team_id 
        JOIN team at 
            ON sc.awayteam_id  LIKE at.team_id 
        JOIN team t
            ON sc.awayteam_id LIKE t.team_id
        JOIN player p
            ON s.stadium_id LIKE p.player_id
 where sc.home_score - sc.away_score like +3 ;
            

      
       
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20 , 일산 밑에 마산, 안양도 있음

select s.stadium_name,
       s.stadium_id,
       s.seat_count,
       s.hometeam_id,
       t.e_team_name
 from stadium s
 left join team t
 on s.STADIUM_ID like t.STADIUM_ID;

--아이디를 모르고 이름으로만 쿼리를 짤때
SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( (X) , (Y) )
;

-- SOCCER_SQL_016
-- 소속이 삼성블루윙즈 팀인 선수들과
-- 드래곤즈팀인 선수들의 선수 정보
SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN (  
select T.TEAM_ID  
from TEAM T WHERE T.TEAM_NAME IN('삼성블루윙즈','드래곤즈')
);

--018
--최호진 선수의 소속팀과 포지션 백넘버는 무엇입니까

SELECT T.TEAM_NAME 소속팀, P.BACK_NO 백넘버
FROM (SELECT TEAM_NAME FROM TEAM WHERE TEAM_NAME LIKE '최호진')T, PLAYER P 
WHERE P.PLAYER_NAME LIKE '최호진';



-- 019
-- 대전시티즌의 MF 평균키는 얼마입니까

SELECT T.TEAM_NAME, P.HEIGHT 평균키,
(SELECT ROUND(AVG(P.HEIGHT) FROM HEIGHT WHERE T.TEAM_NAME LIKE '대전시티즌') 평균키
FROM TEAM T,  PLAYER P;









-- 020
-- 2012년 월별 경기수를 구하시오


DESC team;
SELECT * FROM schedule;
SELECT * FROM stadium;
SELECT * FROM team;
SELECT * FROM player;