drop table activity;
drop table cert_certificate;
drop table cert_grad;
drop table cert_lect;
drop table cert_project_detail;
drop table cert_project;
drop table cert_scholarship;
drop table history;
drop table personality_list;
drop table personality;
drop table port_comment;
drop table portfolio;
drop table skill;
drop table swot;
drop table userinfo;
drop table file_management;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

 

-- userinfo Table Create SQL

CREATE TABLE userinfo

(

    id          VARCHAR2(20)     NOT NULL, 

    password    VARCHAR2(20)     NOT NULL, 

    name        VARCHAR2(20)     NOT NULL, 

    email       VARCHAR2(100)    NOT NULL, 

    CONSTRAINT USERINFO_PK PRIMARY KEY (id)

)

/

 

COMMENT ON TABLE userinfo IS '유저 회원가입 테이블'

/

 

COMMENT ON COLUMN userinfo.id IS '유저아이디'

/

 

COMMENT ON COLUMN userinfo.password IS '유저패스워드'

/

 

COMMENT ON COLUMN userinfo.name IS '유저이름'

/

 

COMMENT ON COLUMN userinfo.email IS '유저이메일'

/

 

 

-- file_management Table Create SQL

CREATE TABLE file_management

(

    file_id             INT               NOT NULL, 

    originalFileName    VARCHAR2(1000)    NOT NULL, 

    savedFileName       VARCHAR2(1000)    NOT NULL, 

    CONSTRAINT FILE_MANAGEMENT_PK PRIMARY KEY (file_id)

)

/

 

CREATE SEQUENCE file_management_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER file_management_file_id_AI_TRG

BEFORE INSERT ON file_management 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT file_management_SEQ.NEXTVAL

    INTO: NEW.file_id

    FROM DUAL;

END;

/

 

COMMENT ON COLUMN file_management.file_id IS '파일아이디'

/

 

COMMENT ON COLUMN file_management.originalFileName IS '첨부파일(원래이름)'

/

 

COMMENT ON COLUMN file_management.savedFileName IS '첨부파일(저장이름)'

/

 

 

-- cert_project Table Create SQL

CREATE TABLE cert_project

(

    proId       VARCHAR2(20)     NOT NULL, 

    proNum      NUMBER           NOT NULL, 

    proTerm     VARCHAR2(20)     NULL, 

    proEdu      VARCHAR2(50)     NULL, 

    proTitle    VARCHAR2(100)    NULL, 

    CONSTRAINT CERT_PROJECT_PK PRIMARY KEY (proNum)

)

/

 

CREATE SEQUENCE cert_project_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER cert_project_proNum_AI_TRG

BEFORE INSERT ON cert_project 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT cert_project_SEQ.NEXTVAL

    INTO: NEW.proNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE cert_project IS '자격증명 - 프로젝트'

/

 

COMMENT ON COLUMN cert_project.proId IS '프로젝트아이디'

/

 

COMMENT ON COLUMN cert_project.proNum IS '리스트번호'

/

 

COMMENT ON COLUMN cert_project.proTerm IS '학기'

/

 

COMMENT ON COLUMN cert_project.proEdu IS '교과목명'

/

 

COMMENT ON COLUMN cert_project.proTitle IS '프로젝트명'

/

 

ALTER TABLE cert_project

    ADD CONSTRAINT FK_cert_project_proId_userinfo FOREIGN KEY (proId)

        REFERENCES userinfo (id)

/

 

 

-- swot Table Create SQL

CREATE TABLE swot

(

    swotId    VARCHAR2(20)     NOT NULL, 

    swotS     VARCHAR2(500)    NULL, 

    swotW     VARCHAR2(500)    NULL, 

    swotO     VARCHAR2(500)    NULL, 

    swotT     VARCHAR2(500)    NULL   

)

/

 

COMMENT ON TABLE swot IS 'SWOT 분석 테이블'

/

 

