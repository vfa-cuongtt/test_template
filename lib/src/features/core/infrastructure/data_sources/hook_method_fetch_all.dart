import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';

abstract class HookMethodFetchAll<T> {
  Future<Dio> onMiddlewareFetchAll();
  Future<Either<AppException, T>> fetchAll();
  Future<T> onParserFetchAll(dynamic json);
}
