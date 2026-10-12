-- task 1 

SELECT VERSION();

-- task 2 

CREATE DATABASE foodie_app;
USE foodie_app;

-- task 3 

CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);


-- task 4 

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) UNIQUE,
    created_at DATETIME
);


-- task 5 

-- This is intentionally wrong because the comma is missing.
CREATE TABLE restaurants_test (
    id INT PRIMARY KEY,
    name VARCHAR(100)
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);


-- Corrected version
CREATE TABLE restaurants_test (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);
