-- init.sql file
-- Creating tables
CREATE TABLE IF NOT EXISTS results (
    id SERIAL PRIMARY KEY,
    race_date DATE NOT NULL,
    race_name VARCHAR(255) NOT NULL,
    sport_type VARCHAR(64) NOT NULL,
    distance DECIMAL(10, 2),
    position VARCHAR(10),
    category_position VARCHAR(10),
    result_time TIME,
    race_website_url VARCHAR(512),
    results_url VARCHAR(512),
    strava_url VARCHAR(512),
    event_place VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS projects (
    id SERIAL PRIMARY KEY,
    school BOOLEAN DEFAULT FALSE,
    img VARCHAR(512)
);

CREATE TABLE IF NOT EXISTS projects_content (
    id SERIAL PRIMARY KEY,
    project_id INT NOT NULL,
    language_code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- Filling data
-- Results
INSERT INTO results (
    race_date, race_name, sport_type, distance, position, category_position, result_time, event_place, race_website_url, results_url, strava_url
) VALUES 

('2025-11-29', 'Stupenská 7', 'RUN', 7.2, '10', '3', '00:31:13', 'Stupno', 'https://behstupno.cz/', 'https://vysledky.4timing.cz/index.php?id_zavodu=590', 'https://www.strava.com/activities/16597863883'),
('2025-11-29', 'Březenská 11', 'RUN', 11, '4', '3', '00:45:49', 'Březno', NULL, 'https://sokotime.cz/vysledky/g-live.html?f=251012-brezno/251012.clax', 'https://www.strava.com/activities/16114952371');

-- Projects
INSERT INTO projects (school)
VALUES 
(FALSE),
(TRUE);

INSERT INTO projects_content (project_id, language_code, name, description)
VALUES 
(1, 'cs', 'Osobní stránka', 'Můj osobní web postavený na FastAPI a Vue.js (Tato stránka).'),
(1, 'en', 'Personal webpage', 'My personal website built with FastAPI and Vue.js (This website).'),
(2, 'cs', 'Velogames Bot', 'Program pro predikci a sestavení týmu velogames. Program byl vytvořen v rámci předmětu KIV/DBM2 (Databáze a metody zpracování informace)'),
(2, 'en', 'Velogames Predictor', 'A program for predicting and assembling a velogames team. The program was created as part of the KIV/DBM2 (Databases and Information Processing Methods) course.');

-- EOF -- 