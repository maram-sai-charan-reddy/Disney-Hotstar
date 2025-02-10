use sys;

CREATE TABLE AgeCertifications (
    Age_Certification_Code VARCHAR(10) PRIMARY KEY,
    Age_Certification_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Title (
    title_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    show_type VARCHAR(50) NOT NULL,
    description TEXT,
    release_year INT NOT NULL,
    IMDB_Votes INT,
    IMDB_Score FLOAT,
    runtime INT,
    Age_Certification_Code VARCHAR(10),
    seasons INT NULL,
    FOREIGN KEY (Age_Certification_Code) REFERENCES AgeCertifications(Age_Certification_Code) ON DELETE CASCADE
);

CREATE TABLE Genre (
    Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    Genre_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Credit (
    Person_ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    character_name VARCHAR(1000),
    role VARCHAR(100) NOT NULL,
    title_id VARCHAR(255),
    FOREIGN KEY (title_id) REFERENCES Title(title_id) ON DELETE CASCADE
);

CREATE TABLE Title_Genre (
    title_id VARCHAR(255),
    Genre_ID INT,
    FOREIGN KEY (title_id) REFERENCES Title(title_id) ON DELETE CASCADE,
    FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID) ON DELETE CASCADE
);