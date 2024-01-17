import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:liftlogpro_app/data/database/sql_db.dart';
import 'package:liftlogpro_app/data/mockups/pre_schedule_sets.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'initializing_event.dart';
part 'initializing_state.dart';

class InitializingBloc extends Bloc<InitializingEvent, InitializingState> {
  InitializingBloc() : super(InitializingInitial()) {
    InitializingDB initializingDB = InitializingDB();
    on<InitializingEvent>((event, emit) async {
      if (event is StartInitializingEvent) {
        Database? db = await initializingDB.initializeDB();

        if (db == null) {
          emit(InitializingFailedState());
          return;
        }

        // First create the table
        await initializingDB.createScheduleSetsTable(db);

        // after creating the table
        for (var i = 0; i < preScheduleList.length; i++) {
          await initializingDB.insertDataToScheduleSetsTable(
              db, preScheduleList[i]);
        }

        emit(InitializeInsertingSuccessState());
      }
    });
  }
}
