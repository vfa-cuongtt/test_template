import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_template/src/features/core/domain/usecase/use_case.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/usecase/fetch_events_usecase.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({required this.fetchUseCase}) : super(const EventInitial()) {
    on<EventFetchedData>(_fetchData);
  }

  final FetchEventsUseCase fetchUseCase;

  Future<void> _fetchData(
    EventFetchedData event,
    Emitter<EventState> emit,
  ) async {
    emit(const EventLoading());
    final result = await fetchUseCase.call(NoParams());
    result.fold(
      (Exception e) => emit(EventLoadFailed(message: e.toString())),
      (List<EventEntity> events) => emit(EventLoadSuccessful(events: events)),
    );
  }
}
