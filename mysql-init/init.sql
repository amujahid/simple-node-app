CREATE DATABASE IF NOT EXISTS contacts_app;

USE contacts_app;

CREATE TABLE IF NOT EXISTS contacts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  number VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create user if not exists
CREATE USER IF NOT EXISTS 'contactsapp'@'%' IDENTIFIED BY '123';

-- Grant privileges
GRANT ALL PRIVILEGES ON contacts_app.* TO 'contactsapp'@'%';

FLUSH PRIVILEGES;
