-- READ COMMITTED :
-- Session A : SELECT solde FROM comptes_bancaires WHERE id = 1; -> 15 000 €
-- Session B : UPDATE comptes_bancaires SET solde = 14000 WHERE id = 1; COMMIT;
-- Session A : même SELECT -> 14 000 € => Non-Repeatable Read

-- REPEATABLE READ :
-- Session A : SELECT -> 15 000 €
-- Session B : UPDATE ... COMMIT;

-- READ COMMITTED est calculé à chaque instruction : le 2ème select voit le changement de la deuxième requête ce qui change la valeur.
-- REPEATABLE READ résout ce problème en conservant les valeurs du début de la requête. Permet de garder la même valeur pour les deux select.

-- WAL permet d'annuler les écritures non validées en cas de coupure en plein virement.
