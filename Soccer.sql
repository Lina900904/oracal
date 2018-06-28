/* Formatted on 2018/06/27 ���� 2:46:57 (QP5 v5.326) */
SELECT * FROM team;

SELECT COUNT (*) AS "���̺��� ��" FROM tab;

SELECT COUNT (*) ���̺��Ǽ� FROM tab;                                -- �÷��� ���̾ƽ�

SELECT team_name AS "��ü �౸�� ���" FROM team;

  SELECT team_name     "��ü �౸�� ���"
    FROM team
ORDER BY team_name;                                                           -- ��������

  SELECT team_name     AS "��ü �౸�� ���"
    FROM team
ORDER BY team_name DESC;                                                                   -- ��������

SELECT DISTINCT position     AS "������"
  FROM player;

SELECT DISTINCT NVL2 (position, position, '����')     "������"
  FROM player;             -- nvl2(a,'b','c') a�� null�̸� c, null�ƴϸ� b

  SELECT player_name     �̸�
    FROM player
   WHERE team_id LIKE 'K02' AND position LIKE 'GK'
ORDER BY player_name;


SELECT position ������, player_name �̸�
  FROM player
 WHERE     team_id LIKE 'K02'
       AND height >= 170
       AND SUBSTR (player_name, 1, 1) LIKE '��';

SELECT SUBSTR (player_name, 1, 2) �׽�Ʈ�� FROM player;

SELECT position ������, player_name �̸�
  FROM player
 WHERE team_id LIKE 'K02' AND height >= 170 AND player_name LIKE '��__';

  SELECT player_name                                    �̸�,
         TO_CHAR (NVL2 (height, height, 0)) || 'cm'     Ű,
         TO_CHAR (NVL2 (weight, weight, 0)) || 'kg'     ����
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '����'              �̸�,
         NVL2 (height, height, 0) || 'cm'     Ű,
         NVL2 (weight, weight, 0) || 'kg'     ����
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '����'                             �̸�,
         NVL2 (height, height, 0) || 'cm'                    Ű,
         NVL2 (weight, weight, 0) || 'kg'                    ����,
         ROUND (weight / (POWER (height, 2) / 10000), 2)     BMI
    FROM player
   WHERE team_id LIKE 'K02'
ORDER BY height DESC;

  SELECT player_name || '����' �̸�, p.team_id ���Ƶ�
    FROM player p, team t
   WHERE     p.team_id = t.team_id
         AND p.team_id IN ('K10', 'K02')
         AND p.position LIKE 'MF'
         AND player_name LIKE '��%'
ORDER BY team_name;


SELECT player_name || '����' �̸�, team_id �Ƶ�
  FROM player
 WHERE player_name LIKE '��%';

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
--FROM Orders (�����̵Ǵ�)
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

  SELECT p.height || 'cm' Ű, t.team_name ����, p.player_name �̸�
    FROM team t, player p
   WHERE     t.team_id LIKE p.team_id
         AND p.team_id IN ('K02', 'K10')
         AND p.height BETWEEN 180 AND 183
ORDER BY p.height, t.team_name, p.player_name;

--ANSI

  SELECT p.height || 'cm' Ű, t.team_name ����, p.player_name �̸�
    FROM player p JOIN team t ON t.team_id LIKE p.team_id
   WHERE p.team_id IN ('K02', 'K10') AND p.height BETWEEN 180 AND 183
ORDER BY p.height, t.team_name, p.player_name;

-- SOCCER_SQL_010
--  ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������

  SELECT t.team_name,
         p.player_name,
         p.position
    FROM player p 
        JOIN team t 
            ON p.team_id like t.team_id
    where p.position is null
ORDER BY t.team_name, p.player_name;


-- SOCCER_SQL_011
--  ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���

SELECT t.team_name ����, s.stadium_name ��Ÿ����̸�
  FROM team t JOIN stadium s ON t.stadium_id LIKE s.stadium_id;


-- SOCCER_SQL_012
--  ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� �����
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.

SELECT t.team_name        ����,
       s.stadium_name     ��Ÿ���,
       sc.awayteam_id     ������,
       sc.sche_date       �����쳯¥
  FROM team  t
      JOIN stadium s 
            ON t.stadium_id like s.stadium_id
       JOIN schedule sc 
            ON s.STADIUM_ID LIKE sc.STADIUM_ID
 WHERE sc.sche_date LIKE '20120317';



 -- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������),
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�

SELECT p.player_name �̸�,
       p.position ������,
       t.team_name ����,
       s.stadium_name ��Ÿ���,
       sc.SCHE_DATE �����쳯¥
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
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
SELECT  s.stadium_name ��Ÿ���,
        sc.SCHE_DATE ��⳯¥,
        ht.Region_name|| ' '||ht.team_name Ȩ��,
        at.Region_name|| ' '||at.team_name ������,
        p.player_name �̸�,
        sc.home_score Ȩ������,
        sc.away_score ����������
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
            

      
       
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20 , �ϻ� �ؿ� ����, �Ⱦ絵 ����

select s.stadium_name,
       s.stadium_id,
       s.seat_count,
       s.hometeam_id,
       t.e_team_name
 from stadium s
 left join team t
 on s.STADIUM_ID like t.STADIUM_ID;

--���̵� �𸣰� �̸����θ� ������ ©��
SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( (X) , (Y) )
;

-- SOCCER_SQL_016
-- �Ҽ��� �Ｚ������� ���� �������
-- �巡�������� �������� ���� ����
SELECT 
    T.TEAM_NAME ����,
    P.PLAYER_NAME ������,
    P.POSITION ������,
    P.BACK_NO ��ѹ�,
    P.HEIGHT Ű
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN (  
select T.TEAM_ID  
from TEAM T WHERE T.TEAM_NAME IN('�Ｚ�������','�巡����')
);

--018
--��ȣ�� ������ �Ҽ����� ������ ��ѹ��� �����Դϱ�

SELECT T.TEAM_NAME �Ҽ���, P.BACK_NO ��ѹ�
FROM (SELECT TEAM_NAME FROM TEAM WHERE TEAM_NAME LIKE '��ȣ��')T, PLAYER P 
WHERE P.PLAYER_NAME LIKE '��ȣ��';



-- 019
-- ������Ƽ���� MF ���Ű�� ���Դϱ�

SELECT T.TEAM_NAME, P.HEIGHT ���Ű,
(SELECT ROUND(AVG(P.HEIGHT) FROM HEIGHT WHERE T.TEAM_NAME LIKE '������Ƽ��') ���Ű
FROM TEAM T,  PLAYER P;









-- 020
-- 2012�� ���� ������ ���Ͻÿ�


DESC team;
SELECT * FROM schedule;
SELECT * FROM stadium;
SELECT * FROM team;
SELECT * FROM player;