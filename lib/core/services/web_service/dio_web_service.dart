import 'package:dio/dio.dart';
import 'package:prime_timer/core/services/web_service/web_service.dart';

class DioWebService implements WebService {
  final Dio dio;

  const DioWebService({required this.dio});

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.get(
        url,
        options: Options(headers: headers),
        data: data,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      throw WebServiceException(
        message: e.toString().replaceAll('Exception:', ''),
        trace: e,
      );
    }
  }
}
