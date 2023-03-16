CREATE TABLE configuration (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  category VARCHAR(255),
  date DATE,
  description TEXT
);


CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment TEXT NOT NULL,
    date DATE
);