INSERT INTO categorie_materiel (id, libelle, description) VALUES
(nextval('sequence_generator'), 'Ordinateur de bureau', 'Postes fixes utilisés dans les bureaux'),
(nextval('sequence_generator'), 'Ordinateur portable', 'Laptops pour agents mobiles ou cadres'),
(nextval('sequence_generator'), 'Imprimante', 'Imprimantes et multifonctions'),
(nextval('sequence_generator'), 'Serveur', 'Serveurs physiques de la Direction Informatique'),
(nextval('sequence_generator'), 'Onduleur', 'Dispositifs de protection électrique (UPS)'),
(nextval('sequence_generator'), 'Scanner', 'Scanners de documents'),
(nextval('sequence_generator'), 'Vidéoprojecteur', 'Matériel pour salles de réunion'),
(nextval('sequence_generator'), 'Équipement réseau', 'Switches, routeurs, points d''accès Wi-Fi'),
(nextval('sequence_generator'), 'Téléphone IP', 'Postes téléphoniques VoIP'),
(nextval('sequence_generator'), 'Photocopieur', 'Copieurs multifonctions'),
(nextval('sequence_generator'), 'Écran', 'Moniteurs additionnels');

/*
Get-Content "C:\Users\Kafando\Desktop\gestion-actifs-dgi\seed-categories.sql" | docker exec -i gestionactifsdgi-postgresql-1 psql -U gestionActifsDgi -d gestionActifsDgi
*/ 