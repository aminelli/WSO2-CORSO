\connect wso2_is_identity_db

DROP TABLE IF EXISTS CM_PII_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PII_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PII_CATEGORY_PK_SEQ;
CREATE TABLE CM_PII_CATEGORY (
  ID           INTEGER DEFAULT NEXTVAL('CM_PII_CATEGORY_PK_SEQ'),
  NAME         VARCHAR(255) NOT NULL,
  DESCRIPTION  VARCHAR(1023),
  DISPLAY_NAME VARCHAR(255),
  IS_SENSITIVE INTEGER      NOT NULL,
  TENANT_ID    INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PII_CATEGORY_CNT UNIQUE (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT;
CREATE TABLE CM_RECEIPT (
  CONSENT_RECEIPT_ID  VARCHAR(255) NOT NULL,
  VERSION             VARCHAR(255) NOT NULL,
  JURISDICTION        VARCHAR(255) NOT NULL,
  CONSENT_TIMESTAMP   TIMESTAMP    NOT NULL,
  COLLECTION_METHOD   VARCHAR(255) NOT NULL,
  LANGUAGE            VARCHAR(255) NOT NULL,
  PII_PRINCIPAL_ID    VARCHAR(255) NOT NULL,
  PRINCIPAL_TENANT_ID INTEGER DEFAULT '-1234',
  POLICY_URL          VARCHAR(255) NOT NULL,
  STATE               VARCHAR(255) NOT NULL,
  PII_CONTROLLER      VARCHAR(2048) NOT NULL,
  PRIMARY KEY (CONSENT_RECEIPT_ID)
);

DROP TABLE IF EXISTS CM_PURPOSE;
DROP SEQUENCE IF EXISTS CM_PURPOSE_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_PK_SEQ;
CREATE TABLE CM_PURPOSE (
  ID            INTEGER DEFAULT NEXTVAL('CM_PURPOSE_PK_SEQ'),
  NAME          VARCHAR(255) NOT NULL,
  DESCRIPTION   VARCHAR(1023),
  PURPOSE_GROUP VARCHAR(255) NOT NULL,
  GROUP_TYPE    VARCHAR(255) NOT NULL,
  TENANT_ID     INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CNT UNIQUE  (NAME, TENANT_ID, PURPOSE_GROUP, GROUP_TYPE),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE TABLE CM_PURPOSE_CATEGORY (
  ID          INTEGER DEFAULT NEXTVAL('CM_PURPOSE_CATEGORY_PK_SEQ'),
  NAME        VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  TENANT_ID   INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CATEGORY_CNT UNIQUE  (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT_SP_ASSOC;
DROP SEQUENCE IF EXISTS CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE TABLE CM_RECEIPT_SP_ASSOC (
  ID                 INTEGER DEFAULT NEXTVAL('CM_RECEIPT_SP_ASSOC_PK_SEQ'),
  CONSENT_RECEIPT_ID VARCHAR(255) NOT NULL,
  SP_NAME            VARCHAR(255) NOT NULL,
  SP_DISPLAY_NAME    VARCHAR(255),
  SP_DESCRIPTION     VARCHAR(1024),
  SP_TENANT_ID       INTEGER DEFAULT '-1234',
  CONSTRAINT CM_RECEIPT_SP_ASSOC_CNT UNIQUE  (CONSENT_RECEIPT_ID, SP_NAME, SP_TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_ASSOC;
DROP SEQUENCE IF EXISTS CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE TABLE CM_SP_PURPOSE_ASSOC (
  ID                     INTEGER DEFAULT NEXTVAL('CM_SP_PURPOSE_ASSOC_PK_SEQ'),
  RECEIPT_SP_ASSOC       INTEGER      NOT NULL,
  PURPOSE_ID             INTEGER      NOT NULL,
  CONSENT_TYPE           VARCHAR(255) NOT NULL,
  IS_PRIMARY_PURPOSE     INTEGER      NOT NULL,
  TERMINATION            VARCHAR(255) NOT NULL,
  THIRD_PARTY_DISCLOSURE INTEGER      NOT NULL,
  THIRD_PARTY_NAME       VARCHAR(255),
  CONSTRAINT CM_SP_PURPOSE_ASSOC_CNT UNIQUE  (RECEIPT_SP_ASSOC, PURPOSE_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PURPOSE_CAT_ASSC;
DROP SEQUENCE IF EXISTS CM_SP_PURPOSE_PURPOSE_CAT_ASSC_PK_SEQ;
CREATE SEQUENCE CM_SP_PURPOSE_PURPOSE_CAT_ASSC_PK_SEQ;
CREATE TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC (
  ID                  INTEGER DEFAULT NEXTVAL('CM_SP_PURPOSE_PURPOSE_CAT_ASSC_PK_SEQ'),
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PURPOSE_CATEGORY_ID INTEGER NOT NULL,
  CONSTRAINT CM_SP_PURPOSE_PURPOSE_CAT_ASSC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PURPOSE_CATEGORY_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_PII_CAT_ASSOC;
DROP SEQUENCE IF EXISTS CM_PURPOSE_PII_CAT_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_PII_CAT_ASSOC_PK_SEQ;
CREATE TABLE CM_PURPOSE_PII_CAT_ASSOC (
  ID                 INTEGER DEFAULT NEXTVAL('CM_PURPOSE_PII_CAT_ASSOC_PK_SEQ'),
  PURPOSE_ID         INTEGER NOT NULL,
  CM_PII_CATEGORY_ID INTEGER NOT NULL,
  IS_MANDATORY       INTEGER NOT NULL,
  CONSTRAINT CM_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (PURPOSE_ID, CM_PII_CATEGORY_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PII_CAT_ASSOC;
DROP SEQUENCE IF EXISTS CM_SP_PURPOSE_PII_CAT_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_SP_PURPOSE_PII_CAT_ASSOC_PK_SEQ;
CREATE TABLE CM_SP_PURPOSE_PII_CAT_ASSOC (
  ID                  INTEGER DEFAULT NEXTVAL('CM_SP_PURPOSE_PII_CAT_ASSOC_PK_SEQ'),
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PII_CATEGORY_ID     INTEGER NOT NULL,
  VALIDITY            VARCHAR(1023),
  IS_CONSENTED BOOLEAN DEFAULT TRUE,
  CONSTRAINT CM_SP_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PII_CATEGORY_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_CONSENT_RECEIPT_PROPERTY;
DROP SEQUENCE IF EXISTS CM_CONSENT_RECEIPT_PROPERTY_PK_SEQ;
CREATE SEQUENCE CM_CONSENT_RECEIPT_PROPERTY_PK_SEQ;
CREATE TABLE CM_CONSENT_RECEIPT_PROPERTY (
  ID                 INTEGER DEFAULT NEXTVAL('CM_CONSENT_RECEIPT_PROPERTY_PK_SEQ'),
  CONSENT_RECEIPT_ID VARCHAR(255)  NOT NULL,
  NAME               VARCHAR(255)  NOT NULL,
  VALUE              VARCHAR(1023) NOT NULL,
  CONSTRAINT CM_CONSENT_RECEIPT_PROPERTY_CNT UNIQUE  (CONSENT_RECEIPT_ID, NAME),
  PRIMARY KEY (ID)
);

ALTER TABLE CM_RECEIPT_SP_ASSOC
  ADD CONSTRAINT CM_RECEIPT_SP_ASSOC_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk0 FOREIGN KEY (RECEIPT_SP_ASSOC) REFERENCES CM_RECEIPT_SP_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk1 FOREIGN KEY (PURPOSE_ID) REFERENCES CM_PURPOSE (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk1 FOREIGN KEY (PURPOSE_CATEGORY_ID) REFERENCES CM_PURPOSE_CATEGORY (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk1 FOREIGN KEY (PII_CATEGORY_ID) REFERENCES CM_PII_CATEGORY (ID);

ALTER TABLE CM_CONSENT_RECEIPT_PROPERTY
  ADD CONSTRAINT CM_CONSENT_RECEIPT_PRT_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

INSERT INTO CM_PURPOSE (NAME, DESCRIPTION, PURPOSE_GROUP, GROUP_TYPE, TENANT_ID) VALUES ('DEFAULT', 'For core functionalities of the product', 'DEFAULT', 'SP', '-1234');

INSERT INTO CM_PURPOSE_CATEGORY (NAME, DESCRIPTION, TENANT_ID) VALUES ('DEFAULT','For core functionalities of the product', '-1234');
