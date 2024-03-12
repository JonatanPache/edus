import 'dart:convert';
import 'package:edus/src/models/error_model.dart';
import 'package:edus/src/models/response_api.dart';
import 'package:edus/src/models/user.dart';
import 'package:edus/src/provider/local_storage_repository.dart';
import 'package:edus/src/utils/constantes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider(
      (ref) => AuthRepository(
    client: http.Client(),
    local: LocalStorageRepository(),
  ),
);

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final http.Client _client;
  final LocalStorageRepository _localStorageRepository;

  AuthRepository(
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
  Future<ErrorModel> login(String username, String password) async {
    ErrorModel error = ErrorModel(error: 'Hubo un error', data: null);
    try {
      //Uri url = Uri.http(host, '/user/login');
      print(username);
      Uri url = Uri.https(host, '/user/login');
      String bodyParams = jsonEncode({'username': username, 'password': password});
      Map<String, String> headers = {
        'Content-type': 'application/json; charset=UTF-8'
      };
      final res = await http.post(url, headers: headers, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromMap(data);
      if (responseApi.success) {
        UserModel user = UserModel.fromMap(responseApi.data);
        print(user.token);
        _localStorageRepository.setToken(user.token);
        error = ErrorModel(error: null, data: user);
      } else {
        error = ErrorModel(error: responseApi.message, data: null);
      }
    } catch (e) {
      print('Error: $e');
    }
    return error;
  }

  Future<ErrorModel> getUserData() async {
    ErrorModel error =
    ErrorModel(error: "Something wrong happened.", data: null);
    try {
      String? token = await _localStorageRepository.getToken();
      if (token != null) {
        var res = await _client.get(Uri.parse('$host/user/'), headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        });
        switch (res.statusCode) {
          case 200:
            final newUser =
            UserModel.fromMap(jsonDecode(res.body)).copyWith(token: token);
            error = ErrorModel(error: null, data: newUser);
            _localStorageRepository.setToken(newUser.token);
            break;
        }
      }
      //final user = await login();
    } catch (e) {
      error = ErrorModel(error: e.toString(), data: null);
    }
    return error;
  }

}
