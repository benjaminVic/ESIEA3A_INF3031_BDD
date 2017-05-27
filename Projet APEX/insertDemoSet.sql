INSERT INTO COUNTRY (COU_LABEL, COU_PHONE_EXTENSION, COU_TAX_RATE) VALUES ('BELGIQUE', 32, 0.21);
INSERT INTO COUNTRY (COU_LABEL, COU_PHONE_EXTENSION, COU_TAX_RATE) VALUES ('FRANCE', 33, 0.2);
INSERT INTO COUNTRY (COU_LABEL, COU_PHONE_EXTENSION, COU_TAX_RATE) VALUES ('AUTRICHE', 43, 0.2);

INSERT INTO RIGHT_ACCESS (USI_LABEL,USI_LEVEL) VALUES ('ADMINISTRATEUR', 1);
INSERT INTO RIGHT_ACCESS (USI_LABEL,USI_LEVEL) VALUES ('VENDEUR', 2);
INSERT INTO RIGHT_ACCESS (USI_LABEL,USI_LEVEL) VALUES ('ACHETEUR', 3);

INSERT INTO PLATFORM (PLA_LABEL) VALUES ('STEAM');
INSERT INTO PLATFORM (PLA_LABEL) VALUES ('ORIGIN');
INSERT INTO PLATFORM (PLA_LABEL) VALUES ('PLAY STORE');

INSERT INTO UTILISATEUR (USR_LAST_NAME, USR_FIRST_NAME, USR_BIRTH_DATE, USR_ADDRESS, USR_CITY, USR_POSTAL_CODE, USR_PHONE, USR_MAIL, FK_ID_COUNTRY, FK_ID_RIGHT_ACCESS, USR_PASSWORD) VALUES ('VIC','BENJAMIN','07/03/1995','16 rue Rollin', 'Paris', '75005','0700000000', 'vic@et.esiea.fr','1','3','admin');
INSERT INTO UTILISATEUR (USR_LAST_NAME, USR_FIRST_NAME, USR_BIRTH_DATE, USR_ADDRESS, USR_CITY, USR_POSTAL_CODE, USR_PHONE, USR_MAIL, FK_ID_COUNTRY, FK_ID_RIGHT_ACCESS, USR_PASSWORD) VALUES ('GABEN','GABEN','08/05/1945','1 Volvo Street', 'Vulvo', '00000','Nope.img', 'gaben@valve.com','1','2','demo');
INSERT INTO UTILISATEUR (USR_LAST_NAME, USR_FIRST_NAME, USR_BIRTH_DATE, USR_ADDRESS, USR_CITY, USR_POSTAL_CODE, USR_PHONE, USR_MAIL, FK_ID_COUNTRY, FK_ID_RIGHT_ACCESS, USR_PASSWORD) VALUES ('FUEGO','EN LA CABANA','05/09/1949','84 chaussée d Alzemberg', 'Liege', '12005','0600000000', 'communication@et.esiea.fr','','1','demo');

INSERT INTO GAME (GAM_LABEL, GAM_DESCRIPTION, FK_ID_PLATFORM) VALUES ('Battlefield 1','FPS reprenant le contexte de la première Guerre Mondiale',2);
INSERT INTO GAME (GAM_LABEL, GAM_DESCRIPTION, FK_ID_PLATFORM) VALUES ('Dota2','Apprentissage de la langue russe pour  les joueurs en Ouest-Europe',1);
INSERT INTO GAME (GAM_LABEL, GAM_DESCRIPTION, FK_ID_PLATFORM) VALUES ('Nier Automata','Le plus beau BeatThemAll de 2017',1);
INSERT INTO GAME (GAM_LABEL, GAM_DESCRIPTION, FK_ID_PLATFORM) VALUES ('TERRA_BATTLE','Un jeu de stratégie basé sur  le déplacement de tuiles de vos personnages, le tout au bout  de vos doight',3);

