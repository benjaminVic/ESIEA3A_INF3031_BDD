
--TODO COMPLETE
CREATE OR REPLACE FUNCTION UTILISATEUR_CREATE(
     i_usr_last_name UTILISATEUR.USR_LAST_NAME%type,
     i_usr_first_name UTILISATEUR.USR_FIRST_NAME%type,
     i_usr_birth_date UTILISATEUR.USR_BIRTH_DATE%type,
     i_usr_address UTILISATEUR.USR_ADDRESS%type,
     i_usr_city UTILISATEUR.USR_CITY%type,
     i_usr_postal_code UTILISATEUR.USR_POSTAL_CODE%type,
     i_usr_phone UTILISATEUR.USR_PHONE%type,
     i_usr_mail UTILISATEUR.USR_LAIL%type,
)
	return varchar2 as
Begin
INSERT INTO UTILISATEUR values
End



--DONEDONE
--NB DE CLE A VENDRE PAR JEU ET A QUEL PRIX MINI PAR JEU
SELECT gam.GAM_LABEL as "Jeux", tmp.AUC_PRICE as "Prix", pla.PLA_LABEL as "Plateformes"
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
JOIN (
    SELECT MIN(AUC_PRICE), gam2.ID_GAME, auc2.AUC_PRICE
    FROM auction auc2
    JOIN game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    JOIN AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    WHERE aco2.ACO_SOLD = 0 
    group by gam2.ID_GAME, auc2.AUC_PRICE
) tmp on tmp.ID_GAME = gam.ID_GAME
order by gam.GAM_LABEL;

--DONEDONE
--STATS GLOBALE : COMPTE LE NOMBRE DE JEUX VENDU ET NON VENDU
SELECT gam.GAM_LABEL as "Jeux", tmp.NB_NONVENDU as "Nombre de jeux invendus", tmp.NB_VENDU as "Nombre de jeux vendus", pla.PLA_LABEL as "Platformes"
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
JOIN (
    SELECT SUM(case when aco2.ACO_SOLD = 0 then 1 else 0 END) as NB_NONVENDU, 
           SUM(case when aco2.ACO_SOLD = 1 then 1 else 0 END) as NB_VENDU, 
           gam2.ID_GAME
    FROM auction auc2
    JOIN game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    JOIN AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    group by gam2.ID_GAME
) tmp on tmp.ID_GAME = gam.ID_GAME
order by gam.GAM_LABEL;


--DONEDONE
--STATS PAR VENDEUR : SE PASER SUR PAGE PRECEDENTE POUR AVOIR STATISTIQUE VENTE PAR PERSONNE
SELECT gam.GAM_LABEL as "Jeux", tmp.NB_NONVENDU as "Nombre de jeux invendus", tmp.NB_VENDU as "Nombre de jeux vendus", pla.PLA_LABEL as "Platformes", tmp.USR_LAST_NAME as "Vendeur - Nom"
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
JOIN (
    SELECT SUM(case when aco2.ACO_SOLD = 0 then 1 else 0 END) as NB_NONVENDU, 
           SUM(case when aco2.ACO_SOLD = 1 then 1 else 0 END) as NB_VENDU, 
           gam2.ID_GAME,
           seller2.USR_LAST_NAME
    FROM auction auc2
    JOIN game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    JOIN AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    JOIN UTILISATEUR seller2 on seller2.ID_UTILISATEUR = auc2.FK_ID_SELLER
    group by gam2.ID_GAME,seller2.USR_LAST_NAME
) tmp on tmp.ID_GAME = gam.ID_GAME
order by tmp.NB_VENDU;

--DONEDONE
--Stats de remboursement de clef par jeu et par personne
SELECT tmp.USR_LAST_NAME as "Vendeur - nom", tmp.NOMBRE_REMBOURSEMENT as "Nombre de remboursement", gam.GAM_LABEL as "Jeux", pla.PLA_LABEL as "Plateformes"
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
JOIN (
    SELECT count(tra2.TRN_REFUND_DATE) as NOMBRE_REMBOURSEMENT, gam2.ID_GAME, seller2.USR_LAST_NAME
    FROM auction auc2
    JOIN game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    JOIN AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    JOIN TRANSACT tra2 on aco2.FK_ID_TRANSACT = tra2.ID_TRANSACT
    JOIN UTILISATEUR seller2 on seller2.ID_UTILISATEUR = auc2.FK_ID_SELLER
    WHERE aco2.ACO_SOLD = 1
    AND tra2.TRN_REFUND_DATE is not null
    group by gam2.ID_GAME, seller2.USR_LAST_NAME
) tmp on tmp.ID_GAME = gam.ID_GAME
order by tmp.NOMBRE_REMBOURSEMENT;

--DONEDONE
--STATS ACHAT ACHETEUR : nom/mail
SELECT USR.USR_LAST_NAME as "Acheteur - nom", sum(TRN.TRN_TOTAL) as "Depense totale", avg(TRN.TRN_TOTAL) as "Depense moyenne", USR.USR_MAIL as "Acheteur - mail"
FROM UTILISATEUR USR
JOIN TRANSACT TRN on TRN.FK_ID_BUYER = USR.ID_UTILISATEUR
WHERE TRN_REFUND_DATE is null
AND TRN_DATE is not null
GROUP BY USR.USR_LAST_NAME, USR.USR_MAIL;

--DONEDONE
--Stats de taxes à payer par etat
SELECT COU.COU_LABEL as "Pays", SUM(TRN.TRN_TAX_VALUE) as "Taxes dûes"
FROM COUNTRY COU
JOIN TRANSACT TRN on TRN.FK_ID_COUNTRY = COU.ID_COUNTRY
WHERE TRN.TRN_REFUND_DATE is null
GROUP BY COU.COU_LABEL;