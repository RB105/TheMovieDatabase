import 'package:dio/dio.dart';

mixin DioConfig {
  Dio createRequest() {
    // Time out congifration
    Dio dio = Dio(BaseOptions(
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 11),
        connectTimeout: const Duration(seconds: 12)));
    return dio;
  }
}
