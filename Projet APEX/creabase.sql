
---
---
---
---
---

CREATE TABLE  "COUNTRY" 
   (  "ID_COUNTRY" NUMBER NOT NULL ENABLE, 
  "COU_LABEL" VARCHAR2(100) NOT NULL ENABLE, 
  "COU_PHONE_EXTENSION" VARCHAR2(2) NOT NULL ENABLE, 
  "COU_TAX_RATE" NUMBER(2,2) NOT NULL ENABLE, 
   CONSTRAINT "COUNTRY_PK" PRIMARY KEY ("ID_COUNTRY") ENABLE, 
   CONSTRAINT "COUNTRY_UK1" UNIQUE ("COU_LABEL", "COU_PHONE_EXTENSION") ENABLE
   ) ;


CREATE OR REPLACE TRIGGER  "BI_COUNTRY" 
  before insert on "COUNTRY"               
  for each row  
begin   
  if :NEW."ID_COUNTRY" is null then 
    select "COUNTRY_SEQ".nextval into :NEW."ID_COUNTRY" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_COUNTRY" ENABLE;







---
---
---
---
---

CREATE TABLE  "CODE" 
   (	"ID_CODE" NUMBER, 
	"COD_VALUE" VARCHAR2(100), 
	 CONSTRAINT "CODE_PK" PRIMARY KEY ("ID_CODE") ENABLE, 
	 CONSTRAINT "CODE_UK1" UNIQUE ("COD_VALUE") ENABLE
   ) ;


CREATE OR REPLACE TRIGGER  "BI_CODE" 
  before insert on "CODE"               
  for each row  
begin   
  if :NEW."ID_CODE" is null then 
    select "CODE_SEQ".nextval into :NEW."ID_CODE" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CODE" ENABLE;

---
---
---
---
---

CREATE TABLE  "RIGHT_ACCESS" 
   (	"ID_RIGHT_ACCESS" NUMBER NOT NULL ENABLE, 
	"USI_LABEL" VARCHAR2(30), 
	"USI_LEVEL" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "RIGHT_ACCESS_PK" PRIMARY KEY ("ID_RIGHT_ACCESS") ENABLE, 
	 CONSTRAINT "RIGHT_ACCESS_UK1" UNIQUE ("USI_LEVEL") ENABLE
   ) ;


CREATE OR REPLACE TRIGGER  "BI_RIGHT_ACCESS" 
  before insert on "RIGHT_ACCESS"               
  for each row  
begin   
  if :NEW."ID_RIGHT_ACCESS" is null then 
    select "RIGHT_ACCESS_SEQ".nextval into :NEW."ID_RIGHT_ACCESS" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_RIGHT_ACCESS" ENABLE;

---
---
---
---
---

CREATE TABLE  "PLATFORM" 
   (	"ID_PLATFORM" NUMBER, 
	"PLA_LABEL" VARCHAR2(30), 
	 CONSTRAINT "PLATFORM_PK" PRIMARY KEY ("ID_PLATFORM") ENABLE
   ) ;


CREATE OR REPLACE TRIGGER  "BI_PLATFORM" 
  before insert on "PLATFORM"               
  for each row  
begin   
  if :NEW."ID_PLATFORM" is null then 
    select "PLATFORM_SEQ".nextval into :NEW."ID_PLATFORM" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_PLATFORM" ENABLE;


---
---
---
---
---


CREATE TABLE  "GAME" 
   (	"ID_GAME" NUMBER, 
	"GAM_LABEL" VARCHAR2(30), 
	"GAM_DESCRIPTION" CLOB, 
	"FK_ID_PLATFORM" NUMBER, 
	 CONSTRAINT "GAME_PK" PRIMARY KEY ("ID_GAME") ENABLE
   ) ;ALTER TABLE  "GAME" ADD CONSTRAINT "GAME_FK" FOREIGN KEY ("FK_ID_PLATFORM")
	  REFERENCES  "PLATFORM" ("ID_PLATFORM") ENABLE;


CREATE OR REPLACE TRIGGER  "BI_GAME" 
  before insert on "GAME"               
  for each row  
begin   
  if :NEW."ID_GAME" is null then 
    select "GAME_SEQ".nextval into :NEW."ID_GAME" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_GAME" ENABLE;


