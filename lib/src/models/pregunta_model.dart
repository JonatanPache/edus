class Pregunta {
  String pregunta;
  int duration;
  List<String> respuestas;
  int respuestaCorrecta;

  Pregunta({
    required this.pregunta,
    required this.duration,
    required this.respuestas,
    required this.respuestaCorrecta,
  });

  Pregunta copyWith({
    String? pregunta,
    int? duration,
    List<String>? respuestas,
    int? respuestaCorrecta,
  }) =>
      Pregunta(
        pregunta: pregunta ?? this.pregunta,
        duration: duration ?? this.duration,
        respuestas: respuestas ?? this.respuestas,
        respuestaCorrecta: respuestaCorrecta ?? this.respuestaCorrecta,
      );

  factory Pregunta.fromMap(Map<String, dynamic> json) => Pregunta(
    pregunta: json["pregunta"],
    duration: json["duration"],
    respuestas: List<String>.from(json["respuestas"].map((x) => x)),
    respuestaCorrecta: json["respuestaCorrecta"],
  );

  Map<String, dynamic> toMap() => {
    "pregunta": pregunta,
    "duration": duration,
    "respuestas": List<dynamic>.from(respuestas.map((x) => x)),
    "respuestaCorrecta": respuestaCorrecta,
  };
}