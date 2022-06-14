import 'package:dartz/dartz.dart';
import 'package:test_template/src/common/configs/env/env.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/data_sources/event_remote_data_provider.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/repositories/event_repository.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.dev)
@Environment(Env.test)
@Singleton(as: EventRepository)
class DevEventRepository implements EventRepository {
  const DevEventRepository({required this.eventRemoteDataProvider});

  final EventRemoteDataProvider eventRemoteDataProvider;

  @override
  Future<Either<AppException, List<EventEntity>>> fetchEvents() async {
    return eventRemoteDataProvider.fetchAll();
  }

  @override
  Future<Either<AppException, EventEntity>> getEvent(EventID id) {
    return eventRemoteDataProvider.getEvent(id);
  }
}
