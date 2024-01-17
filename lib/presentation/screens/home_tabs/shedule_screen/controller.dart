part of 'schedule_screen.dart';

class ScheduleScreenController extends GetxController {
//=======================================================RX VALUES
  final List<String> days = ["Day 01", "Day 02", "Day 03", "Day 04"];
  final TextEditingController setName = TextEditingController();
  final ScrollController scrollController = ScrollController();

  RxList<ScheduleModel> scheduledSetsList = RxList<ScheduleModel>();
  RxString selectedDay = RxString("");
  RxBool isUpdate = RxBool(false);
  RxInt tappedIndex = RxInt(-1);
//=======================================================FUNCTIONS
//--------------------------------------------- DROP DOWN MENU

//--------------------------------------------- SAVE ITEM
  void saveItem() {
    // if (setName.text.isEmpty) {
    //   tShowWarning("Empty set Name");
    //   return;
    // }

    // scheduledSetsList.add(
    //   ScheduleModel(
    //     id: scheduledSetsList.length,
    //     name: setName.text,
    //   ),
    // );

    // setName.clear();
    // scrollController.animateTo(
    //   scrollController.position.maxScrollExtent,
    //   duration:const Duration(milliseconds: 300),
    //   curve: Curves.fastOutSlowIn,
    // );
  }

//--------------------------------------------- SAVE ITEM
  void updateItem(int index) {
    if (setName.text.isEmpty) {
      tShowWarning("Empty set Name");
      return;
    }
  //  scheduledSetsList[index].name = setName.text;
    setName.clear();
  }

  void addSchedule(String name) {
 //   ScheduleModel model = ScheduleModel.insert(name: name);
   // scheduledSetsList.add(model);
    update();
  }

  void updateSet(int index, String name) {}

  void deleteSet(int index) {
    scheduledSetsList.removeAt(index);
  }
}
