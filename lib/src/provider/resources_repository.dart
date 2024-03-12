import 'dart:convert';
import 'package:edus/src/models/curso_model.dart';
import 'package:edus/src/models/error_model.dart';
import 'package:edus/src/models/examen_model.dart';
import 'package:edus/src/models/lesson_model.dart';
import 'package:edus/src/models/panel_model.dart';
import 'package:edus/src/models/progreso_model.dart';
import 'package:edus/src/provider/local_storage_repository.dart';
import 'package:edus/src/utils/constantes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final resourcesRepositoryProvider = Provider(
      (ref) => ResourcesRepository(
    client: http.Client(),
    local: LocalStorageRepository(),
  ),
);

//final userProvider = StateProvider<UserModel?>((ref) => null);

class ResourcesRepository {
  final http.Client _client;
  final LocalStorageRepository _localStorageRepository;

  ResourcesRepository(
      {required LocalStorageRepository local, required http.Client client})
      : _client = client,
        _localStorageRepository = local;

  // getCursosAll
  Future<List<CursoModel>> getCursosAll() async {
    List<CursoModel> listCurso = [];
    try {
      Uri url = Uri.https(host, '/cursos/getCursos');
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8'
      };
      final res = await http.get(url, headers: headers);
      final data = json.decode(res.body);
      if (res.statusCode == 200) {
        for (dynamic curso in data) {
          CursoModel cursoMo = CursoModel.fromMap(curso);
          listCurso.add(cursoMo);
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    return listCurso;
  }

  // getCursoById

  //getLeccionesByCursoId
  Future<List<LeccionModel>> getLessonsAll(String idCurso) async {
    List<LeccionModel> listLessons = [];
    try {
      Uri url = Uri.https(host, '/lessons/getLecciones/');
      String? token = await _localStorageRepository.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token!}'
      };
      String bodyParams = jsonEncode({'cursoId': idCurso});
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      if (res.statusCode == 200) {
        for (dynamic item in data) {
          LeccionModel lesson = LeccionModel.fromMap(item);
          //lesson.progreso = ProgresoModel.fromMap(item['progreso']);
          listLessons.add(lesson);
        }
      }else{
        print('error');
      }
    } catch (e) {
      print('Error: $e');
    }
    return listLessons;
  }

  // get progreso
  Future<ProgresoModel> getProgreso(String leccionId) async {
    ProgresoModel progreso=ProgresoModel(panelesCompletados: 0, id: '132',
        userId: '123', leccionId: leccionId, completado: false,
        panelActual: 'asd', panelCompletados: 0, totalPaneles: 0);
    try {
      Uri url = Uri.https(host, '/progreso/getPanelActual');
      String? token = await _localStorageRepository.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': token!
      };
      String bodyParams = jsonEncode({'leccionId': leccionId});
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        progreso = ProgresoModel.fromMap(data);
      }
    } catch (e) {
      print('Error: $e');
    }
    return progreso;
  }

  // get progreso
  Future<PanelModel> getPanel(String idPanel) async {
    PanelModel panel=PanelModel( id: 'asd', titulo: 'asd', contenido: 'asd',
        leccionId: 'asd', orden: 0, img:[]);
    try {
      Uri url = Uri.https(host, '/panels/getPanel');
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
      };
      String bodyParams = jsonEncode({'panelId': idPanel});
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        panel = PanelModel.fromMap(data);
      }
    } catch (e) {
      print('Error: $e');
    }
    return panel;
  }

  // get next panel
  Future<ErrorModel> getNextPanel(String idPanel) async {
    ErrorModel error= ErrorModel(error: 'ae', data: null);
    try {
      Uri url = Uri.https(host, '/panels/getNextPanel');
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
      };
      String bodyParams = jsonEncode({'panelId': idPanel});
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        error = ErrorModel(error: 'ae', data: data);
      }
    } catch (e) {
      print('Error: $e');
    }
    return error;
  }

  // get examen
  Future<ExamenModel> getExamen(String idLeccion) async {
    ExamenModel examen = ExamenModel(
        preguntas: [], leccionId: 'asd', id: 'asd');
    try {
      Uri url = Uri.https(host, '/lessons/getExamen');
      String? token = await _localStorageRepository.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token!}'
      };
      String bodyParams = jsonEncode({'leccionId': idLeccion});
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        examen = ExamenModel.fromMap(data);
      }
    } catch (e) {
      print('Error: $e');
    }
    return examen;
  }

  saveResponse(String idPregunta,bool resp, {int duration=5}) async{
    try {
      Uri url = Uri.https(host, '/lessons/saveResponse');
      String? token = await _localStorageRepository.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token!}'
      };
      String bodyParams = jsonEncode({
        'preguntaId': idPregunta,
        "duration": duration,
        "respuestaCorrecta":resp
      });
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        print('exitoso');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  setExamen(String idExamen,int data, int total) async {
    try {
      Uri url = Uri.https(host, '/lessons/setExamen');
      String? token = await _localStorageRepository.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token!}'
      };
      String bodyParams = jsonEncode({
        "resultado":{
          'examenId': idExamen,
          'puntaje':data*100/total,
          "nivelDominio":data*100/total>50?"Bueno":"Malo",
          "foratalezas":["Buena memoria"],
          "debilidades":["asd"],
          "correctos":data
        }
      });
      final res = await http.post(url, headers: headers, body: bodyParams);
      if (res.statusCode == 200) {
        print('examen guardado');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
