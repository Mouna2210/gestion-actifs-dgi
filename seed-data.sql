-- Donnees de demonstration pour les pages metier de l'application.
-- A executer apres clean-data.sql et seed-categories.sql.
-- Les tables d'authentification restent intactes; l'utilisateur admin est reutilise.

-- Services et agents
INSERT INTO service_dgi (id, nom_service, chef_service) VALUES
(nextval('sequence_generator'), 'Direction des systemes d''information', 'Mamadou Traore'),
(nextval('sequence_generator'), 'Direction des ressources humaines', 'Aminata Diallo'),
(nextval('sequence_generator'), 'Direction des finances', 'Ousmane Kone'),
(nextval('sequence_generator'), 'Direction des affaires juridiques', 'Fatoumata Toure'),
(nextval('sequence_generator'), 'Direction du patrimoine', 'Ibrahim Coulibaly');

INSERT INTO agent (id, nom, prenom, service_id, utilisateur_id) VALUES
(nextval('sequence_generator'), 'Traore', 'Mamadou', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des systemes d''information' LIMIT 1), NULL),
(nextval('sequence_generator'), 'Diallo', 'Aminata', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des ressources humaines' LIMIT 1), NULL),
(nextval('sequence_generator'), 'Kone', 'Ousmane', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des finances' LIMIT 1), NULL),
(nextval('sequence_generator'), 'Toure', 'Fatoumata', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des affaires juridiques' LIMIT 1), NULL),
(nextval('sequence_generator'), 'Coulibaly', 'Ibrahim', (SELECT id FROM service_dgi WHERE nom_service = 'Direction du patrimoine' LIMIT 1), NULL);

-- Fournisseurs
INSERT INTO fournisseur (id, nom, contact, email, telephone) VALUES
(nextval('sequence_generator'), 'DigiTech Afrique', 'Awa Sissoko', 'contact@digitech.example', '+225 27 20 10 10 10'),
(nextval('sequence_generator'), 'Buro Services', 'Jean Kouame', 'ventes@buroservices.example', '+225 27 21 20 30 40'),
(nextval('sequence_generator'), 'Reseaux et Solutions', 'Mariam Yao', 'support@rs.example', '+225 07 08 09 10 11'),
(nextval('sequence_generator'), 'Maintenance Plus', 'Serge N''Guessan', 'contact@maintenanceplus.example', '+225 05 06 07 08 09');

-- Parc d'actifs
INSERT INTO actif (
    id, code_inventaire, designation, marque, modele, numero_serie, code_barre,
    type, etat, localisation, date_acquisition, valeur_acquisition, categorie_id
) VALUES
(nextval('sequence_generator'), 'DGI-INFO-0001', 'Poste de travail comptabilite', 'Dell', 'OptiPlex 7010', 'SN-DGI-0001', 'BC-DGI-0001', 'POSTE_TRAVAIL', 'EN_SERVICE', 'Bureau finances - 2e etage', DATE '2024-02-12', 650000, (SELECT id FROM categorie_materiel WHERE libelle = 'Ordinateur de bureau' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0002', 'Ordinateur portable direction', 'HP', 'ProBook 450 G10', 'SN-DGI-0002', 'BC-DGI-0002', 'POSTE_TRAVAIL', 'EN_SERVICE', 'Bureau direction', DATE '2024-03-04', 720000, (SELECT id FROM categorie_materiel WHERE libelle = 'Ordinateur portable' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0003', 'Imprimante ressources humaines', 'Canon', 'i-SENSYS MF445dw', 'SN-DGI-0003', 'BC-DGI-0003', 'IMPRIMANTE', 'EN_SERVICE', 'Salle reprographie RH', DATE '2023-11-20', 385000, (SELECT id FROM categorie_materiel WHERE libelle = 'Imprimante' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0004', 'Serveur applicatif principal', 'HPE', 'ProLiant DL380 Gen10', 'SN-DGI-0004', 'BC-DGI-0004', 'SERVEUR', 'EN_SERVICE', 'Salle serveurs', DATE '2023-06-15', 5800000, (SELECT id FROM categorie_materiel WHERE libelle = 'Serveur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0005', 'Commutateur coeur de reseau', 'Cisco', 'Catalyst 9200', 'SN-DGI-0005', 'BC-DGI-0005', 'RESEAU', 'EN_SERVICE', 'Salle serveurs', DATE '2024-01-10', 2100000, (SELECT id FROM categorie_materiel WHERE libelle = 'Équipement réseau' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0006', 'Onduleur salle informatique', 'APC', 'Smart-UPS 1500', 'SN-DGI-0006', 'BC-DGI-0006', 'PERIPHERIQUE', 'EN_MAINTENANCE', 'Salle serveurs', DATE '2022-09-08', 490000, (SELECT id FROM categorie_materiel WHERE libelle = 'Onduleur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0007', 'Scanner courrier entrant', 'Epson', 'WorkForce DS-790WN', 'SN-DGI-0007', 'BC-DGI-0007', 'PERIPHERIQUE', 'EN_SERVICE', 'Accueil courrier', DATE '2024-04-02', 310000, (SELECT id FROM categorie_materiel WHERE libelle = 'Scanner' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0008', 'Videoprojecteur salle de reunion', 'Epson', 'EB-FH52', 'SN-DGI-0008', 'BC-DGI-0008', 'PERIPHERIQUE', 'EN_SERVICE', 'Salle de reunion A', DATE '2023-08-17', 560000, (SELECT id FROM categorie_materiel WHERE libelle = 'Vidéoprojecteur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0009', 'Telephone IP accueil', 'Yealink', 'T46U', 'SN-DGI-0009', 'BC-DGI-0009', 'PERIPHERIQUE', 'EN_SERVICE', 'Accueil principal', DATE '2024-05-06', 95000, (SELECT id FROM categorie_materiel WHERE libelle = 'Téléphone IP' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0010', 'Ecran de controle reseau', 'Samsung', 'S24C450', 'SN-DGI-0010', 'BC-DGI-0010', 'PERIPHERIQUE', 'REFORME', 'Stock informatique', DATE '2018-07-22', 135000, (SELECT id FROM categorie_materiel WHERE libelle = 'Écran' LIMIT 1));

INSERT INTO actif (
    id, code_inventaire, designation, marque, modele, numero_serie, code_barre,
    type, etat, localisation, date_acquisition, valeur_acquisition, categorie_id
) VALUES
(nextval('sequence_generator'), 'DGI-INFO-0011', 'Poste de travail accueil', 'Lenovo', 'ThinkCentre M80s', 'SN-DGI-0011', 'BC-DGI-0011', 'POSTE_TRAVAIL', 'EN_SERVICE', 'Accueil principal', DATE '2024-06-03', 590000, (SELECT id FROM categorie_materiel WHERE libelle = 'Ordinateur de bureau' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0012', 'Portable equipe informatique', 'Dell', 'Latitude 5440', 'SN-DGI-0012', 'BC-DGI-0012', 'POSTE_TRAVAIL', 'EN_SERVICE', 'Direction des systemes d''information', DATE '2024-07-12', 810000, (SELECT id FROM categorie_materiel WHERE libelle = 'Ordinateur portable' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0013', 'Imprimante direction des finances', 'Brother', 'MFC-L8690CDW', 'SN-DGI-0013', 'BC-DGI-0013', 'IMPRIMANTE', 'EN_SERVICE', 'Direction des finances', DATE '2023-09-19', 425000, (SELECT id FROM categorie_materiel WHERE libelle = 'Imprimante' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0014', 'Serveur de sauvegarde', 'Dell', 'PowerEdge R550', 'SN-DGI-0014', 'BC-DGI-0014', 'SERVEUR', 'EN_SERVICE', 'Salle serveurs', DATE '2024-02-20', 4900000, (SELECT id FROM categorie_materiel WHERE libelle = 'Serveur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0015', 'Commutateur etage administratif', 'Cisco', 'Catalyst 9200L', 'SN-DGI-0015', 'BC-DGI-0015', 'RESEAU', 'EN_SERVICE', 'Baie reseau - 1er etage', DATE '2024-03-18', 1750000, (SELECT id FROM categorie_materiel WHERE libelle = chr(201) || 'quipement r' || chr(233) || 'seau' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0016', 'Onduleur bureau direction', 'Eaton', '5PX 1500i', 'SN-DGI-0016', 'BC-DGI-0016', 'PERIPHERIQUE', 'EN_SERVICE', 'Bureau direction', DATE '2023-12-05', 520000, (SELECT id FROM categorie_materiel WHERE libelle = 'Onduleur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0017', 'Scanner dossiers fiscaux', 'Fujitsu', 'fi-8170', 'SN-DGI-0017', 'BC-DGI-0017', 'PERIPHERIQUE', 'EN_SERVICE', 'Archives fiscales', DATE '2024-08-21', 345000, (SELECT id FROM categorie_materiel WHERE libelle = 'Scanner' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0018', 'Photocopieur reprographie', 'Ricoh', 'IM C3000', 'SN-DGI-0018', 'BC-DGI-0018', 'IMPRIMANTE', 'EN_MAINTENANCE', 'Service reprographie', DATE '2023-05-16', 1850000, (SELECT id FROM categorie_materiel WHERE libelle = 'Photocopieur' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0019', 'Ecran salle de supervision', 'LG', '24BK550Y', 'SN-DGI-0019', 'BC-DGI-0019', 'PERIPHERIQUE', 'EN_SERVICE', 'Salle de supervision', DATE '2024-09-09', 165000, (SELECT id FROM categorie_materiel WHERE libelle = chr(201) || 'cran' LIMIT 1)),
(nextval('sequence_generator'), 'DGI-INFO-0020', 'Telephone IP service juridique', 'Yealink', 'T43U', 'SN-DGI-0020', 'BC-DGI-0020', 'PERIPHERIQUE', 'EN_SERVICE', 'Direction des affaires juridiques', DATE '2024-10-14', 88000, (SELECT id FROM categorie_materiel WHERE libelle = 'T' || chr(233) || 'l' || chr(233) || 'phone IP' LIMIT 1));

-- Affectations et actifs affectes
INSERT INTO affectation (id, date_affectation, motif, date_restitution, agent_id) VALUES
(nextval('sequence_generator'), DATE '2025-01-15', 'Dotation de poste pour le suivi comptable', NULL, (SELECT id FROM agent WHERE nom = 'Kone' AND prenom = 'Ousmane' LIMIT 1)),
(nextval('sequence_generator'), DATE '2025-02-03', 'Equipement de la direction', NULL, (SELECT id FROM agent WHERE nom = 'Traore' AND prenom = 'Mamadou' LIMIT 1)),
(nextval('sequence_generator'), DATE '2024-11-18', 'Fin de mission, materiel restitue', DATE '2025-03-01', (SELECT id FROM agent WHERE nom = 'Diallo' AND prenom = 'Aminata' LIMIT 1));

INSERT INTO affectation_actif (id, observation, statut, affectation_id, actif_id) VALUES
(nextval('sequence_generator'), 'Materiel remis avec chargeur et clavier', 'ACTIVE', (SELECT id FROM affectation WHERE motif = 'Dotation de poste pour le suivi comptable' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0001')),
(nextval('sequence_generator'), 'Materiel remis en bon etat', 'ACTIVE', (SELECT id FROM affectation WHERE motif = 'Equipement de la direction' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0002')),
(nextval('sequence_generator'), 'Restitution verifiee par le service informatique', 'CLOTUREE', (SELECT id FROM affectation WHERE motif = 'Fin de mission, materiel restitue' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0007'));

-- Transferts et actifs transferes
INSERT INTO transfert (id, date_transfert, statut, commentaire_rejet, date_traitement, service_origine_id, service_destinataire_id, demandeur_id, validateur_id) VALUES
(nextval('sequence_generator'), DATE '2025-03-10', 'VALIDE', NULL, DATE '2025-03-11', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des finances' LIMIT 1), (SELECT id FROM service_dgi WHERE nom_service = 'Direction des ressources humaines' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), DATE '2025-04-02', 'EN_ATTENTE', NULL, NULL, (SELECT id FROM service_dgi WHERE nom_service = 'Direction des systemes d''information' LIMIT 1), (SELECT id FROM service_dgi WHERE nom_service = 'Direction du patrimoine' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1), NULL),
(nextval('sequence_generator'), DATE '2025-02-20', 'REJETE', 'Equipement requis pour les operations de maintenance', DATE '2025-02-21', (SELECT id FROM service_dgi WHERE nom_service = 'Direction des affaires juridiques' LIMIT 1), (SELECT id FROM service_dgi WHERE nom_service = 'Direction des finances' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1));

INSERT INTO transfert_actif (id, observation, transfert_id, actif_id) VALUES
(nextval('sequence_generator'), 'Transfert accompagne du chargeur', (SELECT id FROM transfert WHERE date_transfert = DATE '2025-03-10'), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0001')),
(nextval('sequence_generator'), 'Demande de transfert en attente de validation', (SELECT id FROM transfert WHERE date_transfert = DATE '2025-04-02'), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0008')),
(nextval('sequence_generator'), 'Demande rejetee, actif conserve dans son service', (SELECT id FROM transfert WHERE date_transfert = DATE '2025-02-20'), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0003'));

-- Bordereaux relies aux affectations ou transferts
INSERT INTO bordereau (id, numero, date_emission, type_bordereau, statut_validation, date_validation, transfert_id, affectation_id, emetteur_id) VALUES
(nextval('sequence_generator'), 'BR-AFF-2025-001', DATE '2025-01-15', 'AFFECTATION', 'VALIDE', DATE '2025-01-15', NULL, (SELECT id FROM affectation WHERE motif = 'Dotation de poste pour le suivi comptable' LIMIT 1), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), 'BR-TRF-2025-001', DATE '2025-03-10', 'TRANSFERT', 'VALIDE', DATE '2025-03-11', (SELECT id FROM transfert WHERE date_transfert = DATE '2025-03-10' LIMIT 1), NULL, (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), 'BR-TRF-2025-002', DATE '2025-04-02', 'TRANSFERT', 'EN_ATTENTE', NULL, (SELECT id FROM transfert WHERE date_transfert = DATE '2025-04-02' LIMIT 1), NULL, (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1));

-- Maintenances, pannes et interventions
INSERT INTO maintenance (id, type_maintenance, date_panne, statut, compte_rendu, date_cloture, actif_id, technicien_id) VALUES
(nextval('sequence_generator'), 'PREVENTIVE', DATE '2025-01-20', 'CLOTUREE', 'Nettoyage interne, controle des ventilateurs et mise a jour du systeme.', DATE '2025-01-20', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0004'), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), 'CORRECTIVE', DATE '2025-03-05', 'EN_COURS', 'Diagnostic de la batterie et verification du circuit de charge.', NULL, (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0006'), (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), 'PREVENTIVE', DATE '2025-02-12', 'OUVERTE', 'Controle periodique du commutateur et des ports reseau.', NULL, (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0005'), NULL);

INSERT INTO panne (id, description, date_declaration, statut_panne, actif_id) VALUES
(nextval('sequence_generator'), 'Batterie de l''onduleur avec une autonomie inferieure au seuil requis', DATE '2025-03-05', 'EN_COURS', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0006')),
(nextval('sequence_generator'), 'Bourrage papier recurrent dans le bac principal', DATE '2025-02-14', 'RESOLUE', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0003')),
(nextval('sequence_generator'), 'Perte intermittente de liaison sur un port utilisateur', DATE '2025-04-07', 'SIGNALEE', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0005'));

INSERT INTO intervention (id, date_declaration, type_intervention, statut, description, panne_id) VALUES
(nextval('sequence_generator'), DATE '2025-03-05', 'CORRECTIVE', 'EN_COURS', 'Remplacement de la batterie et test en charge.', (SELECT id FROM panne WHERE description LIKE 'Batterie de l''onduleur%' LIMIT 1)),
(nextval('sequence_generator'), DATE '2025-02-14', 'CORRECTIVE', 'CLOTUREE', 'Nettoyage du chemin papier et remplacement des rouleaux.', (SELECT id FROM panne WHERE description LIKE 'Bourrage papier%' LIMIT 1)),
(nextval('sequence_generator'), DATE '2025-04-07', 'CORRECTIVE', 'EN_COURS', 'Test du cable, du port et de la configuration du commutateur.', (SELECT id FROM panne WHERE description LIKE 'Perte intermittente%' LIMIT 1));

-- Plannings de maintenance et lien avec les interventions
INSERT INTO planning_maintenance (id, date_prevue, periodicite, statut, description) VALUES
(nextval('sequence_generator'), DATE '2025-06-15', 'Semestrielle', 'PLANIFIER', 'Controle preventif des serveurs et verification des sauvegardes.'),
(nextval('sequence_generator'), DATE '2025-05-10', 'Trimestrielle', 'EN_COURS', 'Inspection des equipements reseau et test de connectivite.'),
(nextval('sequence_generator'), DATE '2025-01-20', 'Annuelle', 'TERMINER', 'Maintenance annuelle du serveur applicatif.');

INSERT INTO rel_planning_maintenance__intervention (planning_maintenance_id, intervention_id) VALUES
((SELECT id FROM planning_maintenance WHERE description LIKE 'Controle preventif des serveurs%' LIMIT 1), (SELECT id FROM intervention WHERE description LIKE 'Remplacement de la batterie%' LIMIT 1)),
((SELECT id FROM planning_maintenance WHERE description LIKE 'Inspection des equipements reseau%' LIMIT 1), (SELECT id FROM intervention WHERE description LIKE 'Test du cable%' LIMIT 1)),
((SELECT id FROM planning_maintenance WHERE description LIKE 'Maintenance annuelle du serveur%' LIMIT 1), (SELECT id FROM intervention WHERE description LIKE 'Nettoyage du chemin papier%' LIMIT 1));

-- Campagne de recensement, constats et imports
INSERT INTO recensement (id, date_debut, date_fin, statut) VALUES
(nextval('sequence_generator'), DATE '2025-01-06', DATE '2025-01-31', 'CLOTUREE'),
(nextval('sequence_generator'), DATE '2025-06-02', DATE '2025-06-30', 'PLANIFIER'),
(nextval('sequence_generator'), DATE '2025-03-03', NULL, 'EN_COURS');

INSERT INTO equipement_recensement (id, etat_constate, date_constat, emplacement_constate, anomalie_constatee, recensement_id, actif_id) VALUES
(nextval('sequence_generator'), 'EN_SERVICE', DATE '2025-01-08', 'Bureau finances - 2e etage', false, (SELECT id FROM recensement WHERE date_debut = DATE '2025-01-06' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0001')),
(nextval('sequence_generator'), 'EN_MAINTENANCE', DATE '2025-01-09', 'Salle serveurs', true, (SELECT id FROM recensement WHERE date_debut = DATE '2025-01-06' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0006')),
(nextval('sequence_generator'), 'REFORME', DATE '2025-03-12', 'Stock informatique', true, (SELECT id FROM recensement WHERE date_debut = DATE '2025-03-03' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0010'));

INSERT INTO inventaire (id, nom_fichier, date_import, actif_id) VALUES
(nextval('sequence_generator'), 'inventaire_parc_2025-01.csv', DATE '2025-01-06', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0001')),
(nextval('sequence_generator'), 'inventaire_parc_2025-01.csv', DATE '2025-01-06', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0002')),
(nextval('sequence_generator'), 'inventaire_complementaire_2025-03.xlsx', DATE '2025-03-12', (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0010'));

-- Contrats fournisseurs
INSERT INTO contrat (id, type_contrat, reference, date_debut, date_fin, fournisseur_id, actif_id) VALUES
(nextval('sequence_generator'), 'GARANTIE', 'GAR-DT-2024-018', DATE '2024-02-12', DATE '2027-02-11', (SELECT id FROM fournisseur WHERE nom = 'DigiTech Afrique' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0001')),
(nextval('sequence_generator'), 'MAINTENANCE', 'MNT-RS-2025-004', DATE '2025-01-01', DATE '2025-12-31', (SELECT id FROM fournisseur WHERE nom = 'Reseaux et Solutions' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0005')),
(nextval('sequence_generator'), 'GARANTIE', 'GAR-BS-2023-032', DATE '2023-11-20', DATE '2025-11-19', (SELECT id FROM fournisseur WHERE nom = 'Buro Services' LIMIT 1), (SELECT id FROM actif WHERE code_inventaire = 'DGI-INFO-0003'));

-- Historique et rapports
INSERT INTO historique_action (id, date_action, type_action, entite_ciblee, ancienne_valeur, nouvelle_valeur, utilisateur_id) VALUES
(nextval('sequence_generator'), TIMESTAMP '2025-01-15 09:30:00', 'AFFECTATION', 'Affectation', NULL, 'DGI-INFO-0001 affecte a Ousmane Kone', (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), TIMESTAMP '2025-03-10 14:15:00', 'TRANSFERT', 'Transfert', 'Direction des finances', 'Direction des ressources humaines', (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1)),
(nextval('sequence_generator'), TIMESTAMP '2025-03-05 08:45:00', 'MAINTENANCE', 'Maintenance', 'EN_SERVICE', 'EN_MAINTENANCE', (SELECT id FROM jhi_user WHERE login = 'admin' LIMIT 1));

INSERT INTO rapport (id, titre, type_rapport, description, chemin_fichier, date_generation, genere_par, format_export, parametres) VALUES
(nextval('sequence_generator'), 'Etat du parc informatique', 'INVENTAIRE', 'Synthese des actifs par categorie, etat et localisation.', '/rapports/parc-informatique-2025-01.pdf', TIMESTAMP '2025-01-31 16:30:00', 'admin', 'PDF', '{"dateDebut":"2025-01-01","dateFin":"2025-01-31"}'),
(nextval('sequence_generator'), 'Suivi des maintenances', 'MAINTENANCE', 'Interventions ouvertes, cloturees et a planifier.', '/rapports/maintenances-2025-T1.xlsx', TIMESTAMP '2025-04-01 10:00:00', 'admin', 'XLSX', '{"periode":"2025-T1"}'),
(nextval('sequence_generator'), 'Mouvements des actifs', 'TRANSFERT', 'Historique des affectations et transferts du premier trimestre.', '/rapports/mouvements-2025-T1.csv', TIMESTAMP '2025-04-02 11:15:00', 'admin', 'CSV', '{"periode":"2025-T1","statut":"TOUS"}');