---
---
---
---
---


CREATE TABLE  "PROMOTION" 
   (	"ID_PROMOTION" NUMBER, 
	"PRO_PERCENTAGE" NUMBER(5,0) NOT NULL ENABLE, 
	"PRO_CODE" VARCHAR2(30) NOT NULL ENABLE, 
	"PRO_START_DATE" TIMESTAMP (6), 
	"PRO_END_DATE" TIMESTAMP (6), 
	 CONSTRAINT "PROMOTION_PK" PRIMARY KEY ("ID_PROMOTION") ENABLE
   ) ;


CREATE OR REPLACE TRIGGER  "BI_PROMOTION" 
  before insert on "PROMOTION"               
  for each row  
begin   
  if :NEW."ID_PROMOTION" is null then 
    select "PROMOTION_SEQ".nextval into :NEW."ID_PROMOTION" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_PROMOTION" ENABLE;




---
---
---
---
---

CREATE TABLE  "UTILISATEUR" 
   (	"ID_UTILISATEUR" NUMBER, 
	"USR_LAST_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"USR_FIRST_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"USR_BIRTH_DATE" DATE NOT NULL ENABLE, 
	"USR_ADDRESS" VARCHAR2(100) NOT NULL ENABLE, 
	"USR_CITY" VARCHAR2(50) NOT NULL ENABLE, 
	"USR_POSTAL_CODE" VARCHAR2(25) NOT NULL ENABLE, 
	"USR_PHONE" VARCHAR2(10) NOT NULL ENABLE, 
	"USR_MAIL" VARCHAR2(100) NOT NULL ENABLE, 
	"FK_ID_COUNTRY" NUMBER NOT NULL ENABLE, 
	"FK_ID_RIGHT_ACCESS" NUMBER NOT NULL ENABLE,
  "USR_PASSWORD" VARCHAR2(50) NOT NULL ENABLE,
	 CONSTRAINT "UTILISATEUR_PK" PRIMARY KEY ("ID_UTILISATEUR") ENABLE, 
	 CONSTRAINT "UTILISATEUR_UK1" UNIQUE ("USR_MAIL") ENABLE
   ) ;ALTER TABLE  "UTILISATEUR" ADD CONSTRAINT "UTILISATEUR_FK" FOREIGN KEY ("FK_ID_RIGHT_ACCESS")
	  REFERENCES  "RIGHT_ACCESS" ("ID_RIGHT_ACCESS") ENABLE;ALTER TABLE  "UTILISATEUR" ADD CONSTRAINT "UTILISATEUR_FK2" FOREIGN KEY ("FK_ID_COUNTRY")
	  REFERENCES  "COUNTRY" ("ID_COUNTRY") ENABLE;


CREATE OR REPLACE TRIGGER  "BI_UTILISATEUR" 
  before insert on "UTILISATEUR"               
  for each row  
begin   
  if :NEW."ID_UTILISATEUR" is null then 
    select "UTILISATEUR_SEQ".nextval into :NEW."ID_UTILISATEUR" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_UTILISATEUR" ENABLE;

---
---
---
---
---


CREATE TABLE  "AUCTION" 
   (  "ID_AUCTION" NUMBER NOT NULL ENABLE, 
  "AUC_QUANTITY" NUMBER NOT NULL ENABLE, 
  "AUC_PRICE" NUMBER NOT NULL ENABLE, 
  "FK_ID_GAME" NUMBER NOT NULL ENABLE, 
  "FK_ID_SELLER" NUMBER NOT NULL ENABLE, 
  "FK_ID_RIGHT_ACCESS" NUMBER NOT NULL ENABLE, 
   CONSTRAINT "AUCTION_PK" PRIMARY KEY ("ID_AUCTION") ENABLE
   ) ;ALTER TABLE  "AUCTION" ADD CONSTRAINT "AUCTION_FK" FOREIGN KEY ("FK_ID_GAME")
    REFERENCES  "GAME" ("ID_GAME") ENABLE;ALTER TABLE  "AUCTION" ADD CONSTRAINT "AUCTION_FK2" FOREIGN KEY ("FK_ID_RIGHT_ACCESS")
    REFERENCES  "RIGHT_ACCESS" ("ID_RIGHT_ACCESS") ENABLE;ALTER TABLE  "AUCTION" ADD CONSTRAINT "AUCTION_FK3" FOREIGN KEY ("FK_ID_SELLER")
    REFERENCES  "UTILISATEUR" ("ID_UTILISATEUR") ENABLE;


