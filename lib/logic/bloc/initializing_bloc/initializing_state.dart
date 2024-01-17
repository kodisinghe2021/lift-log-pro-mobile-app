part of 'initializing_bloc.dart';

@immutable
sealed class InitializingState {}

final class InitializingInitial extends InitializingState {}

final class InitializingSuccessState extends InitializingState {
  InitializingSuccessState({required this.database});
  final Database database;
}

final class InitializingFailedState extends InitializingState {}

final class InitializeInsertingSuccessState extends InitializingState {
}

final class InitializeRetrievingFailedState extends InitializingState {}
