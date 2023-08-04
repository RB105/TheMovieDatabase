abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkSuccessResponse<T> extends NetworkResponse {
  T data;
  NetworkSuccessResponse({required this.data});
}

class NetworkErrorResponse extends NetworkResponse {
  String error;
  NetworkErrorResponse({required this.error});
}

class NetworkExceptionResponse extends NetworkResponse {
  String exception;
  NetworkExceptionResponse({required this.exception});
}
