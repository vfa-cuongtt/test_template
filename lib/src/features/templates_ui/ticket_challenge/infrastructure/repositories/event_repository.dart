import 'package:dartz/dartz.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';

abstract class EventRepository {
  Future<Either<AppException, List<EventEntity>>> fetchEvents();
  Future<Either<AppException, EventEntity>> getEvent(EventID id);
}