COMMENT ON COLUMN swot.swotId IS 'swot아이디'

/

 

COMMENT ON COLUMN swot.swotS IS '장점'

/

 

COMMENT ON COLUMN swot.swotW IS '단점'

/

 

COMMENT ON COLUMN swot.swotO IS '기회'

/

 

COMMENT ON COLUMN swot.swotT IS '위기'

/

 

ALTER TABLE swot

    ADD CONSTRAINT FK_swot_swotId_userinfo_id FOREIGN KEY (swotId)

        REFERENCES userinfo (id)

/

 

 

-- history Table Create SQL

CREATE TABLE history

(

    hisId         VARCHAR2(20)    NOT NULL, 

    hisDate       DATE            NULL, 

    hisPeriod     VARCHAR2(50)    NULL, 

    hisTitle      VARCHAR2(50)    NULL, 

    hisContent    CLOB            NULL   

)

/

 

COMMENT ON TABLE history IS '연혁 테이블'

/

 

COMMENT ON COLUMN history.hisId IS '연혁아이디'

/

 

COMMENT ON COLUMN history.hisDate IS '날짜'

/

 

COMMENT ON COLUMN history.hisPeriod IS '기간'

/

 

COMMENT ON COLUMN history.hisTitle IS '타이틀'

/

 

COMMENT ON COLUMN history.hisContent IS '내용'

/

 

ALTER TABLE history

    ADD CONSTRAINT FK_history_hisId_userinfo_id FOREIGN KEY (hisId)

        REFERENCES userinfo (id)

/

 

 

-- personality Table Create SQL

CREATE TABLE personality

(

    persId         VARCHAR2(20)    NOT NULL, 

    persKind       NUMBER          NULL, 

    persWord       VARCHAR2(20)    NULL, 

    persContent    CLOB            NULL   

)

/

 

COMMENT ON TABLE personality IS '성격 테이블'

/

 

COMMENT ON COLUMN personality.persId IS '성격아이디'

/

 

COMMENT ON COLUMN personality.persKind IS '구분(0장점,1단점)'

/

 

COMMENT ON COLUMN personality.persWord IS '성격키워드'

/

 

COMMENT ON COLUMN personality.persContent IS '내용'

/

 

ALTER TABLE personality

    ADD CONSTRAINT FK_personality_persId_userinfo FOREIGN KEY (persId)

        REFERENCES userinfo (id)

/

 

 

-- personality_list Table Create SQL

CREATE TABLE personality_list

(

    persListNum     NUMBER          NOT NULL, 

    persListWord    VARCHAR2(20)    NULL, 

    CONSTRAINT PERSONALITY_LIST_PK PRIMARY KEY (persListNum)

)

/

 

CREATE SEQUENCE personality_list_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER personality_list_persLi_AI_TRG

BEFORE INSERT ON personality_list 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT personality_list_SEQ.NEXTVAL

    INTO: NEW.persListNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE personality_list IS '성격 리스트'

/

 

COMMENT ON COLUMN personality_list.persListNum IS '리스트번호'

/

 

COMMENT ON COLUMN personality_list.persListWord IS '리스트단어'

/

 

 

-- cert_grad Table Create SQL

CREATE TABLE cert_grad

(

    gradId        VARCHAR2(20)    NOT NULL, 

    gradFileId    NUMBER          NULL   

)

/

 

COMMENT ON TABLE cert_grad IS '자격증명 - 졸업증명'

/

 

COMMENT ON COLUMN cert_grad.gradId IS '졸업증명아이디'

/

 

COMMENT ON COLUMN cert_grad.gradFileId IS '첨부파일'

/

 

ALTER TABLE cert_grad

    ADD CONSTRAINT FK_cert_grad_gradId_userinfo_i FOREIGN KEY (gradId)

        REFERENCES userinfo (id)

/

 

