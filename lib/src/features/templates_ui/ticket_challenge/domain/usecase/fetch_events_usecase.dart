import 'package:test_template/src/features/core/domain/usecase/use_case.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';

abstract class FetchEventsUseCase
    implements UseCase<List<EventEntity>, NoParams> {}
