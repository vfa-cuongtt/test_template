import 'dart:io';

import 'package:dio/dio.dart';

class CommonInterceptor extends Interceptor {
  CommonInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: '*/*',
      HttpHeaders.cacheControlHeader: 'no-cache',
    };
    final newOptions = options.copyWith(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: headers,
    );

    handler.next(newOptions);
  }
}
