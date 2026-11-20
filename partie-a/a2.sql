CREATE INDEX idx_cmd_statut_date ON commandes (statut, date_commande);

-- statut (filtre d'égalité) en colonne de tête, puis date_commande (filtre de plage),
-- conformément à la règle du préfixe gauche.

EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE date_commande >= '2026-01-01'
  AND date_commande <  '2027-01-01'
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Partitionnement RANGE activé (2024 · 2025 · 2026), puis requête relancée :
EXPLAIN ANALYZE
SELECT id, client_id, date_commande, montant_total
FROM commandes
WHERE date_commande >= '2026-01-01'
  AND date_commande <  '2027-01-01'
  AND statut = 'LIVREE'
ORDER BY montant_total DESC
LIMIT 10;

-- Coût total : 74.16 (avant) -> 16.95 (index) -> 14.73 (partitionnement)
-- Partition Pruning : seule la partition commandes_2026 est scannée (1/3),
-- 2024 et 2025 sont ignorées avant même la lecture.