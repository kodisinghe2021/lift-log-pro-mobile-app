part of '../../presentation/screens/home_tabs/shedule_screen/schedule_screen.dart';

class ScheduleScreenController extends GetxController {
//=======================================================RX VALUES
  final List<String> days = ["Day 01", "Day 02", "Day 03", "Day 04"];
  final TextEditingController setName = TextEditingController();
  final ScrollController scrollController = ScrollController();

  RxList<ScheduleModel> scheduledSetsList = RxList<ScheduleModel>();

  RxList<String> searchingList = RxList();

  RxString selectedDay = RxString("");
  RxBool isUpdate = RxBool(false);
  RxInt tappedIndex = RxInt(-1);

  InitializingDB _initializingDB = InitializingDB();
//=======================================================FUNCTIONS
// --- when typing suggest the set if available in the db
  Future<void> searchingScheduleSets(String keyWord) async {
    Database db = _initializingDB.database;

    if (db.isOpen == false) {
      return;
    }

    List<Map<String, dynamic>> lom =
        await _initializingDB.searchDataFromTable(db, keyWord);

    for (var i = 0; i < lom.length; i++) {
      String name = lom[i]['set_name']
          .toString()
          .split('-')
          .map((e) => e.capitalizeFirst)
          .join(' ');

      Logger().f("Result: ${name}");
    }
  }
}
