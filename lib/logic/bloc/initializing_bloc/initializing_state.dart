part of 'initializing_bloc.dart';

@immutable
sealed class InitializingState {}

final class InitializingInitial extends InitializingState {}

final class InitializingSuccessState extends InitializingState {
  InitializingSuccessState({required this.database});
  final Database database;
}

final class InitializingFailedState extends InitializingState {}

final class InitializeRetrievingSuccessState extends InitializingState {
  InitializeRetrievingSuccessState({required this.scheduleModelList});
  final List<ScheduleModel> scheduleModelList;
}

final class InitializeRetrievingFailedState extends InitializingState {}