INSERT INTO AUCTION (AUC_QUANTITY,AUC_PRICE,FK_ID_GAME,FK_ID_SELLER,FK_ID_RIGHT_ACCESS) VALUES (4, 50, 1, 1, 3);
INSERT INTO AUCTION (AUC_QUANTITY,AUC_PRICE,FK_ID_GAME,FK_ID_SELLER,FK_ID_RIGHT_ACCESS) VALUES (2, 0, 3, 2, 2);
INSERT INTO AUCTION (AUC_QUANTITY,AUC_PRICE,FK_ID_GAME,FK_ID_SELLER,FK_ID_RIGHT_ACCESS) VALUES (2, 35, 2, 2, 2);
INSERT INTO AUCTION (AUC_QUANTITY,AUC_PRICE,FK_ID_GAME,FK_ID_SELLER,FK_ID_RIGHT_ACCESS) VALUES (1, 2, 4, 2, 3);


INSERT INTO PROMOTION (PRO_PERCENTAGE,PRO_CODE,PRO_START_DATE,PRO_END_DATE) VALUES (0.3,'SALESSUMMER2017', TIMESTAMP'2017-06-21 00:00:00',TIMESTAMP'2017-09-21 00:00:00');
INSERT INTO PROMOTION (PRO_PERCENTAGE,PRO_CODE,PRO_START_DATE,PRO_END_DATE) VALUES (0.09,'FIRST_DEMO', TIMESTAMP'2017-06-01 00:00:00', TIMESTAMP'2017-07-05 00:00:00');
INSERT INTO PROMOTION (PRO_PERCENTAGE,PRO_CODE,PRO_START_DATE,PRO_END_DATE) VALUES (0.99,'YOU_CHEATER_THAT_IS_MEAN', TIMESTAMP'2016-09-05 00:00:00', TIMESTAMP'2019-08-30 00:00:00');

INSERT INTO CODE (COD_VALUE) VALUES ('84D464DF4EFEFHJDS9');
INSERT INTO CODE (COD_VALUE) VALUES ('FSDF4FZEFZEFETV4R4');
INSERT INTO CODE (COD_VALUE) VALUES ('DOJSDPGSDV7ERGV7ER');
INSERT INTO CODE (COD_VALUE) VALUES ('FDG4DF8V4SFDV5V4F8');
INSERT INTO CODE (COD_VALUE) VALUES ('78FRF48FGRVDSCE8TG');
INSERT INTO CODE (COD_VALUE) VALUES ('G8ERF4D5GD4FEF4R5F');
INSERT INTO CODE (COD_VALUE) VALUES ('A7EJO77B4LPML4OK7N');
INSERT INTO CODE (COD_VALUE) VALUES ('CV5C5QSC4ZEF4DFVRT');
INSERT INTO CODE (COD_VALUE) VALUES ('HKCDLBJXNFV4G7458N');

INSERT INTO TRANSACT (FK_ID_BUYER, FK_ID_COUNTRY) VALUES (1, 1);
INSERT INTO TRANSACT (TRN_AMOUNT, TRN_TAX_VALUE, TRN_TOTAL, TRN_DATE, TRN_REFUND_DATE, FK_ID_BUYER, FK_ID_COUNTRY) VALUES (40, 10, 50, TIMESTAMP'2017-05-27 00:00:00',TIMESTAMP'2017-05-27 00:00:00', 1, 1);
INSERT INTO TRANSACT (TRN_AMOUNT, TRN_TAX_VALUE, TRN_TOTAL, TRN_DATE, FK_ID_BUYER, FK_ID_COUNTRY) VALUES (30, 7, 37, TIMESTAMP'2017-05-28 00:00:00', 1, 1);

INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 1, 1, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 2, 1, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 3, 1, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 4, 1, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 5, 2, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 6, 2, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (1, 7, 3, 3);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 8, 3, null);
INSERT INTO AUC_CODE (ACO_SOLD, FK_ID_CODE, FK_ID_AUCTION, FK_ID_TRANSACT) VALUES (0, 9, 4, null);