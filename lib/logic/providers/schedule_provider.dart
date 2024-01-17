// import 'package:flutter/foundation.dart';
// import 'package:liftlogpro_app/model/schedule_model.dart';

// class ScheduleProvider extends ChangeNotifier {
//   List<ScheduleModel> _scheduleModels = [];

//   void addSchedule(String name) {
//     ScheduleModel model = ScheduleModel.insert(name: name);
//     _scheduleModels.add(model);
//     notifyListeners();
//   }

//   void updateSet(int index, String name) {
//     _scheduleModels[index].name = name;
//   }

//   void deleteSet(int index) {
//     _scheduleModels.removeAt(index);
//   }

//   List<ScheduleModel> get getSchedules => [..._scheduleModels];
// }
