import 'dart:convert';
import 'package:get/utils.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheduleModel {
  int? setId;
  String setName;
  ScheduleModel({
    required this.setId,
    required this.setName,
  });

  ScheduleModel.insert({required this.setName});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'set_id': setId,
      'set_name': setName,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    String name = map['set_name']
        .toString()
        .split('-')
        .map((e) => e.capitalizeFirst)
        .join(' ');
    return ScheduleModel(
      setId: map['set_id'] != null ? map['set_id'] as int : null,
      setName: name,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) =>
      ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
