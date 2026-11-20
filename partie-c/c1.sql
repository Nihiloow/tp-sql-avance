SELECT id, nom FROM employes
WHERE id NOT IN (SELECT manager_id FROM employes);

-- La CTO a manager_id = NULL. En logique ternaire, id != NULL vaut UNKNOWN,
-- donc la requête renvoie 0 ligne.

SELECT e.id, e.nom
FROM employes e
WHERE NOT EXISTS (
    SELECT 1 FROM employes s WHERE s.manager_id = e.id
);