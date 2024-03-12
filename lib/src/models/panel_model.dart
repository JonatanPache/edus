// To parse this JSON data, do
//
//     final panelModel = panelModelFromMap(jsonString);

import 'dart:convert';

PanelModel panelModelFromMap(String str) => PanelModel.fromMap(json.decode(str));

String panelModelToMap(PanelModel data) => json.encode(data.toMap());

class PanelModel {
  String id;
  String titulo;
  String contenido;
  String leccionId;
  int orden;
  List<String> img;

  PanelModel({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.leccionId,
    required this.orden,
    required this.img,
  });

  PanelModel copyWith({
    String? id,
    String? titulo,
    String? contenido,
    String? leccionId,
    int? orden,
    List<String>? img,
  }) =>
      PanelModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        contenido: contenido ?? this.contenido,
        leccionId: leccionId ?? this.leccionId,
        orden: orden ?? this.orden,
        img: img ?? this.img,
      );

  factory PanelModel.fromMap(Map<String, dynamic> json) => PanelModel(
    id: json["_id"],
    titulo: json["titulo"],
    contenido: json["contenido"],
    leccionId: json["leccionId"],
    orden: json["orden"],
    img: List<String>.from(json["img"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "titulo": titulo,
    "contenido": contenido,
    "leccionId": leccionId,
    "orden": orden,
    "img": List<dynamic>.from(img.map((x) => x)),
  };
}
