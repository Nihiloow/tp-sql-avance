EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE YEAR(date_commande) = 2026
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Défauts: 
-- year impose à la commande de faire un seq scan et annule tout effet des indexes car c'est non sargable.
-- Pas d'index pour avoir les commandes déjà triées. Les lignes filtrées sont triées en mémoire pour n’en garder que 10 ce qui fait perdre de la mémoire inutilement.