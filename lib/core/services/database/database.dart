abstract class DataBase {
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value);
  Future<void> delete(String key);
}


class DatabaseException implements Exception{
  final String message;
  final Object trace;

  DatabaseException({required this.message, required this.trace});

  @override
  String toString() {
    return message;
  }
}