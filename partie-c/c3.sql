-- Q9 - Architecture polyglotte

-- CAP : en cas de coupure (P), on choisit cohérence (C) ou disponibilité (A).
-- PACELC : sinon (E), on choisit latence (L) ou cohérence (C).

-- GPS des véhicules -> Cassandra (PA/EL)
-- Retard de position acceptable, très gros volume d'écritures en continu,
-- séries temporelles, besoin de scaler horizontalement.

-- Facturation -> PostgreSQL (PC/EC)
-- Aucune erreur possible (ACID), données structurées, requêtes avec jointures,
-- volume modéré.

-- Amis communs à 3 degrés -> Neo4j (graphe)
-- Décalage acceptable, peu d'écritures, données en réseau,
-- parcours sur 3 niveaux trop coûteux en SQL.

-- Chaque besoin a sa base : PostgreSQL pour l'argent, Cassandra pour le GPS,
-- Neo4j pour les recommandations.