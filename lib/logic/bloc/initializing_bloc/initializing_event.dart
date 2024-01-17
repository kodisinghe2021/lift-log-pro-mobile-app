part of 'initializing_bloc.dart';

@immutable
sealed class InitializingEvent {}

final class StartInitializingEvent extends InitializingEvent {}

final class StartInitializeRetrievingEvent extends InitializingEvent {
  StartInitializeRetrievingEvent({required this.db});
  final Database db;
}
