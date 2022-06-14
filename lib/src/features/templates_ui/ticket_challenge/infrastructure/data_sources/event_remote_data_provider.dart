import 'package:dartz/dartz.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';
import 'package:test_template/src/features/core/infrastructure/data_sources/hook_method_fetch_all.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/models/event_model.dart';

abstract class EventRemoteDataProvider
    implements HookMethodFetchAll<List<EventModel>> {
  Future<Either<AppException, EventModel>> getEvent(String id);
}
