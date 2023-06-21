import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Key-Value Offline Storage
class Storage {
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  late final SharedPreferences _prefs;

  Storage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setListOfString(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  Future<bool> setListOfJson(
      String key, List<Map<String, dynamic>> value) async {
    List<String> storedJsonList =
        value.map<String>((element) => jsonEncode(element)).toList();
    return await _prefs.setStringList(key, storedJsonList);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getListOfString(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Object getJson(String key) {
    return jsonDecode(_prefs.getString(key) ?? "{}");
  }

  List<Map<String, dynamic>> getListOfJson(String key) {
    List<String> storedJsonList = _prefs.getStringList(key) ?? [];
    return storedJsonList
        .map<Map<String, dynamic>>((element) => jsonDecode(element))
        .toList();
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
