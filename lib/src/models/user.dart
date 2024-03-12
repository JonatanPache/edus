import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  String username;
  String email;
  String password;
  String img;
  String token;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.img,
    required this.token,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? password,
    String? img,
    String? token,
  }) =>
      UserModel(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        img: img ?? this.img,
        token: token ?? this.token,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    email: json["email"] ,
    password: json["password"],
    img: json["img"] ?? '',
    token: json["token"] ?? '',
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "email": email,
    "password": password,
    "img": img,
    "token": token,
  };
}
