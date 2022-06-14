part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class EventFetchedData extends EventEvent {
  const EventFetchedData();

  @override
  List<Object?> get props => throw UnimplementedError();
}
