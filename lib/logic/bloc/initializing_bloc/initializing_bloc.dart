import 'package:bloc/bloc.dart';
import 'package:liftlogpro_app/model/schedule_model.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'initializing_event.dart';
part 'initializing_state.dart';

class InitializingBloc extends Bloc<InitializingEvent, InitializingState> {
  InitializingBloc.InitializingBloc() : super(InitializingInitial()) {
    on<InitializingEvent>((event, emit) {
      
    });
  }
}
