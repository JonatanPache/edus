import 'dart:convert';
import 'package:edus/src/utils/constantes.dart';
import 'package:http/http.dart' as http;

/// OpenAPI Repository
class OpenAiRepository {
  static http.Client client = http.Client();

  /// Sends OpenAPI request.
  static Future<Map<String, dynamic>> sendMessage({required String prompt})
  async {
    try {
      final headers = {
        'Authorization': 'Bearer $aiToken',
        'Content-Type': 'application/json'
      };
      final request = http.Request('POST', Uri.parse('${endpoint}completions'))
        ..body = json.encode({
          'model': 'text-davinci-003',
          'prompt': prompt,
          'temperature': 0,
          'max_tokens': 20
        });
      request.headers.addAll(headers);
      final response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        print(data);
        return json.decode(data) as Map<String, dynamic>;
      } else {
        return {
          'status': false,
          'message': 'Oops, there was an error',
        };
      }
    } catch (_) {
      return {
        'status': false,
        'message': 'Oops, there was an error',
      };
    }
  }
}