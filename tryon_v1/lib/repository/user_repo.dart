import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int user_id;
  final String user_name;
  final String user_gender;
  final String user_nickname;
  final int user_phonenumber;
  final int user_studentID;
  final int user_age;
  final String user_imageUrls;
  final String user_bio;
  final String user_major;
  final String user_email;
  final String user_password;

  User({
    required this.user_id,
    required this.user_name,
    required this.user_gender,
    required this.user_nickname,
    required this.user_phonenumber,
    required this.user_studentID,
    required this.user_age,
    required this.user_imageUrls,
    required this.user_bio,
    required this.user_major,
    required this.user_email,
    required this.user_password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user_id: int.parse(json['user_id']),
        user_name: json['user_name'],
        user_gender: json['user_gender'],
        user_nickname: json['user_nickname'],
        user_phonenumber: int.parse(json['user_phonenumber']),
        user_studentID: int.parse(json['user_studentID']),
        user_age: int.parse(json['user_age']),
        user_imageUrls: json['user_imageUrls'],
        user_bio: json['user_bio'],
        user_major: json['user_major'],
        user_email: json['user_email'],
        user_password: json['user_password'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_name': user_name,
        'user_gender': user_gender,
        'user_nickname': user_nickname,
        'user_phonenumber': user_phonenumber.toString(),
        'user_studentID': user_studentID.toString(),
        'user_age': user_age.toString(),
        'user_imageUrls': user_imageUrls,
        'user_bio': user_bio,
        'user_major': user_major,
        'user_email': user_email,
        'user_password': user_password,
      };

  @override
  List<Object?> get props => [
        user_id,
        user_name,
        user_age,
        user_imageUrls,
        user_bio,
        user_major,
      ];

  static List<User> users = [
    User(
      user_id: 1,
      user_name: 'mingkey',
      user_gender: '',
      user_nickname: '',
      user_phonenumber: 0,
      user_studentID: 0,
      user_age: 20,
      user_imageUrls:
          'https://news.nateimg.co.kr/orgImg/sh/2022/05/18/6797323_972718_5053.jpg',
      user_bio: 'hello',
      user_major: '컴퓨터 공학과',
      user_email: '',
      user_password: '',
    ),
    User(
      user_id: 2,
      user_name: 'dobby',
      user_gender: '',
      user_nickname: '',
      user_phonenumber: 0,
      user_studentID: 0,
      user_age: 21,
      user_imageUrls:
          'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/ts/2019/06/19/637374_334710_5039_org.jpg',
      user_bio: 'test',
      user_major: '경영학과',
      user_email: '',
      user_password: '',
    ),
    User(
      user_id: 3,
      user_name: 'yoon',
      user_gender: '',
      user_nickname: '',
      user_phonenumber: 0,
      user_studentID: 0,
      user_age: 25,
      user_imageUrls:
          'https://news.nateimg.co.kr/orgImg/sh/2022/05/18/6797323_972718_5053.jpg',
      user_bio: 'hello32',
      user_major: '경제학과',
      user_email: '',
      user_password: '',
    ),
    User(
      user_id: 4,
      user_name: 'yoon3684',
      user_gender: '',
      user_nickname: '',
      user_phonenumber: 0,
      user_studentID: 0,
      user_age: 25,
      user_imageUrls:
          'https://news.nateimg.co.kr/orgImg/sh/2022/05/18/6797323_972718_5053.jpg',
      user_bio: 'hello32',
      user_major: '경제학과',
      user_email: '',
      user_password: '',
    ),
    User(
      user_id: 5,
      user_name: 'yoonming',
      user_gender: '',
      user_nickname: '',
      user_phonenumber: 0,
      user_studentID: 0,
      user_age: 25,
      user_imageUrls:
          'https://news.nateimg.co.kr/orgImg/sh/2022/05/18/6797323_972718_5053.jpg',
      user_bio: 'hello32',
      user_major: '경제학과',
      user_email: '',
      user_password: '',
    ),
  ];
}
