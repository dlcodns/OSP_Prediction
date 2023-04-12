CREATE DATABASE prediction;	#prediction DB 생성

USE prediction;

create table userAccount (		#name, id, password 컬럼 생성
	name CHAR(8) NOT NULL,
    id CHAR(10) NOT NULL,
    password VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)			#id는 유저끼리 같으면 안되므로 primary key 설정
);

ALTER TABLE `userAccount` CHANGE `id` `user_id` CHAR(10) NOT NULL; 	#id->user_id로 이름 변경
ALTER TABLE `userAccount` ADD `UID` INT(5) NOT NULL FIRST;		#맨앞에 새로운 컬럼 UID 추가

DESC userAccount;		#Table1: UID  name  user_id  password
