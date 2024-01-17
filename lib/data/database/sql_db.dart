import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InitializingDB {
  InitializingDB._internal();
  static final InitializingDB _instance = InitializingDB._internal();
  factory InitializingDB() => _instance;
  late Database database;

//==================================== initializing DB
  Future<Database?> initializeDB() async {
    String dbName = 'lift-pro.db';
    try {
      final p = await getDatabasesPath();
      String path = join(p, dbName);
      Logger().i("Path: $path");

      database = await openDatabase(path, version: 1);
      Logger().i("DB Created -- ${database.isOpen.toString()}");

      if (database.isOpen == true) {
        return database;
      } else {
        return null;
      }
    } catch (e) {
      Logger().e("Failed to create table - ${e.toString()}");
      return null;
    }
  }

//=============================== creating tables
  Future<void> createScheduleSetsTable(Database db) async {
    String tableName = 'schedule_sets';
    try {
      await db.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "set_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "set_name" VARCHAR(50) NOT NULL UNIQUE );""");
      Logger().i("TABLE CREATED SUCCESS");
    } catch (e) {
      Logger().e("Failed to create table - ${e.toString()}");
      // tShowError("Failed to create table - ${e.toString()}");
    }
  }

//=============================== INSERT DATA
  Future<void> insertDataToScheduleSetsTable(Database db, String name) async {
    String tableName = 'schedule_sets';
    try {
      int id = await db.rawInsert(
          '''INSERT INTO $tableName (set_name) VALUES (?)''', [name]);
    //  Logger().i("Data adding success - $id");
    } catch (e) {
    //  Logger().e("Data adding failed - ${e.toString()}");
    }
  }

//=============================== RETRIEVE ALL DATA
  Future<List<Map<String, dynamic>>> retrieveDataFromTable(Database db) async {
    String tableName = 'schedule_sets';
    try {
      List<Map<String, dynamic>> listOfMaps =
          await db.rawQuery('''SELECT * FROM $tableName''');
      Logger().i("Data adding success - ${listOfMaps.toString()}");
      return listOfMaps;
    } catch (e) {
      Logger().e("Data adding failed - ${e.toString()}");
      return [];
    }
  }

  //============================= SEARCH QUERY
  Future<List<Map<String, dynamic>>> searchDataFromTable(
      Database db, keyWord) async {
    String tableName = 'schedule_sets';
    String columnName = 'set_name';

    try {
      List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
          '''SELECT * FROM $tableName WHERE $columnName LIKE '%$keyWord%' ''');

      //Logger().i("Data Searching success - ${listOfMaps.toString()}");
      return listOfMaps;
    } catch (e) {
      Logger().e("Data Searching failed - ${e.toString()}");
      return [];
    }
  }
}
