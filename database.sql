CREATE DATABASE asm1;
use asm1;
CREATE TABLE `role` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255)
);

CREATE TABLE `user` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    email VARCHAR(255),
    full_name VARCHAR(255),
    user_name VARCHAR(255),
    password VARCHAR(255),
    phone_number VARCHAR(255),
    status int(11),
    role_id int(11),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE `user_donation` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    money int(11),
    name VARCHAR(255),
    text VARCHAR(255),
    donation_date VARCHAR(255),
    status int(11),
    donation_id int(11),
    user_id int(11),
    FOREIGN KEY (donation_id) REFERENCES donation(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE `donation` (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(255),
    description VARCHAR(255),
    start_date VARCHAR(255),
	end_date VARCHAR(255),
    money int(11),
    name VARCHAR(255),
    organization_name VARCHAR(255),
    phone_number VARCHAR(255),
    status int(11)
);
select * from user;
select * from donation;
select * from user_donation;

 
