part of '../../presentation/screens/home_tabs/shedule_screen/schedule_screen.dart';

class ScheduleScreenController extends GetxController {
//=======================================================RX VALUES
  final List<String> days = ["Day 01", "Day 02", "Day 03", "Day 04"];
  final TextEditingController setName = TextEditingController();
  final ScrollController scrollController = ScrollController();

  RxList<ScheduleModel> searchedSSList = RxList<ScheduleModel>();
  RxList<ScheduleModel> addedSSList = RxList<ScheduleModel>();

  RxString selectedDay = RxString("");
  RxBool isUpdate = RxBool(false);
  RxInt tappedIndex = RxInt(-1);
  RxBool isSetSelected = RxBool(false);

  final InitializingDB _initializingDB = InitializingDB();
//=======================================================FUNCTIONS
// --- when typing suggest the set if available in the db
  Future<void> searchingScheduleSets(String keyWord) async {
    Database db = _initializingDB.database;

    if (db.isOpen == false) {
      return;
    }
    keyWord = keyWord.replaceAll(' ', '-');
    List<Map<String, dynamic>> lom =
        await _initializingDB.searchDataFromTable(db, keyWord);

    List<ScheduleModel> lst = [];

    for (var i = 0; i < lom.length; i++) {
      lst.add(ScheduleModel.fromMap(lom[i]));
      Logger()
          .i("length - ${lst.length} -- ${lst.last.setId}:${lst.last.setName}");
    }

    searchedSSList.value = lst;
  }

//----------------------------------- add to schedule
//---------set selected model
  late ScheduleModel _model;
  void setNewScheduleModel(ScheduleModel model) {
    isSetSelected.value = true;
    _model = model;
  }

  ScheduleModel get getNewScheduleModel => _model;

  void addToSchedule(ScheduleModel model) {
    addedSSList.add(model);
  }
}