ALTER TABLE cert_grad

    ADD CONSTRAINT FK_cert_grad_gradFileId_file_m FOREIGN KEY (gradFileId)

        REFERENCES file_management (file_id)

/

 

 

-- cert_scholarship Table Create SQL

CREATE TABLE cert_scholarship

(

    schId        VARCHAR2(20)    NOT NULL, 

    schFileId    NUMBER          NULL   

)

/

 

COMMENT ON TABLE cert_scholarship IS '자격증명 - 장학내역'

/

 

COMMENT ON COLUMN cert_scholarship.schId IS '장학내역아이디'

/

 

COMMENT ON COLUMN cert_scholarship.schFileId IS '첨부파일'

/

 

ALTER TABLE cert_scholarship

    ADD CONSTRAINT FK_cert_scholarship_schId_user FOREIGN KEY (schId)

        REFERENCES userinfo (id)

/

 

ALTER TABLE cert_scholarship

    ADD CONSTRAINT FK_cert_scholarship_schFileId_ FOREIGN KEY (schFileId)

        REFERENCES file_management (file_id)

/

 

 

-- cert_lect Table Create SQL

CREATE TABLE cert_lect

(

    lectId           VARCHAR2(20)     NOT NULL, 

    lectNum          NUMBER           NOT NULL, 

    lectDiv          VARCHAR2(50)     NULL, 

    lectDivDetail    VARCHAR2(50)     NULL, 

    lectName         VARCHAR2(50)     NULL, 

    lectPeriod       VARCHAR2(50)     NULL, 

    lectGrade        VARCHAR2(20)     NULL, 

    lectEtc          VARCHAR2(200)    NULL, 

    CONSTRAINT CERT_LECT_PK PRIMARY KEY (lectNum)

)

/

 

CREATE SEQUENCE cert_lect_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER cert_lect_lectNum_AI_TRG

BEFORE INSERT ON cert_lect 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT cert_lect_SEQ.NEXTVAL

    INTO: NEW.lectNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE cert_lect IS '자격증명 - 이수과목'

/

 

COMMENT ON COLUMN cert_lect.lectId IS '이수과목아이디'

/

 

COMMENT ON COLUMN cert_lect.lectNum IS '리스트번호'

/

 

COMMENT ON COLUMN cert_lect.lectDiv IS '구분'

/

 

COMMENT ON COLUMN cert_lect.lectDivDetail IS '세부구분'

/

 

COMMENT ON COLUMN cert_lect.lectName IS '교과목명'

/

 

COMMENT ON COLUMN cert_lect.lectPeriod IS '기간'

/

 

COMMENT ON COLUMN cert_lect.lectGrade IS '성적'

/

 

COMMENT ON COLUMN cert_lect.lectEtc IS '비고'

/

 

ALTER TABLE cert_lect

    ADD CONSTRAINT FK_cert_lect_lectId_userinfo_i FOREIGN KEY (lectId)

        REFERENCES userinfo (id)

/

 

 

-- cert_project_detail Table Create SQL

CREATE TABLE cert_project_detail

(

    proDetailNum        NUMBER           NOT NULL, 

    proDetailTitle      VARCHAR2(100)    NULL, 

    proDetailDate       DATE             NULL, 

    proDetailEdu        VARCHAR2(50)     NULL, 

    proDetailContent    CLOB             NULL, 

    proDetailFIleId     NUMBER           NULL   

)

/

 

COMMENT ON TABLE cert_project_detail IS '자격증명 - 프로젝트 상세내역'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailNum IS '리스트번호'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailTitle IS '프로젝트명'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailDate IS '프로젝트날짜'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailEdu IS '교과목명'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailContent IS '프로젝트설명'

/

 

COMMENT ON COLUMN cert_project_detail.proDetailFIleId IS '첨부파일'

/

 

ALTER TABLE cert_project_detail

    ADD CONSTRAINT FK_cert_project_detail_proDet1 FOREIGN KEY (proDetailNum)

        REFERENCES cert_project (proNum)

