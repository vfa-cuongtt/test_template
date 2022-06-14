import 'package:dartz/dartz.dart';
import 'package:test_template/src/common/configs/env/env.dart';
import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/usecase/get_event_by_id_usecase.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/infrastructure/repositories/event_repository.dart';
import 'package:injectable/injectable.dart';

@Environment(Env.dev)
@Environment(Env.test)
@Singleton(as: GetEventByIdUseCase)
class DevGetEventByIdUseCase implements GetEventByIdUseCase {
  const DevGetEventByIdUseCase({required this.repository});

  final EventRepository repository;

  @override
  Future<Either<AppException, EventEntity>> call(String params) {
    return repository.getEvent(params);
  }
}
