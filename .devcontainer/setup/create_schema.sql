-- Create the database schema
CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    race_date DATE NOT NULL,
    race_name VARCHAR(255) NOT NULL,
    position VARCHAR(10),
    sport_type VARCHAR(64) NOT NULL,
    result_time TIME,
    distance DECIMAL(10, 2),
    race_website_url VARCHAR(512),
    results_url VARCHAR(512),
    strava_url VARCHAR(512),
    event_place VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    school BOOLEAN DEFAULT FALSE,
    img VARCHAR(512),
);

CREATE TABLE IF NOT EXISTS projects_content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    language_code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);
-- EOF