/

 

ALTER TABLE cert_project_detail

    ADD CONSTRAINT FK_cert_project_detail_proDet2 FOREIGN KEY (proDetailFIleId)

        REFERENCES file_management (file_id)

/

 

 

-- cert_certificate Table Create SQL

CREATE TABLE cert_certificate

(

    certId        VARCHAR2(20)     NOT NULL, 

    certNum       NUMBER           NOT NULL, 

    certName      VARCHAR2(50)     NULL, 

    certAgency    VARCHAR2(50)     NULL, 

    certDate      DATE             NULL, 

    certEtc       VARCHAR2(100)    NULL, 

    certFileId    NUMBER           NULL, 

    CONSTRAINT CERT_CERTIFICATE_PK PRIMARY KEY (certNum)

)

/

 

CREATE SEQUENCE cert_certificate_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER cert_certificate_certNu_AI_TRG

BEFORE INSERT ON cert_certificate 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT cert_certificate_SEQ.NEXTVAL

    INTO: NEW.certNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE cert_certificate IS '자격증명 - 보유자격증'

/

 

COMMENT ON COLUMN cert_certificate.certId IS '자격증아이디'

/

 

COMMENT ON COLUMN cert_certificate.certNum IS '리스트번호'

/

 

COMMENT ON COLUMN cert_certificate.certName IS '자격증이름'

/

 

COMMENT ON COLUMN cert_certificate.certAgency IS '발급기관'

/

 

COMMENT ON COLUMN cert_certificate.certDate IS '취득일자'

/

 

COMMENT ON COLUMN cert_certificate.certEtc IS '비고'

/

 

COMMENT ON COLUMN cert_certificate.certFileId IS '첨부파일'

/

 

ALTER TABLE cert_certificate

    ADD CONSTRAINT FK_cert_certificate_certId_use FOREIGN KEY (certId)

        REFERENCES userinfo (id)

/

 

ALTER TABLE cert_certificate

    ADD CONSTRAINT FK_cert_certificate_certFileId FOREIGN KEY (certFileId)

        REFERENCES file_management (file_id)

/

 

 

-- skill Table Create SQL

CREATE TABLE skill

(

    skillId         VARCHAR2(20)    NOT NULL, 

    skillNum        NUMBER          NOT NULL, 

    skillName       VARCHAR2(50)    NULL, 

    skillContent    CLOB            NULL, 

    CONSTRAINT SKILL_PK PRIMARY KEY (skillNum)

)

/

 

CREATE SEQUENCE skill_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER skill_skillNum_AI_TRG

BEFORE INSERT ON skill 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT skill_SEQ.NEXTVAL

    INTO: NEW.skillNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE skill IS '스킬'

/

 

COMMENT ON COLUMN skill.skillId IS '스킬아이디'

/

 

COMMENT ON COLUMN skill.skillNum IS '리스트번호'

/

 

COMMENT ON COLUMN skill.skillName IS '스킬명'

/

 

COMMENT ON COLUMN skill.skillContent IS '스킬설명'

/

 

ALTER TABLE skill

    ADD CONSTRAINT FK_skill_skillId_userinfo_id FOREIGN KEY (skillId)

        REFERENCES userinfo (id)

/

 

 

-- activity Table Create SQL

CREATE TABLE activity

(

    actId          VARCHAR2(20)     NOT NULL, 

    actNum         NUMBER           NOT NULL, 

    actName        VARCHAR2(100)    NULL, 

    actAgency      VARCHAR2(50)     NULL, 

    actDate        DATE             NULL, 

    actContent     VARCHAR2(500)    NULL, 

    actPosition    VARCHAR2(50)     NULL, 

    actFileId      NUMBER           NULL, 

    actURL         VARCHAR2(500)    NULL, 

    CONSTRAINT ACTIVITY_PK PRIMARY KEY (actNum)

)

