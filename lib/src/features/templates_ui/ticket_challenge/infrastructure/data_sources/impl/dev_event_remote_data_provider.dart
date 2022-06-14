import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_template/src/common/configs/env/env.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';
import 'package:test_template/src/features/core/domain/exceptions/unknown_exception.dart';
import 'package:test_template/src/features/core/flavors/flavor_config.dart';
import 'package:test_template/src/features/core/infrastructure/data_sources/middleware.dart';
import 'package:test_template/src/features/core/infrastructure/interceptors/common_interceptor.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/fake/fake.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/data_sources/event_remote_data_provider.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/models/event_model.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/transformers/fetch_events_transformer.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.dev)
@Environment(Env.test)
@Singleton(as: EventRemoteDataProvider)
class DevEventRemoteDataProvider
    with Middleware
    implements EventRemoteDataProvider {
  DevEventRemoteDataProvider({
    required this.config,
    required this.dio,
  });

  final FlavorConfig config;
  final Dio dio;

  static const _apiPath = '/todos';
  static const _patchFetchEvents = '';

  @override
  Future<Either<AppException, EventModel>> getEvent(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppException, List<EventModel>>> fetchAll() async {
    //////////////////////////////////////////////////////////
    // put middleware in front of function
    //////////////////////////////////////////////////////////
    final dio = await onMiddlewareFetchAll();
    final url = '${config.baseUrl}$_apiPath$_patchFetchEvents';

    try {
      final response = await dio.get<dynamic>(url);
      switch (response.statusCode) {
        case HttpStatus.ok:
          //////////////////////////////////////////////////////////
          // put parser in front of return data
          //////////////////////////////////////////////////////////
          final data = await onParserFetchAll(response.data);
          return Right(data);
        default:
          throw const UnknownException();
      }
    } on SocketException catch (_) {
      throw const UnknownException();
    }
  }

  @override
  Future<Dio> onMiddlewareFetchAll() async {
    final dioInstance = Dio(dio.options);

    await fakeFetchEvents(dioInstance);

    //////////////////////////////////////////////////////////
    // middleware in here
    //////////////////////////////////////////////////////////
    middleware(dioInstance, [CommonInterceptor()], FetchEventsTransformer());
    return dioInstance;
  }

  @override
  Future<List<EventModel>> onParserFetchAll(dynamic json) async {
    try {
      final arr = json['events'] as List<dynamic>;

      final result = arr
          .map(
            (dynamic item) => EventModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
      return result;
    } on Exception {
      throw const UnknownException();
    }
  }
}
