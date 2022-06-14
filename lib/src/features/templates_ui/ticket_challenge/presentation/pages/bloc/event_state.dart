part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class EventInitial extends EventState {
  const EventInitial();

  @override
  List<Object> get props => [];
}

class EventLoading extends EventState {
  const EventLoading();

  @override
  List<Object> get props => [];
}

class EventLoadSuccessful extends EventState {
  const EventLoadSuccessful({required this.events});

  final List<EventEntity> events;

  @override
  List<Object> get props => [events];
}

class EventLoadFailed extends EventState {
  const EventLoadFailed({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