/

 

CREATE SEQUENCE activity_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER activity_actNum_AI_TRG

BEFORE INSERT ON activity 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT activity_SEQ.NEXTVAL

    INTO: NEW.actNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE activity IS '활동내역'

/

 

COMMENT ON COLUMN activity.actId IS '활동내역아이디'

/

 

COMMENT ON COLUMN activity.actNum IS '리스트번호'

/

 

COMMENT ON COLUMN activity.actName IS '활동명'

/

 

COMMENT ON COLUMN activity.actAgency IS '활동기관명'

/

 

COMMENT ON COLUMN activity.actDate IS '활동일'

/

 

COMMENT ON COLUMN activity.actContent IS '활동내용'

/

 

COMMENT ON COLUMN activity.actPosition IS '직위'

/

 

COMMENT ON COLUMN activity.actFileId IS '첨부파일'

/

 

COMMENT ON COLUMN activity.actURL IS '첨부파일URL'

/

 

ALTER TABLE activity

    ADD CONSTRAINT FK_activity_actId_userinfo_id FOREIGN KEY (actId)

        REFERENCES userinfo (id)

/

 

ALTER TABLE activity

    ADD CONSTRAINT FK_activity_actFileId_file_man FOREIGN KEY (actFileId)

        REFERENCES file_management (file_id)

/

 

 

-- portfolio Table Create SQL

CREATE TABLE portfolio

(

    portId        VARCHAR2(20)    NOT NULL, 

    portNum       NUMBER          NOT NULL, 

    portContent    CLOB          NULL, 

    CONSTRAINT PORTFOLIO_PK PRIMARY KEY (portNum)

)

/

 

CREATE SEQUENCE portfolio_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER portfolio_portNum_AI_TRG

BEFORE INSERT ON portfolio 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT portfolio_SEQ.NEXTVAL

    INTO: NEW.portNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE portfolio IS '포트폴리오'

/

 

COMMENT ON COLUMN portfolio.portId IS '포트폴리오아이디'

/

 

COMMENT ON COLUMN portfolio.portNum IS '포트폴리오번호'

/

 

COMMENT ON COLUMN portfolio.portFileId IS '첨부파일'

/

 

ALTER TABLE portfolio

    ADD CONSTRAINT FK_portfolio_portId_userinfo_i FOREIGN KEY (portId)

        REFERENCES userinfo (id)

/

 

ALTER TABLE portfolio

    ADD CONSTRAINT FK_portfolio_portFileId_file_m FOREIGN KEY (portFileId)

        REFERENCES file_management (file_id)

/

 

 

-- port_comment Table Create SQL

CREATE TABLE port_comment

(

    commentNum     NUMBER            NOT NULL, 

    commentID      VARCHAR2(20)      NOT NULL, 

    commentText    VARCHAR2(1000)    NOT NULL, 

    commentDate    DATE              NULL, 

    CONSTRAINT PORT_COMMENT_PK PRIMARY KEY (commentNum)

)

/

 

CREATE SEQUENCE port_comment_SEQ

START WITH 1

INCREMENT BY 1;

/

 

CREATE OR REPLACE TRIGGER port_comment_commentNum_AI_TRG

BEFORE INSERT ON port_comment 

REFERENCING NEW AS NEW FOR EACH ROW 

BEGIN 

    SELECT port_comment_SEQ.NEXTVAL

    INTO: NEW.commentNum

    FROM DUAL;

END;

/

 

COMMENT ON TABLE port_comment IS '포트폴리오댓글'

/

 

COMMENT ON COLUMN port_comment.commentNum IS '댓글번호'

/

 

COMMENT ON COLUMN port_comment.commentID IS '댓글아이디'

/

 

COMMENT ON COLUMN port_comment.commentText IS '댓글내용'

/

 

COMMENT ON COLUMN port_comment.commentDate IS '댓글작성일'

/

 

 