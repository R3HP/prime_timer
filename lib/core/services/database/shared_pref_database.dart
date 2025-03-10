import 'dart:convert';

import 'package:prime_timer/core/services/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDatabase implements DataBase {
  final SharedPreferences sharedPreferences;
  const SharedPrefDatabase({required this.sharedPreferences});

  @override
  Future<void> delete(String key) async {
    try {
      final response = await sharedPreferences.remove(key);
      if (!response) {
        throw Exception('Failed to delete data');
      }
      return;
    } catch (e) {
      throw DatabaseException(
        message: e.toString().replaceAll('Exception:', ''),
        trace: e,
      );
    }
  }

  @override
  Future<T?> get<T>(String key) async {
    try {
      final data = sharedPreferences.getString(key);
      if (data == null) {
        return null;
      }
      return json.decode(data) as T;
    } catch (e) {
      throw DatabaseException(
        message: e.toString().replaceAll('Exception:', ''),
        trace: e,
      );
    }
  }

  @override
  Future<void> set<T>(String key, T value) async {
    try {
      final data = json.encode(value);
      final response = await sharedPreferences.setString(key, data);
      if (!response) {
        throw Exception('Failed to save data');
      }
      return;
    } catch (e) {
      throw DatabaseException(
        message: e.toString().replaceAll('Exception:', ''),
        trace: e,
      );
    }
  }
}
