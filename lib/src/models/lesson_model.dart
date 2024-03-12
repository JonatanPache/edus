// To parse this JSON data, do
//
//     final leccionModel = leccionModelFromMap(jsonString);

import 'package:edus/src/models/progreso_model.dart';
import 'dart:convert';

LeccionModel leccionModelFromMap(String str) => LeccionModel.fromMap(json.decode(str));

String leccionModelToMap(LeccionModel data) => json.encode(data.toMap());

class LeccionModel {
  String id;
  String titulo;
  String descripcion;
  int duracion;
  String dificultad;
  int orden;
  String cursoId;
  String img;
  ProgresoModel progreso;

  LeccionModel({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.duracion,
    required this.dificultad,
    required this.orden,
    required this.cursoId,
    required this.img,
    required this.progreso
  });

  LeccionModel copyWith({
    String? id,
    String? titulo,
    String? descripcion,
    int? duracion,
    String? dificultad,
    int? orden,
    String? cursoId,
    String? img,
  }) =>
      LeccionModel(
          id: id ?? this.id,
          titulo: titulo ?? this.titulo,
          descripcion: descripcion ?? this.descripcion,
          duracion: duracion ?? this.duracion,
          dificultad: dificultad ?? this.dificultad,
          orden: orden ?? this.orden,
          cursoId: cursoId ?? this.cursoId,
          img: img ?? this.img,
          progreso: progreso ?? progreso
      );

  factory LeccionModel.fromMap(Map<String, dynamic> json) => LeccionModel(
      id: json["_id"],
      titulo: json["titulo"],
      descripcion: json["descripcion"],
      duracion: json["duracion"],
      dificultad: json["dificultad"],
      orden: json["orden"],
      cursoId: json["cursoId"],
      img: json["img"]??'',
      progreso: ProgresoModel.fromMap(json['progreso'])
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "titulo": titulo,
    "descripcion": descripcion,
    "duracion": duracion,
    "dificultad": dificultad,
    "orden": orden,
    "cursoId": cursoId,
    "img": img??'',
    "progreso":progreso
  };
}
