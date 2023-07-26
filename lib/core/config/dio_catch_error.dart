import 'package:dio/dio.dart';
import 'package:tmdb/core/config/network_config.dart';

mixin DioCatchException {
  NetworkExceptionResponse catchError(DioException e) {
    if (e.response?.statusCode == 400) {
      return NetworkExceptionResponse(
          exception: e.response!.statusMessage.toString());
    } else if (e.response?.statusCode == 404) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 409) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 403) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 401) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 500) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 501) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 502) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 503) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else if (e.response?.statusCode == 504) {
      return NetworkExceptionResponse(
        exception: e.response!.statusMessage.toString(),
      );
    } else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return NetworkExceptionResponse(
            exception: "Connect Timeout",
          );
        case DioExceptionType.receiveTimeout:
          return NetworkExceptionResponse(
            exception: "Receive Timeout",
          );
        case DioExceptionType.sendTimeout:
          return NetworkExceptionResponse(
            exception: "Send Timeout",
          );
        case DioExceptionType.unknown:
          return NetworkExceptionResponse(
            exception: "No internet connection",
          );
        default:
          return NetworkExceptionResponse(
            exception: "Something went wrong",
          );
      }
    }
  }
}
