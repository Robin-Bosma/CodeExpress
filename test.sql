CREATE TABLE configuration (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  code VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  html VARCHAR(50),
  css VARCHAR(50),
  php VARCHAR(50),
  javascript VARCHAR(50),
  SQLcode VARCHAR(50),
  date DATE,
  description TEXT
);



CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment TEXT NOT NULL,
    date DATE
);