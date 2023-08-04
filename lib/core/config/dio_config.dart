import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin DioConfig {
  Dio createRequest() {
    final bearerToken = dotenv.get('ACCESS_TOKEN');
    // Time out congifration
    Dio dio = Dio(BaseOptions(
        headers: {
          "Authorization": "Bearer $bearerToken",
        },
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 11),
        connectTimeout: const Duration(seconds: 12)));
    return dio;
  }
}
