DROP DATABASE IF EXISTS rental_management;
CREATE DATABASE rental_management;

USE rental_management;
CREATE TABLE users
(
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(255) UNIQUE NOT NULL,

    password VARCHAR(255) NOT NULL,

    phone VARCHAR(15),

    role ENUM('admin','owner','customer') DEFAULT 'customer',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users
(name,email,password,phone,role)
VALUES
('Admin','admin@gmail.com','admin123','9876543210','admin'),

('Owner','owner@gmail.com','owner123','9876543211','owner'),

('Priya','priya@gmail.com','priya123','9876543212','customer');
SELECT * FROM users;
CREATE TABLE properties
(
    property_id INT AUTO_INCREMENT PRIMARY KEY,

    owner_id INT NOT NULL,

    title VARCHAR(150) NOT NULL,

    description TEXT,

    location VARCHAR(200),

    city VARCHAR(100),

    rent DECIMAL(10,2) NOT NULL,

    property_type VARCHAR(50),

    bedrooms INT,

    image VARCHAR(255),

    approval_status ENUM('pending','approved','rejected')
    DEFAULT 'pending',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(owner_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);
INSERT INTO properties
(owner_id,title,description,location,city,rent,property_type,bedrooms,approval_status)
VALUES
(2,
'2BHK Apartment',
'Beautiful apartment near city',
'Bhubaneswar',
'Bhubaneswar',
15000,
'Apartment',
2,
'approved'),

(2,
'Single Room',
'Affordable room for students',
'Patia',
'Bhubaneswar',
5000,
'Room',
1,
'approved');
SELECT * FROM properties;
CREATE TABLE bookings
(
    booking_id INT AUTO_INCREMENT PRIMARY KEY,

    property_id INT NOT NULL,

    customer_id INT NOT NULL,

    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    status ENUM('pending','approved','rejected')
    DEFAULT 'pending',

    FOREIGN KEY(property_id)
    REFERENCES properties(property_id)
    ON DELETE CASCADE,

    FOREIGN KEY(customer_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);
CREATE TABLE payments
(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    booking_id INT NOT NULL,

    amount DECIMAL(10,2),

    payment_status ENUM('pending','paid')
    DEFAULT 'pending',

    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(booking_id)
    REFERENCES bookings(booking_id)
    ON DELETE CASCADE
);
CREATE TABLE reviews
(
    review_id INT AUTO_INCREMENT PRIMARY KEY,

    property_id INT NOT NULL,

    customer_id INT NOT NULL,

    rating INT CHECK(rating BETWEEN 1 AND 5),

    comment TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(property_id)
    REFERENCES properties(property_id)
    ON DELETE CASCADE,

    FOREIGN KEY(customer_id)
    REFERENCES users(user_id)
    ON DELETE CASCADE
);
SHOW TABLES;