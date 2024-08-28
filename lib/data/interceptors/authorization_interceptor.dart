import 'package:dio/dio.dart';

/// This interceptor add "Authorization" header and then, send it to the [API]
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options); // continue with the request
  }
}
