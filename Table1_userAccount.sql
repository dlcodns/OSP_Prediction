CREATE DATABASE prediction;

USE prediction;

create table userAccount (
	name CHAR(8) NOT NULL,
    id CHAR(10) NOT NULL,
    password VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
);
