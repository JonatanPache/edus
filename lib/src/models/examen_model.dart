// To parse this JSON data, do
//
//     final examenModel = examenModelFromMap(jsonString);

import 'dart:convert';

ExamenModel examenModelFromMap(String str) => ExamenModel.fromMap(json.decode(str));

String examenModelToMap(ExamenModel data) => json.encode(data.toMap());

class ExamenModel {
  String id;
  List<Pregunta> preguntas;
  String leccionId;

  ExamenModel({
    required this.id,
    required this.preguntas,
    required this.leccionId,
  });

  ExamenModel copyWith({
    String? id,
    List<Pregunta>? preguntas,
    String? leccionId,
  }) =>
      ExamenModel(
        id: id ?? this.id,
        preguntas: preguntas ?? this.preguntas,
        leccionId: leccionId ?? this.leccionId,
      );

  factory ExamenModel.fromMap(Map<String, dynamic> json) => ExamenModel(
    id: json["_id"]??'',
    preguntas: List<Pregunta>.from(json["preguntas"].map((x) => Pregunta.fromMap(x))),
    leccionId: json["leccionId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "preguntas": List<dynamic>.from(preguntas.map((x) => x.toMap())),
    "leccionId": leccionId,
  };
}

class Pregunta {
  String id;
  String pregunta;
  int duration;
  List<String> respuestas;
  int respuestaCorrecta;

  Pregunta({
    required this.id,
    required this.pregunta,
    required this.duration,
    required this.respuestas,
    required this.respuestaCorrecta,
  });

  Pregunta copyWith({
    String? id,
    String? pregunta,
    int? duration,
    List<String>? respuestas,
    int? respuestaCorrecta,
  }) =>
      Pregunta(
        id: id ?? this.id,
        pregunta: pregunta ?? this.pregunta,
        duration: duration ?? this.duration,
        respuestas: respuestas ?? this.respuestas,
        respuestaCorrecta: respuestaCorrecta ?? this.respuestaCorrecta,
      );

  factory Pregunta.fromMap(Map<String, dynamic> json) => Pregunta(
    id: json["_id"],
    pregunta: json["pregunta"],
    duration: json["duration"],
    respuestas: List<String>.from(json["respuestas"].map((x) => x)),
    respuestaCorrecta: json["respuestaCorrecta"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "pregunta": pregunta,
    "duration": duration,
    "respuestas": List<dynamic>.from(respuestas.map((x) => x)),
    "respuestaCorrecta": respuestaCorrecta,
  };
}
