// To parse this JSON data, do
//
//     final cursoModel = cursoModelFromMap(jsonString);

import 'dart:convert';

CursoModel cursoModelFromMap(String str) => CursoModel.fromMap(json.decode(str));

String cursoModelToMap(CursoModel data) => json.encode(data.toMap());

class CursoModel {
  String id;
  String name;
  String descripcionShort;
  String descripcion;
  String categoria;
  int duracion;
  int experiencia;
  List<String> img;
  String imgLogo;
  int lessonCount;
  bool free;

  CursoModel({
    required this.id,
    required this.name,
    required this.descripcionShort,
    required this.descripcion,
    required this.categoria,
    required this.duracion,
    required this.experiencia,
    required this.img,
    required this.imgLogo,
    required this.lessonCount,
    required this.free,
  });

  CursoModel copyWith({
    String? id,
    String? name,
    String? descripcionShort,
    String? descripcion,
    String? categoria,
    int? duracion,
    int? experiencia,
    List<String>? img,
    String? imgLogo,
    int? lessonCount,
    bool? free,
  }) =>
      CursoModel(
        id: id ?? this.id,
        name: name ?? this.name,
        descripcionShort: descripcionShort ?? this.descripcionShort,
        descripcion: descripcion ?? this.descripcion,
        categoria: categoria ?? this.categoria,
        duracion: duracion ?? this.duracion,
        experiencia: experiencia ?? this.experiencia,
        img: img ?? this.img,
        imgLogo: imgLogo ?? this.imgLogo,
        lessonCount: lessonCount ?? this.lessonCount,
        free: free ?? this.free,
      );

  factory CursoModel.fromMap(Map<String, dynamic> json) => CursoModel(
    id: json["_id"],
    name: json["name"],
    descripcionShort: json["descripcionShort"],
    descripcion: json["descripcion"],
    categoria: json["categoria"],
    duracion: json["duracion"],
    experiencia: json["experiencia"],
    img: List<String>.from(json["img"].map((x) => x)),
    imgLogo: json["imgLogo"],
    lessonCount: json["lessonCount"],
    free: json["free"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "descripcionShort": descripcionShort,
    "descripcion": descripcion,
    "categoria": categoria,
    "duracion": duracion,
    "experiencia": experiencia,
    "img": List<dynamic>.from(img.map((x) => x)),
    "imgLogo": imgLogo,
    "lessonCount": lessonCount,
    "free": free,
  };
}
