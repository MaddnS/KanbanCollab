INSERT INTO user (username, last_name, first_name, email, pwhash, role) VALUES ('admin', 'lastName', 'firstName', 'email.admin@example.com', '$2a$10$lrHeviFZpOz10zEcM/zp2uSnN02t2lEL8deULaq9DU2YMeaShZGvG', 'ROLE_ADMIN');
INSERT INTO user (username, last_name, first_name, email, pwhash, role) VALUES ('MaddnS', 'Schweighofer', 'Martin', 'maddns@kanbancollab.com', '$2a$10$ky3O1JZa5WYT0g67G89vIuImaEecqwkPGKIoxrWApOdfS1Sk84f3a', 'ROLE_USER');
INSERT INTO user (username, last_name, first_name, email, pwhash, role) VALUES ('peteFG', 'Feldgrill', 'Peter', 'petefg@kanbancollab.com', '$2a$10$ky3O1JZa5WYT0g67G89vIuImaEecqwkPGKIoxrWApOdfS1Sk84f3a', 'ROLE_USER');
INSERT INTO user (username, last_name, first_name, email, pwhash, role) VALUES ('TomTom', 'Kristan', 'Thomas', 'tomtom@kanbancollab.com', '$2a$10$ky3O1JZa5WYT0g67G89vIuImaEecqwkPGKIoxrWApOdfS1Sk84f3a', 'ROLE_USER');

INSERT INTO project (name, owner_user_id, description) VALUES ('Develop KanbanCollab', 1, 'Create and manage a web application.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Server Administration', 1, 'Server Administration Windows.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Network Technologies', 1, 'Connect all the cables.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Learn JavaScript', 1, 'It is a "normal" programming language.');
INSERT INTO project (name, owner_user_id, description) VALUES ('SWENGA Project', 2, 'Web application.');
INSERT INTO project (name, owner_user_id, description) VALUES ('DMT Project', 2, 'Game development with Unity.');
INSERT INTO project (name, owner_user_id, description) VALUES ('HVSYS Paper', 2, 'Research 4G and 5G technologies.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Bachelor Thesis', 3, 'Research and write a BAC-1.');
INSERT INTO project (name, owner_user_id, description) VALUES ('SWENGA Project Presentation', 3, '');
INSERT INTO project (name, owner_user_id, description) VALUES ('Build a PC', 3, 'Research all the parts, order them and put them together.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Bachelor Thesis', 4, 'Quantum Computing and stuff.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Bucket List', 4, 'Things I want to do before I kick the bucket.');
INSERT INTO project (name, owner_user_id, description) VALUES ('Interrupt Routine', 4, 'Write one with Haskell?');