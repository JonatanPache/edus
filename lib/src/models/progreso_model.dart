// To parse this JSON data, do
//
//     final progresoModel = progresoModelFromMap(jsonString);

import 'dart:convert';

ProgresoModel progresoModelFromMap(String str) => ProgresoModel.fromMap(json.decode(str));

String progresoModelToMap(ProgresoModel data) => json.encode(data.toMap());

class ProgresoModel {
  int panelesCompletados;
  String id;
  String userId;
  String leccionId;
  bool completado;
  String panelActual;
  int panelCompletados;
  int totalPaneles;

  ProgresoModel({
    required this.panelesCompletados,
    required this.id,
    required this.userId,
    required this.leccionId,
    required this.completado,
    required this.panelActual,
    required this.panelCompletados,
    required this.totalPaneles,
  });

  ProgresoModel copyWith({
    int? panelesCompletados,
    String? id,
    String? userId,
    String? leccionId,
    bool? completado,
    String? panelActual,
    int? panelCompletados,
    int? totalPaneles,
  }) =>
      ProgresoModel(
        panelesCompletados: panelesCompletados ?? this.panelesCompletados,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        leccionId: leccionId ?? this.leccionId,
        completado: completado ?? this.completado,
        panelActual: panelActual ?? this.panelActual,
        panelCompletados: panelCompletados ?? this.panelCompletados,
        totalPaneles: totalPaneles ?? this.totalPaneles,
      );

  factory ProgresoModel.fromMap(Map<String, dynamic> json) => ProgresoModel(
    panelesCompletados: json["panelesCompletados"],
    id: json["_id"],
    userId: json["userId"],
    leccionId: json["leccionId"],
    completado: json["completado"],
    panelActual: json["panelActual"],
    panelCompletados: json["panelCompletados"],
    totalPaneles: json["totalPaneles"],
  );

  Map<String, dynamic> toMap() => {
    "panelesCompletados": panelesCompletados,
    "_id": id,
    "userId": userId,
    "leccionId": leccionId,
    "completado": completado,
    "panelActual": panelActual,
    "panelCompletados": panelCompletados,
    "totalPaneles": totalPaneles,
  };
}
