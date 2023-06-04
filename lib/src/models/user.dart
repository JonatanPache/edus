// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  String id;
  String nombreUsuario;
  String email;
  String password;
  String ultimoCambioPassword;
  String verificationEmail;
  String tokenSesion;
  String creacionTokenSesion;
  String ultimoInicioToken;

  UserModel({
    required this.id,
    required this.nombreUsuario,
    required this.email,
    required this.password,
    required this.ultimoCambioPassword,
    required this.verificationEmail,
    required this.tokenSesion,
    required this.creacionTokenSesion,
    required this.ultimoInicioToken,
  });

  UserModel copyWith({
    String? id,
    String? nombreUsuario,
    String? email,
    String? password,
    String? ultimoCambioPassword,
    String? verificationEmail,
    String? tokenSesion,
    String? creacionTokenSesion,
    String? ultimoInicioToken,
  }) =>
      UserModel(
        id: id ?? this.id,
        nombreUsuario: nombreUsuario ?? this.nombreUsuario,
        email: email ?? this.email,
        password: password ?? this.password,
        ultimoCambioPassword: ultimoCambioPassword ?? this.ultimoCambioPassword,
        verificationEmail: verificationEmail ?? this.verificationEmail,
        tokenSesion: tokenSesion ?? this.tokenSesion,
        creacionTokenSesion: creacionTokenSesion ?? this.creacionTokenSesion,
        ultimoInicioToken: ultimoInicioToken ?? this.ultimoInicioToken,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nombreUsuario: json["nombre_usuario"],
    email: json["email"],
    password: json["password"],
    ultimoCambioPassword: json["ultimo_cambio_password"],
    verificationEmail: json["verification_email"],
    tokenSesion: json["token_sesion"],
    creacionTokenSesion: json["creacion_token_sesion"],
    ultimoInicioToken: json["ultimo_inicio_token"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nombre_usuario": nombreUsuario,
    "email": email,
    "password": password,
    "ultimo_cambio_password": ultimoCambioPassword,
    "verification_email": verificationEmail,
    "token_sesion": tokenSesion,
    "creacion_token_sesion": creacionTokenSesion,
    "ultimo_inicio_token": ultimoInicioToken,
  };
}
