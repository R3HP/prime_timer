abstract class WebService {
  Future<dynamic> get(String url,{Map<String,dynamic>? headers,Map<String,dynamic>? data});
}

class WebServiceException implements Exception{
  final String message;
  final Object trace;

  WebServiceException({required this.message, required this.trace});

  @override
  String toString() {
    
    return message;
  }
  
}