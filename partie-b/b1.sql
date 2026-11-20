-- Dépendances fonctionnelles :
-- employe_id  -> employe_nom, dept_nom
-- projet      -> chef_projet
-- chef_projet -> chef_projet_tel

-- 1FN : projets_liste contient plusieurs valeurs => table de liaison affectations.
-- 2FN : employe_nom et dept_nom dépendent seulement de employe_id => table employes.
-- 3FN : projet -> chef_projet -> chef_projet_tel est transitive => table chefs_projet.

CREATE TABLE departements (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE employes_3fn (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    departement_id INT NOT NULL REFERENCES departements(id)
);

CREATE TABLE chefs_projet (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)
);

CREATE TABLE projets (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    chef_projet_id INT NOT NULL REFERENCES chefs_projet(id)
);

CREATE TABLE affectations (
    employe_id INT REFERENCES employes_3fn(id),
    projet_id INT REFERENCES projets(id),
    PRIMARY KEY (employe_id, projet_id)
);