CREATE TABLE configuration (
  id INT NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  category VARCHAR(255),
  date DATE,
  description TEXT
);