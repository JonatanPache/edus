// To parse this JSON data, do
//
//     final cursoModel = cursoModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CursoModel cursoModelFromMap(String str) => CursoModel.fromMap(json.decode(str));

String cursoModelToMap(CursoModel data) => json.encode(data.toMap());

class CursoModel {
  int id;
  String name;
  String descripcion;
  String categoria;
  int duracion;
  int experiencia;
  String img;

  CursoModel({
    required this.id,
    required this.name,
    required this.descripcion,
    required this.categoria,
    required this.duracion,
    required this.experiencia,
    required this.img,
  });

  CursoModel copyWith({
    int? id,
    String? name,
    String? descripcion,
    String? categoria,
    int? duracion,
    int? experiencia,
    String? img,
  }) =>
      CursoModel(
        id: id ?? this.id,
        name: name ?? this.name,
        descripcion: descripcion ?? this.descripcion,
        categoria: categoria ?? this.categoria,
        duracion: duracion ?? this.duracion,
        experiencia: experiencia ?? this.experiencia,
        img: img ?? this.img,
      );

  factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
    id: json["id"],
    name: json["name"],
    descripcion: json["descripcion"],
    categoria: json["categoria"],
    duracion: json["duracion"],
    experiencia: json["experiencia"],
    img: json["img"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "descripcion": descripcion,
    "categoria": categoria,
    "duracion": duracion,
    "experiencia": experiencia,
    "img": img,
  };
}
