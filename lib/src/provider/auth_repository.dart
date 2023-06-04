import 'dart:convert';
import 'package:edus/src/models/error_model.dart';
import 'package:edus/src/models/response_api.dart';
import 'package:edus/src/models/user.dart';
import 'package:edus/src/provider/local_storage_repository.dart';
import 'package:edus/src/utils/constantes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final regRepositoryProvider = Provider(
      (ref) => RegRepository(
    client: http.Client(),
    local: LocalStorageRepository(),
  ),
);

final userProvider = StateProvider<UserModel?>((ref) => null);

class RegRepository {
  final http.Client _client;
  final LocalStorageRepository _localStorageRepository;

  RegRepository(
      {required LocalStorageRepository local,
        required http.Client client})
      : _client = client,
        _localStorageRepository = local;

  // register
  Future<ErrorModel> register(String email, String password) async {
    ErrorModel error = ErrorModel(error: 'Hubo un error', data: null);
    try {
      Uri url = Uri.http(host, '/api/user/login');
      String bodyParams = jsonEncode({'email': email, 'password': password});
      Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8'};
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromMap(data);
      if (responseApi.success) {
        UserModel user = UserModel.fromMap(responseApi.data);
        _localStorageRepository.save('user', user.toMap());
        error = ErrorModel(error: null, data: user);
      } else {
        error = ErrorModel(error: responseApi.message, data: null);
      }
    } catch (e) {
      print('Error: $e');
    }
    return error;
  }

  // login


}
