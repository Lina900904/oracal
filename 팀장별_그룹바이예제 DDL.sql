CREATE TABLE TEAMZ
(
    TEAM_ID      VARCHAR2 (20) PRIMARY KEY,
    TEAM_NAME    VARCHAR2 (20)
);

CREATE TABLE TEAMW
(
    MEM_ID      VARCHAR2 (20) PRIMARY KEY,
    TEAM_ID     VARCHAR2 (20),
    MEM_NAME    VARCHAR2 (20),
    MEM_AGE     DECIMAL,
    ROLL        VARCHAR2 (20)
);                         
 

ALTER TABLE TEAMW
    ADD CONSTRAINT TEAM_fk_TEAM_ID FOREIGN KEY (TEAM_ID)
            REFERENCES TEAMZ (TEAM_ID);

INSERT INTO TEAMZ (TEAM_ID, TEAM_NAME)
     VALUES ('ATEAM', '저스티스');

INSERT INTO TEAMZ (TEAM_ID, TEAM_NAME)
     VALUES ('HTEAM', '엘카로');

INSERT INTO TEAMZ (TEAM_ID, TEAM_NAME)
     VALUES ('CTEAM', '가오갤');

INSERT INTO TEAMZ (TEAM_ID, TEAM_NAME)
     VALUES ('STEAM', '어벤저스');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('저스티스1',
             'ATEAM',
             '형준',
             '34');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('저스티스2',
             'ATEAM',
             '세인',
             '35');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('저스티스3',
             'ATEAM',
             '희태',
             '21');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('저스티스4',
             'ATEAM',
             '상훈',
             '29');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('저스티스5',
             'ATEAM',
             '태형',
             '25');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('엘카로1',
             'HTEAM',
             '혜리',
             '26');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('엘카로2',
             'HTEAM',
             '지은',
             '26');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('엘카로3',
             'HTEAM',
             '준',
             '27');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('엘카로4',
             'HTEAM',
             '재경',
             '30');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('엘카로5',
             'HTEAM',
             '단아',
             '26');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('가오갤1',
             'CTEAM',
             '최정훈',
             '32');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('가오갤2',
             'CTEAM',
             '윤호',
             '31');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('가오갤3',
             'CTEAM',
             '가은',
             '29');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('가오갤4',
             'CTEAM',
             '정훈',
             '23');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('가오갤5',
             'CTEAM',
             '승태',
             '30');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('어벤져스1',
             'STEAM',
             '승호',
             '27');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('어벤져스2',
             'STEAM',
             '소진',
             '26');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('어벤져스3',
             'STEAM',
             '이슬',
             '29');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('어벤져스4',
             'STEAM',
             '진태',
             '26');

INSERT INTO TEAMW (MEM_ID,
                   TEAM_ID,
                   MEM_NAME,
                   MEM_AGE)
     VALUES ('어벤져스5',
             'STEAM',
             '누리',
             '30');
             
             
             
             
