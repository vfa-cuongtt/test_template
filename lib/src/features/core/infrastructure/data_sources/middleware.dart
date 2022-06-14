import 'package:dio/dio.dart';

mixin Middleware on Object {
  void middleware(
    Dio dio,
    List<Interceptor>? interceptors,
    Transformer? transformer,
  ) {
    /// handle middleware
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    /// handle transformer
    if (transformer != null) {
      dio.transformer = transformer;
    }
  }
}
