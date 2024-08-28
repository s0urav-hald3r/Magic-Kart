import 'dart:developer';

import 'package:dio/dio.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error type: ${err.error}\n'
        'Error message: ${err.message}'); //Error log

    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    log('${options.method} request ==> $requestPath'); //Info log

    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Status Code: ${response.statusCode}\n'
        'Status Message: ${response.statusMessage}\n'
        'Data: ${response.data}'); // Debug log

    handler.next(response); // continue with the Response
  }
}
