
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
SELECT gam.GAM_LABEL, tmp.AUC_PRICE, pla.PLA_LABEL
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
join (
    SELECT MIN(AUC_PRICE), gam2.ID_GAME, auc2.AUC_PRICE
    FROM auction auc2
    join game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    join AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    WHERE aco2.ACO_SOLD = 0 
    group by gam2.ID_GAME, auc2.AUC_PRICE
) tmp on tmp.ID_GAME = gam.ID_GAME
order by gam.GAM_LABEL;

--DONEDONE
--COMPTE LE NOMBRE DE JEUX VENDU ET NON VENDU
SELECT gam.GAM_LABEL, tmp.NB_NONVENDU, tmp.NB_VENDU, pla.PLA_LABEL
FROM GAME gam
JOIN PLATFORM pla ON gam.FK_ID_PLATFORM = pla.ID_PLATFORM
join (
    SELECT SUM(case when aco2.ACO_SOLD = 0 then 1 else 0 END) as NB_NONVENDU, 
           SUM(case when aco2.ACO_SOLD = 1 then 1 else 0 END) as NB_VENDU, 
           gam2.ID_GAME
    FROM auction auc2
    join game gam2 on auc2.FK_ID_GAME = gam2.ID_GAME
    join AUC_CODE aco2 on aco2.FK_ID_AUCTION = auc2.ID_AUCTION
    group by gam2.ID_GAME
) tmp on tmp.ID_GAME = gam.ID_GAME
order by gam.GAM_LABEL;