CREATE MATERIALIZED VIEW mv_synthese_segments AS
SELECT c.segment,
       COUNT(cmd.id) AS nb_commandes,
       ROUND(SUM(cmd.montant_total), 2) AS ca_total
FROM commandes cmd
JOIN clients c ON c.id = cmd.client_id
GROUP BY c.segment;

SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments ORDER BY ca_total DESC;

INSERT INTO commandes (client_id, date_commande, statut, montant_total)
VALUES (1, '2026-11-20', 'LIVREE', 5000.00);

-- Vue obsolète (stale) : les chiffres n'ont pas changé, la vue est figée au dernier REFRESH.
SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments ORDER BY ca_total DESC;

REFRESH MATERIALIZED VIEW mv_synthese_segments;

SELECT segment, nb_commandes, ca_total FROM mv_synthese_segments ORDER BY ca_total DESC;