import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository{

  void save(String key, dynamic value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, jsonEncode(value));
  }

  Future<dynamic> read(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //String? token = preferences.getString('x-auth-token');
    if (preferences.getString(key) == null) return null;
    return json.decode(preferences.getString(key)!);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}