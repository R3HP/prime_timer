import 'package:prime_timer/core/services/web_service/web_service.dart';

abstract class NumberDataSource {
  Future<int> getNumber();
}

class HttpNumberDataSource implements NumberDataSource {
  final WebService webService;

  HttpNumberDataSource({required this.webService});

  @override
  Future<int> getNumber() async {
    try {
      final response = await webService.get(
        'http://www.randomnumberapi.com/api/v1.0/random',
      );
      return (response as List).first as int;
    } catch (e) {
      rethrow;
    }
  }
}