CREATE OR REPLACE TRIGGER  "BI_AUCTION" 
  before insert on "AUCTION"               
  for each row  
begin   
  if :NEW."ID_AUCTION" is null then 
    select "AUCTION_SEQ".nextval into :NEW."ID_AUCTION" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_AUCTION" ENABLE;







---
---
---
---
---


CREATE TABLE  "TRANSACT" 
   (	"ID_TRANSACT" NUMBER, 
	"TRN_AMOUNT" NUMBER NOT NULL ENABLE, 
	"TRN_TAX_VALUE" NUMBER NOT NULL ENABLE, 
	"TRN_TOTAL" NUMBER NOT NULL ENABLE, 
	"TRN_DATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"TRN_REFUND_DATE" TIMESTAMP (6), 
	"FK_ID_BUYER" NUMBER NOT NULL ENABLE, 
	"FK_ID_PROMOTION" NUMBER, 
	"FK_ID_COUNTRY" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "TRANSACT_PK" PRIMARY KEY ("ID_TRANSACT") ENABLE
   ) ;ALTER TABLE  "TRANSACT" ADD CONSTRAINT "TRANSACT_FK" FOREIGN KEY ("FK_ID_BUYER")
	  REFERENCES  "UTILISATEUR" ("ID_UTILISATEUR") ENABLE;ALTER TABLE  "TRANSACT" ADD CONSTRAINT "TRANSACT_FK2" FOREIGN KEY ("FK_ID_PROMOTION")
	  REFERENCES  "PROMOTION" ("ID_PROMOTION") ENABLE;ALTER TABLE  "TRANSACT" ADD CONSTRAINT "TRANSACT_FK3" FOREIGN KEY ("FK_ID_COUNTRY")
	  REFERENCES  "COUNTRY" ("ID_COUNTRY") ENABLE;


CREATE OR REPLACE TRIGGER  "BI_TRANSACT" 
  before insert on "TRANSACT"               
  for each row  
begin   
  if :NEW."ID_TRANSACT" is null then 
    select "TRANSACT_SEQ".nextval into :NEW."ID_TRANSACT" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_TRANSACT" ENABLE;



---
---
---
---
---

CREATE TABLE  "AUC_CODE" 
   (  "ID_AUC_CODE" NUMBER, 
  "ACO_SOLD" NUMBER NOT NULL ENABLE, 
  "FK_ID_CODE" NUMBER NOT NULL ENABLE, 
  "FK_ID_AUCTION" NUMBER NOT NULL ENABLE, 
  "FK_ID_TRANSACT" NUMBER NOT NULL ENABLE, 
   CONSTRAINT "AUC_CODE_PK" PRIMARY KEY ("ID_AUC_CODE") ENABLE
   ) ;ALTER TABLE  "AUC_CODE" ADD CONSTRAINT "AUC_CODE_CON" FOREIGN KEY ("FK_ID_TRANSACT")
    REFERENCES  "TRANSACT" ("ID_TRANSACT") ENABLE;ALTER TABLE  "AUC_CODE" ADD CONSTRAINT "AUC_CODE_FK" FOREIGN KEY ("FK_ID_CODE")
    REFERENCES  "CODE" ("ID_CODE") ENABLE;ALTER TABLE  "AUC_CODE" ADD CONSTRAINT "AUC_CODE_FK2" FOREIGN KEY ("FK_ID_AUCTION")
    REFERENCES  "AUCTION" ("ID_AUCTION") ENABLE;


CREATE OR REPLACE TRIGGER  "BI_AUC_CODE" 
  before insert on "AUC_CODE"               
  for each row  
begin   
  if :NEW."ID_AUC_CODE" is null then 
    select "AUC_CODE_SEQ".nextval into :NEW."ID_AUC_CODE" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_AUC_CODE" ENABLE;


