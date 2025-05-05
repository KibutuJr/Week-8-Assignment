CREATE DATABASE contact_db;
USE contact_db;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Groups Table
CREATE TABLE `groups` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Contacts Table
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    group_id INT,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES `groups`(id) ON DELETE SET NULL
);

-- Insert Sample Data
INSERT INTO users (username, email)
VALUES ('johndoe', 'john@example.com');

INSERT INTO `groups` (name)
VALUES ('Family');

INSERT INTO contacts (user_id, group_id, name, phone, email)
VALUES (1, 1, 'Jane Smith', '1234567890', 'jane@example.com');

SELECT * FROM contacts;





