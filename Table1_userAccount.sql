CREATE DATABASE prediction;	#prediction DB 생성

USE prediction;

create table userAccount (		#UID, name, user_id, password컬럼 생성, primary key= uid, user_id 등록
	UID INT AUTO_INCREMENT,		#알아서 증가하는 uid 생성
	name CHAR(8) NOT NULL,
    user_id CHAR(10) NOT NULL,
    password VARCHAR(15) NOT NULL,	#password를 변경하도록 가변형 데이터 사용
    PRIMARY KEY (UID, user_id)		#id는 유저끼리 같으면 안되므로 primary key 설정
);

DESC userAccount;		#Table1: UID  name  user_id  password
